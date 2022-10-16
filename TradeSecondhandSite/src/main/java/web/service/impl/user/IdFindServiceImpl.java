package web.service.impl.user;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import web.dao.face.user.IdFindDao;
import web.dao.impl.user.IdFindDaoImpl;
import web.dto.User;
import web.service.face.user.IdFindService;

public class IdFindServiceImpl implements IdFindService {
	
	// DAO 객체
	private IdFindDao idFindDao = new IdFindDaoImpl();
	
	@Override
	public User getIdFindUser(HttpServletRequest req) {
		
		User user = new User();
		
		user.setUsername( req.getParameter("username") );
		user.setUseremail( req.getParameter("useremail") );
		
		return user;
	}
	
	@Override
	public boolean idFind(User user) {
		
		// 아이디 찾기 인증 성공
		if( idFindDao.selectCntByUsernameUseremail(JDBCTemplate.getConnection(), user) > 0 ) {
			return true;
		}
		
		// 아이디 찾기 인증 실패
		return false;
	}
	
	@Override
	public User info(User user) {
		return idFindDao.selectUserByUseremail(JDBCTemplate.getConnection(), user);
	}
	
}
