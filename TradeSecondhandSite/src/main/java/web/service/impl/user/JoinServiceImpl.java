package web.service.impl.user;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import web.dao.face.user.JoinDao;
import web.dao.impl.user.JoinDaoImpl;
import web.dto.User;
import web.service.face.user.JoinService;

public class JoinServiceImpl implements JoinService {

	// DAO 객체
	private JoinDao joinDao = new JoinDaoImpl();
	
	@Override
	public User getJoinUser(HttpServletRequest req) {
		
		User user = new User();
		
		user.setUserid( req.getParameter("userid") );
		user.setUserpw( req.getParameter("userpw") );
		user.setUsername( req.getParameter("username") );
		user.setUseremail( req.getParameter("useremail") );
		user.setUserphone( req.getParameter("userphone") );
		user.setUsergender( req.getParameter("usergender") );
//		user.setUserbirth( req.getParameter("userbirth") ); // DATE 값으로 받아야하는데...
		user.setUseraddr( req.getParameter("useraddr") );
		user.setUsernick( req.getParameter("usernick") );
		
		return user;
	}

	@Override
	public void join(User user) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		if( joinDao.insert(conn, user) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

	}

}