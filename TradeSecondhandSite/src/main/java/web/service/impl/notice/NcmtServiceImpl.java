package web.service.impl.notice;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import web.dao.face.notice.NcmtDao;
import web.dao.impl.notice.NcmtDaoImpl;
import web.dto.Ncomment;
import web.dto.Notice;
import web.service.face.notice.NcmtService;

public class NcmtServiceImpl implements NcmtService {

	
	private NcmtDao ncmtDao = new NcmtDaoImpl();
	
	@Override
	public List<Ncomment> getCmtList(String nno) {
		return ncmtDao.selectAllNcmt(JDBCTemplate.getConnection(), nno);
	}

	@Override
	public void ncmtWrite(HttpServletRequest req,  Ncomment ncomment) {
		
		//DB연결 객체
		Connection conn = JDBCTemplate.getConnection();

		if( ncmtDao.insertNcmt(conn, ncomment) > 0 ) {
			JDBCTemplate.commit(conn);
			
		} else {
			JDBCTemplate.rollback(conn);
		}
		
	}

	@Override
	public void ncmtUpdate(HttpServletRequest req, Ncomment ncomment) {
	
		//DB연결 객체
		Connection conn = JDBCTemplate.getConnection();

		if( ncmtDao.updateNcmt(conn, ncomment) > 0 ) {
			JDBCTemplate.commit(conn);
			
		} else {
			JDBCTemplate.rollback(conn);
		}		
		
	}

	@Override
	public void ncmtDelete(Ncomment ncomment) {
		
		//DB연결 객체
		Connection conn = JDBCTemplate.getConnection();

		if( ncmtDao.deleteNcmt(conn, ncomment) > 0 ) {
			JDBCTemplate.commit(conn);
			
		} else {
			JDBCTemplate.rollback(conn);
		}
	}

}
