package web.service.impl.trade;

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
import web.dao.face.trade.TradeDao;
import web.dao.impl.trade.TradeDaoImpl;
import web.dto.Trade;
import web.dto.TradeCmt;
import web.dto.TradeImg;
import web.service.face.trade.TradeService;


public class TradeServiceImpl implements TradeService {
	
	private TradeDao tradeDao = new TradeDaoImpl();

	@Override
	public Paging getPaging(HttpServletRequest req) {
		
		String param = req.getParameter("curPage");
		int curPage = 0;
		
		//현재 페이지 확인
		if( param != null && !"".equals(param) ) {
			curPage= Integer.parseInt(param);
		} else {
			System.out.println("curPage가 null이거나 비어있음");
		}
		
		//전체 게시물 수 조회
		int totalCont = tradeDao.selectCnt(JDBCTemplate.getConnection());
		
		//페이징 객체 생성
		Paging paging = new Paging(totalCont, curPage, 8, 5); //게시글 수 8 페이징 수 5
		
		//페이징 객체 반환
		return paging;
	}

	@Override
	public List<Trade> getList(Paging paging) {
		//게시글 전체 조회
		return tradeDao.selectAll(JDBCTemplate.getConnection(), paging);
	}

	@Override
	public Trade getSearch(HttpServletRequest req) {
		
		Trade serch = new Trade();
		
		//select 옵션에 따라 값 저장
		if(req.getParameter("searchField").equals("title")) {
			serch.setTitle(req.getParameter("searchText"));
		} else if(req.getParameter("searchField").equals("userid")){
			serch.setUserid(req.getParameter("searchText"));
		}
		
		return serch;
	}
	
	@Override
	public List<Trade> searchList(Trade search, Paging paging) {
		
		
		return tradeDao.selectAll(JDBCTemplate.getConnection(), search, paging);
	}
	
	@Override
	public Trade getTradeno(HttpServletRequest req) {
		
		Trade tradeno = new Trade();
		
		tradeno.setTradeno(Integer.parseInt(req.getParameter("tradeno")));
		
		return tradeno;
	}

	@Override
	public Trade view(Trade tradeno) {
		
		//db연결 객체
		Connection conn = JDBCTemplate.getConnection();
		
		//조회수 증가
		if(tradeDao.updateHit(conn, tradeno)>0) {
			JDBCTemplate.commit(null);
		}else {
			JDBCTemplate.rollback(null);
		}
		
		//게시글 번호 게시글 조회결과 반환
		return tradeDao.selectTradeByTradeNo(conn, tradeno);
	}

	@Override
	public void write(HttpServletRequest req) {
		
		//multipart/form-data 인코딩인지 확인
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		
		//인코딩 형식이 아닐경우 처리 중단
		if( !isMultipart ) {
			System.out.println("[ERROR] 파일 업로드 형식 데이터가 아님");
			return;
		}
		
		//파일 처리 설정 객체 생성
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		//메모리 처리 사이즈 설정
		int maxMem = 1 * 1024 * 1024;	
		factory.setSizeThreshold(maxMem);
		
		//서블릿 컨텍스트 객체(서블릿 실행 환경 정보를 담은 객체) 생성
		ServletContext context = req.getServletContext();
		
		//임시 파일 저장 폴더
		String path = context.getRealPath("tmp");
		File tmpRepository = new File(path);
		tmpRepository.mkdir();
		factory.setRepository(tmpRepository);
		
		//파일 업로드 수행 객체
		ServletFileUpload upload = new ServletFileUpload(factory);
				
		//파일 업로드 용량 제한
		int maxFile = 10 * 1024 * 1024; 
		upload.setFileSizeMax(maxFile);

		//파일 업로드된 데이터 파싱
		List<FileItem> items = null;
		try {
			items = upload.parseRequest(req);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		
		//게시글 정보 DTO객체
		Trade trade = new Trade();
				
		//게시글 첨부파일 정보 DTO객체
		TradeImg tradeImg = new TradeImg();
			
		//파일아이템의 반복자
		Iterator<FileItem> iter = items.iterator();

		while( iter.hasNext() ) {
			FileItem item = iter.next();
					
			//--- 1) 빈 파일에 대한 처리 ---
			if( item.getSize() <= 0 ) { //전달 데이터의 크기
				//빈 파일은 무시하고 다음 FileItem처리로 넘어간다
				continue;
			}
					
			//--- 2) 폼 필드(파일이 아닌 전달 파라미터)에 대한 처리 ---
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
				//제목
				if( "title".equals(key) ) {
					trade.setTitle(value);
				}
				//본문
				if( "content".equals(key) ) {
					trade.setContent(value);
				}
				//제품상태
				if( "productState".equals(key) ) {
					trade.setProductState(value);
				}
				//판매상태
				if( "saleState".equals(key) ) {
					trade.setSaleState(value);
				}
				//가격
				if( "price".equals(key) ) {
					trade.setPrice( Integer.parseInt(value));
				}
				//카테고리
				if( "category".equals(key) ) {
					trade.setCategory(value);
				}
				//전화번호
				if( "userphone".equals(key) ) {
					trade.setUserphone(value);
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
				tradeImg.setOriginName(item.getName());
				tradeImg.setStoredName(rename);
				tradeImg.setImgsize((int)item.getSize());
						
			} // if( !item.isFormField() ) end
					
		} // while( iter.hasNext() ) end

				
		//DB연결 객체
		Connection conn = JDBCTemplate.getConnection();
				
		//게시글 번호 생성
		int tradeno = tradeDao.selectNextTradeno(conn);
				
				
		//게시글 번호 삽입
		trade.setTradeno(tradeno);

		//작성자 ID 처리
		trade.setUserid( (String) req.getSession().getAttribute("userid") );
		
		//게시글 db에 입력
		if( tradeDao.insert(conn, trade) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

				
		//첨부파일 정보 삽입
		if( tradeImg.getImgsize() != 0 ) { //첨부 파일이 존재할 때에만 동작
					
			//게시글 번호 삽입 (FK)
			tradeImg.setTradeno(tradeno);
			
			//파일 정보 db에 입력
			if( tradeDao.insertImg(conn, tradeImg) > 0 ) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
					
		}
		
		
	}

	@Override
	public TradeImg viewImg(Trade tradeno) {
		
		return tradeDao.selectImg(JDBCTemplate.getConnection(), tradeno);
	}
	

	@Override
	public void update(HttpServletRequest req) {
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
		Trade trade = new Trade();
				
		//게시글 첨부파일 정보 DTO객체
		TradeImg trdaeImg = new TradeImg();
			
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
				//거래 글 번호
				if( "tradeno".equals(key) ) {
					trade.setTradeno(Integer.parseInt(value));
				}
				//제목
				if( "title".equals(key) ) {
					trade.setTitle(value);
				}
				//본문
				if( "content".equals(key) ) {
					trade.setContent(value);
				}
				//제품상태
				if( "productState".equals(key) ) {
					trade.setProductState(value);
				}
				//판매상태
				if( "saleState".equals(key) ) {
					trade.setSaleState(value);
				}
				//가격
				if( "price".equals(key) ) {
					trade.setPrice( Integer.parseInt(value));
				}
				//카테고리
				if( "category".equals(key) ) {
					trade.setCategory(value);
				}
				//전화번호
				if( "userphone".equals(key) ) {
					trade.setUserphone(value);
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
				trdaeImg.setOriginName(item.getName());
				trdaeImg.setStoredName(rename);
				trdaeImg.setImgsize((int)item.getSize());
						
			} // if( !item.isFormField() ) end
					
		} // while( iter.hasNext() ) end

				
		//DB연결 객체
		Connection conn = JDBCTemplate.getConnection();
				
		if( tradeDao.update(conn, trade) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

				
		//첨부파일 정보 삽입
		if( trdaeImg.getImgsize() != 0 ) { //첨부 파일이 존재할 때에만 동작
					
			//게시글 번호 삽입 (FK)
			trdaeImg.setTradeno(trade.getTradeno());
					
			if( tradeDao.updateImg(conn, trdaeImg) > 0 ) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
					
		}
	}

	@Override
	public void delete(Trade tradeno) {
		Connection conn = JDBCTemplate.getConnection();
		
		//이미지 삭제
		if(tradeDao.deleteImg(conn, tradeno ) > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		//게시글 삭제
		if(tradeDao.delete(conn, tradeno)>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
	}

	@Override
	public List<TradeCmt> viewCmt(Trade tradeno) {
		
		return tradeDao.selectCmt(JDBCTemplate.getConnection(), tradeno);
	}
	
	@Override
	public void writeCmt(HttpServletRequest req) {
		
		//DB연결 객체
		Connection conn = JDBCTemplate.getConnection();
						
		//댓글 번호 생성
		int cmtno = tradeDao.selectNextCmtno(conn);
		
		//아이디로 유저번호 조회
		int userno = tradeDao.selectUsernoByUserId(conn, req);
		
		TradeCmt tradecmt = new TradeCmt();
		
		tradecmt.setCmtno(cmtno);
		tradecmt.setUserno(userno);
		tradecmt.setTradeno(Integer.parseInt(req.getParameter("tradeno")));
		tradecmt.setCmtContent(req.getParameter("cmt"));
		
	}




}
