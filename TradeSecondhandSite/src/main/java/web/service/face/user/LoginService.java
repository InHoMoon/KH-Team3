package web.service.face.user;

import javax.servlet.http.HttpServletRequest;

import web.dto.User;

public interface LoginService {

	/**
	 * 로그인 정보 추출하기
	 * 
	 * @param req - 요청 정보 객체
	 * @return User - 로그인 정보 (userid, userpw)
	 */
	public User getLoginUser(HttpServletRequest req);

	/**
	 * 로그인 인증 처리
	 * 
	 * @param user - 로그인 정보 (userid, userpw)
	 * @return boolean - true: 인증성공, false: 인증실패 
	 */
	public boolean login(User user);

	/**
	 * 유저 정보 가져오기
	 * 
	 * @param user - 조회할 회원 아이디를 가진 객체
	 * @return User - 조회된 회원 정보 (userid, userpw, usernick)
	 */
	public User info(User user);

}
