package web.service.impl.user;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import web.dao.face.user.LoginDao;
import web.dao.impl.user.LoginDaoImpl;
import web.dto.User;
import web.service.face.user.LoginService;

public class LoginServiceImpl implements LoginService {

	// DAO 객체
	private LoginDao loginDao = new LoginDaoImpl();
	
	@Override
	public User getLoginUser(HttpServletRequest req) {
		
		User user = new User();
		
		user.setUserid( req.getParameter("userid") );
		user.setUserpw( req.getParameter("userpw") );
		
		return user;
	}
	
	@Override
	public boolean login(User user) {
		
		// 로그인 인증 성공
		if( loginDao.selectCntUserByUseridUserpw(JDBCTemplate.getConnection(), user) > 0 ) {
			return true;
		}
		
		// 로그인 인증 실패
		return false;
	}
	
	@Override
	public User info(User user) {
		return loginDao.selectUserByUserid(JDBCTemplate.getConnection(), user);
	}
	
}
