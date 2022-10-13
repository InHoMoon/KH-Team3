package web.service.impl.notice;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import common.JDBCTemplate;
import util.Paging;
import web.dao.face.notice.NoticeDao;
import web.dao.impl.notice.NoticeDaoImpl;
import web.dto.Nfile;
import web.dto.Notice;
import web.dto.NoticeImage;
import web.service.face.notice.NoticeService;

public class NoticeServiceImpl implements NoticeService {


	//DAO 객체
	private NoticeDao noticeDao = new NoticeDaoImpl();
	
	
	//게시글 전체 조회 결과 처리 (페이징X)
	@Override
	public List<Notice> getList() {
		return noticeDao.selectAll(JDBCTemplate.getConnection());
	}

	
	//게시글 전체 조회 결과 처리 (페이징)---
	@Override
	public List<Notice> getNoticeList(Paging paging) {
		return noticeDao.selectAll(JDBCTemplate.getConnection(), paging);
	}

	
	//이미지 포함 게시글 전체 조회 (페이징)
	@Override
	public List<NoticeImage> getNoticeImageList() {
		return noticeDao.selectAllImage(JDBCTemplate.getConnection());
	}
	
	
	
	//이미지 포함 게시글 전체 조회 (페이징)
	@Override
	public List<NoticeImage> getNoticeImageList(Paging paging) {
		return noticeDao.selectAllImage(JDBCTemplate.getConnection(), paging);
	}

	//게시글 페이징 객체 생성
	@Override
	public Paging getPaging(HttpServletRequest req) {
		
		//전달파라미터 curPage 추출하기
		String param = req.getParameter("curPage");
		int curPage = 0;
		if( param != null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		} else {
			System.out.println("[WARN]  NoticeService getPaging() - curpage가 null이거나 비어있습니다.");
		}
		
		//총 게시글 수 조회하기
		int totalCount = noticeDao.selectCntAll(JDBCTemplate.getConnection());
		
		//Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);	//기본(페이지당 게시글 수 10개)
//		Paging paging = new Paging(totalCount, curPage, 30);	//변형(페이지당 게시글 수 30개)
		
		
		return paging;
	}

	
	
	
	@Override
	public Notice getNoticeno(HttpServletRequest req) {
		
		//전달파라미터를 저장할 객체 생성
		Notice notice = new Notice();
		
		//요청정보에서 전달파라미터  nno 추출("String 형태")
		String param = req.getParameter("nno");
		
		if( param !=null && !"".equals(param) ) {
			notice.setNno( Integer.parseInt(param) ); //String->int 변환
		} else {
			System.out.println("!! NoticeService getNno() - nno값이 null이거나 비어있음");
		}
		
		return notice;
	}

	
	//글보기
	@Override
	public Notice view(Notice nno) {
		Connection conn = JDBCTemplate.getConnection();
		
		//조회수 증가
		if( noticeDao.updateHit(conn, nno) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		//게시글 조회
		Notice notice = noticeDao.selectNoticeByNno(conn, nno);
		
		//조회된 게시글 리턴
		return notice;
	}

	
	//글작성&첨부파일
	@Override
	public void write(HttpServletRequest req) {
		
		//--- 첨부파일 추가하여 게시글 작성 처리하기 ---
		
		//multipart/form-data 인코딩 확인
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		
		//multipar형식이 아닐 경우 처리 중단
		if( !isMultipart ) {
			System.out.println("[ERROR] 파일 업로드 형식 데이터가 아님");
			return;
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		//메모리 처리 사이즈 설정
		int maxMem = 1 * 1024 * 1024;	// 1 MB == 1048576 B
		factory.setSizeThreshold(maxMem);

		//서블릿 컨텍스트 객체
		ServletContext context = req.getServletContext();
		
		//임시 파일 저장 폴더
		String path = context.getRealPath("tmp");
		File tmpRepository = new File(path);
		tmpRepository.mkdir();
		factory.setRepository(tmpRepository);

		//파일 업로드 수행 객체
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		//파일 업로드 용량 제한
		int maxFile = 10 * 1024 * 1024; // 10MB
		upload.setFileSizeMax(maxFile);

		//파일 업로드된 데이터 파싱
		List<FileItem> items = null;
		try {
			items = upload.parseRequest(req);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		//게시글 정보 DTO객체
		Notice notice = new Notice();
		
		//게시글 첨부파일 정보 DTO객체
		Nfile nFile = new Nfile();
	
		//파일아이템의 반복자
		Iterator<FileItem> iter = items.iterator();

		while( iter.hasNext() ) {
			FileItem item = iter.next();
			
			//--- 1) 빈 파일에 대한 처리 ---
			if( item.getSize() <= 0 ) { //전달 데이터의 크기
				//빈 파일은 무시하고 다음 FileItem처리로 넘어간다
				continue;
			}
			
			//--- 2) 폼 필드에 대한 처리 ---
			if( item.isFormField() ) {
				
				//키(key) 추출하기
				String key = item.getFieldName();
				
				//값(value) 추출하기
				String value = null;
				
				try {
					value = item.getString("UTF-8"); //한글 인코딩 지정
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				
				//key에 맞게 value를 DTO에 삽입하기
				if( "ntitle".equals(key) ) {
					notice.setNtitle(value);
				}
				if( "ncontent".equals(key) ) {
					notice.setNcontent(value);
				}
				if( "ncategory".equals(key) ) {
					notice.setNcategory(value);
				}
				if( "ntop".equals(key) ) {
					notice.setNtop(Integer.parseInt(value));
				}
			} // if( item.isFormField() ) end
			
			
			
			//--- 3) 파일에 대한 처리 ---
			if( !item.isFormField() ) {
				
				//저장 파일명 처리
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssS");
				String rename = sdf.format(new Date()); //현재시간
				
				//파일 업로드 폴더
				File uploadFolder = new File( context.getRealPath("upload") );
				uploadFolder.mkdir();
				
				//업로드할 파일 객체 생성하기
				File up = new File(uploadFolder, rename);
				try {
					item.write(up);	//임시파일을 실제 업로드 파일로 출력한다
					item.delete(); //임시파일 제거
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				//업로드된 파일의 정보를 DTO객체에 저장하기
				nFile.setNfileoriginname(item.getName());
				nFile.setNfilestoredname(rename);
				nFile.setNfilesize((int)item.getSize());
				
			} // if( !item.isFormField() ) end
			
		} // while( iter.hasNext() ) end

		
		//DB연결 객체
		Connection conn = JDBCTemplate.getConnection();
		
		//게시글 번호 생성
		int nno = noticeDao.selectNextNno(conn);
		
		//게시글 번호 삽입
		notice.setNno(nno);

		
		if( noticeDao.insert(conn, notice) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		
		//첨부파일 정보 삽입
		if( nFile.getNfilesize() != 0 ) { //첨부 파일이 존재할 때에만 동작
			
			//게시글 번호 삽입 (FK)
			nFile.setNno(nno);
			
			if( noticeDao.insertFile(conn, nFile) > 0 ) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
			
		}
				
	}

	
	@Override
	public Nfile viewFile(Notice viewNotice) {
		return noticeDao.selectFile(JDBCTemplate.getConnection(), viewNotice);
	}

	
	@Override
	public void update(HttpServletRequest req) {
		
		//--- 첨부파일 추가하여 수정 처리하기 ---
		
		//multipart/form-data 인코딩 확인
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		
		//multipar형식이 아닐 경우 처리 중단
		if( !isMultipart ) {
			System.out.println("[ERROR] 파일 업로드 형식 데이터가 아님");
			return;
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		//메모리 처리 사이즈 설정
		int maxMem = 1 * 1024 * 1024;	// 1 MB == 1048576 B
		factory.setSizeThreshold(maxMem);

		//서블릿 컨텍스트 객체
		ServletContext context = req.getServletContext();
		
		//임시 파일 저장 폴더
		String path = context.getRealPath("tmp");
		File tmpRepository = new File(path);
		tmpRepository.mkdir();
		factory.setRepository(tmpRepository);

		//파일 업로드 수행 객체
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		//파일 업로드 용량 제한
		int maxFile = 10 * 1024 * 1024; // 10MB
		upload.setFileSizeMax(maxFile);

		//파일 업로드된 데이터 파싱
		List<FileItem> items = null;
		try {
			items = upload.parseRequest(req);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		//게시글 정보 DTO객체
		Notice notice = new Notice();
		
		//게시글 첨부파일 정보 DTO객체
		Nfile nFile = new Nfile();
	
		//파일아이템의 반복자
		Iterator<FileItem> iter = items.iterator();

		while( iter.hasNext() ) {
			FileItem item = iter.next();
			
			//--- 1) 빈 파일에 대한 처리 ---
			if( item.getSize() <= 0 ) { //전달 데이터의 크기
				//빈 파일은 무시하고 다음 FileItem처리로 넘어간다
				continue;
			}
			
			//--- 2) 폼 필드에 대한 처리 ---
			if( item.isFormField() ) {
				
				//키(key) 추출하기
				String key = item.getFieldName();
				
				//값(value) 추출하기
				String value = null;
				
				try {
					value = item.getString("UTF-8"); //한글 인코딩 지정
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				
				//key에 맞게 value를 DTO에 삽입하기
				if( "nno".equals(key) ) {
					notice.setNno(Integer.parseInt(value));
				}
				if( "ntitle".equals(key) ) {
					notice.setNtitle(value);
				}
				if( "ncontent".equals(key) ) {
					notice.setNcontent(value);
				}
				if( "ncategory".equals(key) ) {
					notice.setNcategory(value);
				}
				if( "ntop".equals(key) ) {
					notice.setNtop(Integer.parseInt(value));
				}
				
				
			} // if( item.isFormField() ) end
			
			
			
			//--- 3) 파일에 대한 처리 ---
			if( !item.isFormField() ) {
				
				//저장 파일명 처리
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssS");
				String rename = sdf.format(new Date()); //현재시간
				
				//파일 업로드 폴더
				File uploadFolder = new File( context.getRealPath("upload") );
				uploadFolder.mkdir();
				
				//업로드할 파일 객체 생성하기
				File up = new File(uploadFolder, rename);
				try {
					item.write(up);	//임시파일을 실제 업로드 파일로 출력한다
					item.delete(); //임시파일 제거
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				//업로드된 파일의 정보를 DTO객체에 저장하기
				nFile.setNfileoriginname(item.getName());
				nFile.setNfilestoredname(rename);
				nFile.setNfilesize((int)item.getSize());
				
			} // if( !item.isFormField() ) end
			
		} // while( iter.hasNext() ) end

		
		//DB연결 객체
		Connection conn = JDBCTemplate.getConnection();

		if( noticeDao.update(conn, notice) > 0 ) {
			JDBCTemplate.commit(conn);
			System.out.println(notice);
		} else {
			JDBCTemplate.rollback(conn);
		}

		//첨부 파일 전부 삭제
		if(noticeDao.deleteFile(conn, notice) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		//첨부파일 정보 삽입
		if( nFile.getNfilesize() != 0 ) { //첨부 파일이 존재할 때에만 동작
			
			//게시글 번호 삽입 (FK)
			nFile.setNno(notice.getNno());
			
			if( noticeDao.insertFile(conn, nFile) > 0 ) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
			
		}
				
	}
	
	
	@Override
	public void delete(Notice notice) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		//첨부 파일 전부 삭제
		if(noticeDao.deleteFile(conn, notice) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		//게시글 삭제
		if(noticeDao.delete(conn, notice) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
	}

	
	//-------------검색 (페이징없) -------------------
	@Override
	public List<Notice> getSearch(String keyWord, String searchWord) {
		return noticeDao.selectAllSearch(JDBCTemplate.getConnection(), keyWord, searchWord);
	}

	@Override
	public List<NoticeImage> getImgSearch(String keyWord, String searchWord) {
		return noticeDao.selectAllImgSearch(JDBCTemplate.getConnection(), keyWord, searchWord);
	}

	//--------검색 (페이징있)
	@Override
	public Paging getSearchPaging(HttpServletRequest req, String keyWord, String searchWord) {
		
		//전달파라미터 curPage 추출하기
		String param = req.getParameter("curPage");
		
		int curPage = 0;
		if( param != null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		} else {
			System.out.println("[WARN]  NoticeService getPaging() - curpage가 null이거나 비어있습니다.");
		}
		
		//총 게시글 수 조회하기
		int totalCount = noticeDao.selectCntSearch(JDBCTemplate.getConnection(), keyWord, searchWord );
		
		//Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);	//기본(페이지당 게시글 수 10개)
//		Paging paging = new Paging(totalCount, curPage, 30);	//변형(페이지당 게시글 수 30개)
		
		
		return paging;
	}
	
	@Override
	public List<Notice> getNoticeSearchList(Paging paging, String keyWord, String searchWord) {
		
		// 검색 게시글 전체 조회 결과 처리(페이징)
		
		return noticeDao.selectAllSearch(JDBCTemplate.getConnection(), paging, keyWord, searchWord );
	}

	

}
