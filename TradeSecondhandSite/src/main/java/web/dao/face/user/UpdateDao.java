package web.dao.face.user;

import java.sql.Connection;

import web.dto.Ufile;
import web.dto.User;

public interface UpdateDao {

	/**
	 * 지정된 userno의 게시글 조회하기
	 * 
	 * @param conn - DB 연결 객체
	 * @param userno - 조회할 게시글의 userno를 가긴 DTO객체
	 * @return User - 조회된 게시글의 상세정보 DTO객체
	 */
	public User selectUserByUserno(Connection conn, User userno);
	
	/**
	 * 첨부파일 정보 조회
	 * 
	 * @param conn - DB 연결 객체
	 * @param updateUser - 조회할 게시글 번호
	 * @return Ufile - 첨부파일 정보
	 */
	public Ufile selectFile(Connection conn, User updateUser);

	/**
	 * 회원 정보 수정
	 * 
	 * @param conn - DB 연결 객체
	 * @param user - 회원수정 정보 객체
	 * @return int - UPDATE 수행 결과
	 */
	public int update(Connection conn, User user);

	/**
	 * 첨부파일 삽입
	 * 
	 * @param conn - DB 연결 객체
	 * @param ufile - 첨부파일 정보
	 * @return int - INSERT 수행 결과
	 */
	public int insertFile(Connection conn, Ufile ufile);

	/**
	 * 비밀번호 수정
	 * 
	 * @param conn - DB 연결 객체
	 * @param user - 회원수정 정보 객체
	 * @return - UPDATE 수행 결과
	 */
	public int updatePw(Connection conn, User user);



}
