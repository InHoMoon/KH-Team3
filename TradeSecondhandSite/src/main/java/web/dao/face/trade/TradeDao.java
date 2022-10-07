package web.dao.face.trade;

import java.sql.Connection;
import java.util.List;

import util.Paging;
import web.dto.Trade;



public interface TradeDao {
	/**
	 *  총 게시물 수 반환
	 * @param conn db연결 객체
	 * @return 총 게시물 수
	 */
	public int selectCnt(Connection conn);

	/**
	 * 테이블 전체 조회
	 * @param conn db연결 객체
	 * @param paging 페이징 정보 객체
	 * @return 테이블 전체 정보
	 */
	public List<Trade> selectAll(Connection conn, Paging paging);

	/**
	 * 테이블 전체 조회
	 * @param connection db연결 객체
	 * @param search 검색 정보 객체
	 * @param paging 페이징 정보 객체
	 * @return 테이블 전체 정보
	 */
	public List<Trade> selectAll(Connection conn, Trade search, Paging paging);

	/**
	 * 조회수 증가
	 * @param conn DB연결 객체
	 * @param tradeno 게시글 번호
	 * @return update쿼리 결과
	 */
	public int updateHit(Connection conn, Trade tradeno);

	/**
	 * 게시물 번호로 게시물 상세 조회
	 * @param conn db연결 객체
	 * @param tradeno 게시물 번호
	 * @return 조회결과 객체
	 */
	public Trade selectTradeByTradeNo(Connection conn, Trade tradeno);

}
