package web.dao.face.trade;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.Trade;
import web.dto.TradeCmt;
import web.dto.TradeImg;



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
	
	/**
	 * 시퀀스를 통해 다음 게시글 번호 조회
	 * @param conn db연결 객체
	 * @return 다음 게시글 번호 반환
	 */
	public int selectNextTradeno(Connection conn);
	
	
	/**
	 * 게시글 입력
	 * @param conn db연결 객체
	 * @param trade 입력될 게시글 내용
	 * @return
	 */
	public int insert(Connection conn, Trade trade);
	
	
	/**
	 * 이미지 입력
	 * @param conn db연결 객체
	 * @param tradeImg
	 * @return
	 */
	public int insertImg(Connection conn, TradeImg tradeImg);

	
	/**
	 * 거래글 번호로 첨부 이미지 정보 조회
	 * @param conn db연결 객체
	 * @param tradeno 거래글 번호
	 * @return 이미지 정보 조회 결과
	 */
	public TradeImg selectImg(Connection conn, Trade tradeno);
	
	/**
	 * 거래글 수정
	 * @param conn db연결 객체
	 * @param trade 수정 내용 객체
	 * @return 거래글 수정 결과
	 */
	public int update(Connection conn, Trade trade);

	/**
	 * 거래글 이미지 수정
	 * @param conn
	 * @param tradeImg
	 * @return
	 */
	public int updateImg(Connection conn, TradeImg tradeImg);

	/**
	 * 거래글 첨부 이미지 삭제
	 * @param conn
	 * @param tradeno
	 * @return
	 */
	public int deleteImg(Connection conn, Trade tradeno);

	/**
	 * 거래글 삭제
	 * @param conn
	 * @param tradeno
	 * @return
	 */
	public int delete(Connection conn, Trade tradeno);

	/**
	 * 시퀀스를 통해 다음 댓글번호 조회
	 * @param conn
	 * @return
	 */
	public int selectNextCmtno(Connection conn);

	/**
	 * 입력 받은 userid로 userno검색
	 * @param conn db연결 객체
	 * @param req 전달파라미터 객체
	 * @return
	 */
	public int selectUsernoByUserId(Connection conn, HttpServletRequest req);
	
	
	/**
	 * 거래글 번호로 댓글 상세 조회
	 * @param conn
	 * @param tradeno
	 * @return
	 */
	public List<TradeCmt> selectCmt(Connection conn, Trade tradeno);

	/**
	 * 댓글 입력
	 * @param conn db 연결 객체
	 * @param tradeCmt
	 * @return
	 */
	public int insertCmt(Connection conn, TradeCmt tradeCmt);

	/**
	 * 댓글 삭제
	 * @param conn
	 * @param req
	 * @return
	 */
	public int deleteCmt(Connection conn, HttpServletRequest req);

	/**
	 * 댓글 번호로 게시물 번호 조회하기
	 * @param conn
	 * @param req
	 * @return
	 */
	public int selectTradenoByCmtno(Connection conn, HttpServletRequest req);

	
	/**
	 * 게시물 번호로 카테고리 가저오기
	 * @param conn
	 * @param tradeno
	 * @return
	 */
	public String selectCategoryByTradeno(Connection conn,Trade tradeno);

	/**
	 * 카테고리 번호로 관련상품 리스트 가저오기
	 * @param conn
	 * @param category
	 * @return
	 */
	public List<Trade> selectListByCategory(Connection conn, String category);

	/**
	 * 게시물 번호로 댓글 삭제
	 * @param conn
	 * @param tradeno
	 * @return
	 */
	public int deleteAllCmt(Connection conn, Trade tradeno);


	

}
