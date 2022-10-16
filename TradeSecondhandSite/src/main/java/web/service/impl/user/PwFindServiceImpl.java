package web.service.impl.user;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import web.dao.face.user.PwFindDao;
import web.dao.impl.user.PwFindDaoImpl;
import web.dto.User;
import web.service.face.user.PwFindService;

public class PwFindServiceImpl implements PwFindService {

	// DAO 객체
	private PwFindDao pwFindDao = new PwFindDaoImpl();
	
	@Override
	public User getPwFindUser(HttpServletRequest req) {
		
		User user = new User();
		
		user.setUserid( req.getParameter("userid") );
		user.setUsername( req.getParameter("username") );
		user.setUseremail( req.getParameter("useremail") );
		
		return user;
		
	}
	
	@Override
	public boolean pwFind(User user) {
		
		// 비밀번호 찾기 인증 성공
		if( pwFindDao.selectCntByUseridUsernameUseremail(JDBCTemplate.getConnection(), user) > 0 ) {
			return true;
		}
		
		// 비밀번호 찾기 인증 실패
		return false;
	}
	
}
