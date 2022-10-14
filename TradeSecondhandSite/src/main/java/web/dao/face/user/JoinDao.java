package web.dao.face.user;

import java.sql.Connection;

import web.dto.Ufile;
import web.dto.User;

public interface JoinDao {

	/**
	 * 회원 정보 삽입
	 * 
	 * @param conn - DB 연결 객체
	 * @param user - 삽입될 회원 정보 객체
	 * @return int - INSERT 수행 결과
	 */
	public int insert(Connection conn, User user);

	/**
	 * 시퀀스를 이용하여 다음 회원 번호 조회하기
	 * 
	 * @param conn - DB 연결 객체
	 * @return - 다음 회원 번호
	 */
	public int selectNextUserno(Connection conn);

	/**
	 * 프로필 사진 삽입
	 * 
	 * @param conn - DB 연결 객체
	 * @param ufile - 프로필 사진 정보
	 * @return INSERT 수행 결과
	 */
	public int insertFile(Connection conn, Ufile ufile);

}
