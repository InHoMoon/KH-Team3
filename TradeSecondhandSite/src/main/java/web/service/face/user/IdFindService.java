package web.service.face.user;

import javax.servlet.http.HttpServletRequest;

import web.dto.User;

public interface IdFindService {

	/**
	 * 아이디 찾기 정보 추출하기
	 * 
	 * @param req - 요청 정보 객체
	 * @return User - 아이디 찾기 정보 (username, useremail)
	 */
	public User getIdFindUser(HttpServletRequest req);

	/**
	 * 아이디 찾기 인증 처리
	 * 
	 * @param user - 아이디 찾기 정보 (username, useremail)
	 * @return boolean - true: 인증성공, false: 인증실패 
	 */
	public boolean idFind(User user);

	/**
	 * 유저 정보 가져오기
	 * 
	 * @param user - 조회할 회원 아이디를 가진 객체
	 * @return User - 조회된 회원 정보 (userid, username, useremail)
	 */
	public User info(User user);

}
