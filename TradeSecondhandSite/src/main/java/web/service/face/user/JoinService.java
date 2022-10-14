package web.service.face.user;

import javax.servlet.http.HttpServletRequest;

import web.dto.Ufile;
import web.dto.User;

public interface JoinService {

	/**
	 * 회원정보 입력
	 * 입력한 회원정보를 DB에 저장한다
	 * 
	 * @param req - 요청 정보 객체
	 */
	public void join(HttpServletRequest req);

}
