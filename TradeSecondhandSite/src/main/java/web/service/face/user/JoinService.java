package web.service.face.user;

import javax.servlet.http.HttpServletRequest;

import web.dto.User;

public interface JoinService {

	/**
	 * 회원가입 정보 추출하기
	 * 
	 * @param req - 요청 정보 객체
	 * @return User - 회원가입 정보 객체 (userid, userpw, usernick)
	 */
	public User getJoinUser(HttpServletRequest req);

	/**
	 * 회원가입 처리
	 * 
	 * @param user - 회원가입 정보 객체
	 */
	public void join(User user);

}
