package web.dao.face.user;

import java.sql.Connection;

import web.dto.User;

public interface JoinDao {

	/**
	 * 회원 정보 삽입
	 * 
	 * @param conn - DB 연결 객체
	 * @param user - 회원가입 정보 객체
	 * @return int - INSERT 수행 결과
	 */
	public int insert(Connection conn, User user);

}
