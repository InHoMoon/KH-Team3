package web.dao.face.mypage;

import java.sql.Connection;
import java.util.List;

import util.Paging;
import web.dto.Trade;

public interface MypostDao {

	/**
	 * 테이블 전체 조회
	 * 
	 * @param conn - DB연결 객체
	 * @param paging  - 페이징 정보 객체
	 * @return List<Trade> - 테이블 전체 정보
	 */
	public List<Trade> selectAll(Connection conn, Paging paging, int userno);
	
	/**
	 * 전체 게시글 수 카운트
	 *  
	 * @param conn - DB연결 객체
	 * @return int - 전체 게시글 수
	 */
	public int selectCnt(Connection conn, int userno);
}