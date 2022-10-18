package web.service.face.user;

import javax.servlet.http.HttpServletRequest;

import web.dto.User;

public interface JoinService {

	/**
	 * 회원정보 입력
	 * 입력한 회원정보를 DB에 저장한다
	 * 
	 * @param req - 요청 정보 객체
	 */
	public void join(HttpServletRequest req);

	/**
	 * 아이디 정보 추출하기
	 * 
	 * @param req - 요청 정보 객체
	 * @return User - 아이디 정보 (userid)
	 */
	public User getCheckId(HttpServletRequest req);

	/**
	 * 아이디 중복체크 인증 처리
	 * 
	 * @param user - 신규 아이디 정보 (userid)
	 * @return boolean - true: 인증성공, false: 인증실패 
	 */
	public boolean checkId(User user);

}
