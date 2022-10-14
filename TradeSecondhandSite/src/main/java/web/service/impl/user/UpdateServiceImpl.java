package web.service.impl.user;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import web.dao.face.user.UpdateDao;
import web.dao.impl.user.UpdateDaoImpl;
import web.dto.User;
import web.service.face.user.UpdateService;

public class UpdateServiceImpl implements UpdateService {

	// DAO 객체
	private UpdateDao updateDao = new UpdateDaoImpl();
	
	@Override
	public User getUpdateUser(HttpServletRequest req) {
		
		User user = new User();
		
		user.setUserid( req.getParameter("userid") );
		user.setUserpw( req.getParameter("userpw") );
		user.setUseremail( req.getParameter("useremail") );
		user.setUserphone( req.getParameter("userphone") );
		user.setUseraddr1( req.getParameter("useraddr1") );
		user.setUseraddr2( req.getParameter("useraddr2") );
		user.setUseraddr3( req.getParameter("useraddr3") );
		user.setUsergender( req.getParameter("usergender") );
		user.setUserbirth( req.getParameter("userbirth") );
		user.setUsernick( req.getParameter("usernick") );
		
		return user;
	}
	
	@Override
	public void update(User user) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		if( updateDao.update(conn, user) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
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
