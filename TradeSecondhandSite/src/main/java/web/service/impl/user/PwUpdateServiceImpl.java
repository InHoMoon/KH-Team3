package web.service.impl.user;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import web.dao.face.user.PwUpdateDao;
import web.dao.impl.user.PwUpdateDaoImpl;
import web.dto.User;
import web.service.face.user.PwUpdateService;

public class PwUpdateServiceImpl implements PwUpdateService {
	
	// DAO 객체
	private PwUpdateDao pwUpdateDao = new PwUpdateDaoImpl();
	
	@Override
	public User getpwUpdate(HttpServletRequest req) {
		
		User user = new User();
		
		user.setUserid( req.getParameter("userid") );
		user.setUserpw( req.getParameter("userpw") );
		
		return user;
	}
	
	@Override
	public void update(User user) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		if( pwUpdateDao.update(conn, user) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
	}
	
}
