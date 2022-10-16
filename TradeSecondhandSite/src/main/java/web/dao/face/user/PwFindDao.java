package web.dao.face.user;

import java.sql.Connection;

import web.dto.User;

public interface PwFindDao {

	/**
	 * userid, username, useremail을 동시에 만족하는 회원의 수를 조회한다
	 * 	-> 비밀번호 찾기 인증값으로 사용한다
	 * 
	 * @param conn - DB 연결 객체
	 * @param user - 조회할 회원의 정보
	 * @return int - 0: 존재하지 않는 회원, 1: 존재하는 회원
	 */
	public int selectCntByUseridUsernameUseremail(Connection conn, User user);

}
