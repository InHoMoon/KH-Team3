package web.dao.face.user;

import java.sql.Connection;

import web.dto.User;

public interface UserUpdateDao {

	/**
	 * 회원 정보 수정
	 * 
	 * @param conn - DB 연결 객체
	 * @param user - 회원수정 정보 객체
	 * @return int - UPDATE 수행 결과
	 */
	public int update(Connection conn, User user);

}
