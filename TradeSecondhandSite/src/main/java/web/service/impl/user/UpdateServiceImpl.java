package web.service.impl.user;

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
import web.dao.face.user.UpdateDao;
import web.dao.impl.user.UpdateDaoImpl;
import web.dto.Ufile;
import web.dto.User;
import web.service.face.user.UpdateService;

public class UpdateServiceImpl implements UpdateService {

	// DAO 객체
	private UpdateDao updateDao = new UpdateDaoImpl();
	
	@Override
	public User getUserno(HttpServletRequest req) {
		
		// 전달파라미터를 저장할 객체 생성
		User user = new User();
		
		String param = req.getParameter("userno");
		if( param != null && !"".equals(param) ) {
			user.setUserno( Integer.parseInt(param) );
		} else {
			System.out.println("[WARN] UpdateService getUserno() - userno값이 null이거나 비어있음");
		}
		
		return user;
	}
	
	@Override
	public User view(User userno) {
		return updateDao.selectUserByUserno(JDBCTemplate.getConnection(), userno);
	}
	
	@Override
	public Ufile viewFile(User updateUser) {
		
		return updateDao.selectFile(JDBCTemplate.getConnection(), updateUser);
		
	}
	
	@Override
	public void update(HttpServletRequest req) {
		
		// multipart/form-data 인코딩 확인
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		
		// multipart 형식이 아닐 경우 처리 중단
		if( !isMultipart ) {
			System.out.println("[ERROR] 파일 업로드 형식 데이터가 아님");
			return;
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		// 메모리 처리 사이즈 설정
		int maxMem = 1 * 1024 * 1024;	// 1 MB == 1048576 B
		factory.setSizeThreshold(maxMem);

		// 서블릿 컨텍스트 객체
		ServletContext context = req.getServletContext();
		
		// 임시 파일 저장 폴더
		String path = context.getRealPath("tmp");
		File tmpRepository = new File(path);
		tmpRepository.mkdir();
		factory.setRepository(tmpRepository);

		// 파일 업로드 수행 객체
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		// 파일 업로드 용량 제한
		int maxFile = 10 * 1024 * 1024; // 10MB
		upload.setFileSizeMax(maxFile);

		// 파일 업로드된 데이터 파싱
		List<FileItem> items = null;
		try {
			items = upload.parseRequest(req);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		// 회원 정보 DTO객체
		User user = new User();
		
		// 프로필 사진 정보 DTO객체
		Ufile ufile = new Ufile();
	
		// 파일아이템의 반복자
		Iterator<FileItem> iter = items.iterator();

		while( iter.hasNext() ) {
			FileItem item = iter.next();
			
			//--- 1) 빈 파일에 대한 처리 ---
			if( item.getSize() <= 0 ) { // 전달 데이터의 크기
				// 빈 파일은 무시하고 다음 FileItem처리로 넘어간다
				continue;
			}
			
			//--- 2) 폼 필드에 대한 처리 ---
			if( item.isFormField() ) {
				
				// 키(key) 추출하기
				String key = item.getFieldName();
				
				// 값(value) 추출하기
				String value = null;
				try {
					value = item.getString("UTF-8"); // 한글 인코딩 지정
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				
				// key에 맞게 value를 DTO에 삽입하기
				if( "userno".equals(key) ) {
					user.setUserno(Integer.parseInt(value));
				}
				if( "userid".equals(key) ) {
					user.setUserid(value);
				}
				if( "userpw".equals(key) ) {
					user.setUserpw(value);
				}
				if( "username".equals(key) ) {
					user.setUsername(value);
				}
				if( "useremail".equals(key) ) {
					user.setUseremail(value);
				}
				if( "userphone".equals(key) ) {
					user.setUserphone(value);
				}
				if( "useraddr1".equals(key) ) {
					user.setUseraddr1(value);
				}
				if( "useraddr2".equals(key) ) {
					user.setUseraddr2(value);
				}
				if( "useraddr3".equals(key) ) {
					user.setUseraddr3(value);
				}
				if( "usergender".equals(key) ) {
					user.setUsergender(value);
				}
				if( "userbirth".equals(key) ) {
					user.setUserbirth(value);
				}
				if( "usernick".equals(key) ) {
					user.setUsernick(value);
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
				ufile.setUfileoriginname(item.getName());
				ufile.setUfilestoredname(rename);
				ufile.setUfilesize((int)item.getSize());
				
			} // if( !item.isFormField() ) end
			
		} // while( iter.hasNext() ) end
			
		// DB 연결 객체
		Connection conn = JDBCTemplate.getConnection();
		
		if( updateDao.update(conn, user) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		// 첨부파일 정보 삽입
		if( ufile.getUfilesize() != 0 ) { // 첨부 파일이 존재할 때에만 동작
			
			// 회원 번호 삽입 (FK)
			ufile.setUserno(user.getUserno());
			
			if( updateDao.insertFile(conn, ufile) > 0 ) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
			
		}
		
		//------------------------------------------
		
	}
	
	@Override
	public User getUpdateUserpw(HttpServletRequest req) {
		
		User user = new User();
		
		user.setUserid( req.getParameter("userid") );
		user.setUserpw( req.getParameter("userpw") );
		
		return user;
	}
	
	@Override
	public void updatePw(User user) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		if( updateDao.updatePw(conn, user) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
	}
	
}
