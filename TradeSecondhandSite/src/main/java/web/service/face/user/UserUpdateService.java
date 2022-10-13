package web.service.face.user;

import javax.servlet.http.HttpServletRequest;

import web.dto.User;

public interface UserUpdateService {

	/**
	 * 회원 정보 추출하기
	 * 
	 * @param req - 요청 정보 객체
	 * @return User - 회원수정 정보 객체 ( userpw, useremail, userphone, usergender, userbirth, useraddr, usernick )
	 */
	public User getUpdateUser(HttpServletRequest req);

	/**
	 * 전달된 데이터를 이용하여 회원정보 수정
	 * 
	 * @param user - 회원수정 정보 객체 ( userpw, useremail, userphone, usergender, userbirth, useraddr, usernick )
	 */
	public void update(User user);
	
	

}
