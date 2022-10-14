package web.service.impl.user;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import web.dao.face.user.FindDao;
import web.dao.impl.user.FindDaoImpl;
import web.dto.User;
import web.service.face.user.FindService;

public class FindServiceImpl implements FindService {
	
	// DAO 객체
	private FindDao findDao = new FindDaoImpl();
	
	@Override
	public User getFindUserid(HttpServletRequest req) {
		
		User user = new User();
		
		user.setUsername( req.getParameter("username") );
		user.setUseremail( req.getParameter("useremail") );
		
		return user;
	}
	
	@Override
	public boolean findId(User user) {
		
		// 아이디 찾기 인증 성공
		if( findDao.selectCntByUsernameUseremail(JDBCTemplate.getConnection(), user) > 0 ) {
			return true;
		}
		
		// 아이디 찾기 인증 실패
		return false;
	}
	
	@Override
	public User info(User user) {
		return findDao.selectUserByUseremail(JDBCTemplate.getConnection(), user);
	}
	
	@Override
	public User getFindUserpw(HttpServletRequest req) {
		
		User user = new User();
		
		user.setUserid( req.getParameter("userid") );
		user.setUsername( req.getParameter("username") );
		user.setUseremail( req.getParameter("useremail") );
		
		return user;
	}
	
	@Override
	public boolean findPw(User user) {
		
		// 비밀번호 찾기 인증 성공
		if( findDao.selectCntByUseridUsernameUseremail(JDBCTemplate.getConnection(), user) > 0 ) {
			return true;
		}
		
		// 비밀번호 찾기 인증 실패
		return false;
	}
	
}
