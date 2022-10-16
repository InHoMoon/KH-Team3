package web.service.impl.notice;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import web.dao.face.notice.NcmtDao;
import web.dao.impl.notice.NcmtDaoImpl;
import web.dto.Ncomment;
import web.service.face.notice.NcmtService;

public class NcmtServiceImpl implements NcmtService {

	
	private NcmtDao ncmtDao = new NcmtDaoImpl();
	
	
	@Override
	public Ncomment getNcmtParam(HttpServletRequest req) {
		
		Ncomment ncmt = null;
				
		int nno = Integer.parseInt(req.getParameter("nno") ); 
		String userid = req.getParameter("userid"); 
		String ncmtcomment = req.getParameter("ncmtcomment");
		
		ncmt.setNno(nno);
		ncmt.setNcmtcontent(ncmtcomment);
		ncmt.setUserid(userid);
		
		return null;
	}
	
	
	
	@Override
	public List<Ncomment> getCmtList(int nno) {
		return ncmtDao.selectAllNcmt(JDBCTemplate.getConnection(), nno);
	}

	
	//댓글 작성
	@Override
	public void ncmtWrite(HttpServletRequest req) {
		

		//댓글 담을 객체
		Ncomment ncmt = new Ncomment();
		
		// 전달값 받기
		int nno = Integer.parseInt(req.getParameter("nno") );
		String userid = req.getParameter("userid"); 
		String ncmtcomment = req.getParameter("ncmtcomment");
		
		// 전달값 객체에 저장
		ncmt.setNno(nno);
		ncmt.setNcmtcontent(ncmtcomment);
		ncmt.setUserid(userid);
		
		//DB연결 객체
		Connection conn = JDBCTemplate.getConnection();

		if( ncmtDao.insertNcmt(conn, ncmt) > 0 ) {
			JDBCTemplate.commit(conn);
			
		} else {
			JDBCTemplate.rollback(conn);
		}
		
	}

	//댓글 수정
	@Override
	public void ncmtUpdate(HttpServletRequest req, int ncmtid) {
	
		//댓글 담을 객체
		Ncomment ncmt = new Ncomment();
		
		// 전달값 받기
		int nno = Integer.parseInt(req.getParameter("nno") );
		String userid = req.getParameter("userid"); 
		String ncmtcomment = req.getParameter("ncmtcomment");
		
		// 전달값 객체에 저장
		ncmt.setNno(nno);
		ncmt.setNcmtcontent(ncmtcomment);
		ncmt.setUserid(userid);
		
		//DB연결 객체
		Connection conn = JDBCTemplate.getConnection();

		if( ncmtDao.updateNcmt(conn, ncmt, ncmtid) > 0 ) {
			JDBCTemplate.commit(conn);
			
		} else {
			JDBCTemplate.rollback(conn);
		}		
		
	}

	//댓글 삭제
	@Override
	public void ncmtDelete(int ncmtid) {
		
		//DB연결 객체
		Connection conn = JDBCTemplate.getConnection();

		if( ncmtDao.deleteNcmt(conn, ncmtid) > 0 ) {
			JDBCTemplate.commit(conn);
			
		} else {
			JDBCTemplate.rollback(conn);
		}
	}



}
