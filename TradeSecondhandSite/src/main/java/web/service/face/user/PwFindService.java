package web.service.face.user;

import javax.servlet.http.HttpServletRequest;

import web.dto.User;

public interface PwFindService {

	/**
	 * 비밀번호 찾기 정보 추출하기
	 * 
	 * @param req - 요청 정보 객체
	 * @return User - 비밀번호 찾기 정보 (userid, username, useremail)
	 */
	public User getPwFindUser(HttpServletRequest req);

	/**
	 * 비밀번호 찾기 인증 처리
	 * 
	 * @param user - 비밀번호 찾기 정보 (userid, username, useremail)
	 * @return boolean - true: 인증성공, false: 인증실패 
	 */
	public boolean pwFind(User user);

}
