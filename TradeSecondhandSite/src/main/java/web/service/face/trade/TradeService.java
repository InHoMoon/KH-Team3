package web.service.face.trade;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.Trade;
import web.dto.TradeCmt;
import web.dto.TradeImg;



public interface TradeService {

	
	/**
	 * 게시글 페이징 객체 생성 
	 * @param req 요청 정보 객체
	 * @return 페이징 계산된 객체
	 */
	public Paging getPaging(HttpServletRequest req);

	/**
	 * 페이징 객체로 게시글 전체 조회
	 * @param paging 페이징 정보 객체
	 * @return 게시글 전체조회 결과 리스트
	 */
	public List<Trade> getList(Paging paging);
	
	/**
	 * 전달파라미터 저장
	 * @param req 전달파라미터 
	 * @return 검색내용 저장한 객체
	 */
	public Trade getSearch(HttpServletRequest req);
	
	/**
	 * 검색 내용을 가지고 해당 게시물만 조회
	 * @param search 검색 정보 저장 객체
	 * @return 검색내용에 맞는 게시물 정보 반환
	 */
	public List<Trade> searchList(Trade search, Paging paging);
	
	
	/**
	 * 전달파라미터 저장
	 * @param req 전달파라미터
	 * @return tradeno를 저장한 객체
	 */
	public Trade getTradeno(HttpServletRequest req);

	/**
	 * 게시물 번호로 게시물 상세 조회
	 * 조회된 게시물의 조회수 증가
	 * @param tradeno 게시물 번호 저장 dto 객체
	 * @return 게시물 상세 조회 객체
	 */
	public Trade view(Trade tradeno);
	
	/**
	 *  입력한 게시글을 작성하고 db에 저장
	 * @param req - 요청정보 객체
	 */
	public void write(HttpServletRequest req);

	
	/**
	 * 첨부 이미지 정보 조회하기
	 * @param tradeno 이미지파일과 연결된 게시글번호
	 * @return 첨부 이미지 파일 정보 DTO객체
	 */
	public TradeImg viewImg(Trade tradeno);

	/**
	 * 게시물 수정
	 * @param req 요청 파라미터
	 */
	public void update(HttpServletRequest req);

	/**
	 * 게시물 삭제
	 * @param tradeno 삭제할 게시물 번호
	 */
	public void delete(Trade tradeno);
	
	/**
	 * 게시물 번호로 댓글 목록 상세보기
	 * @param tradeno
	 * @return
	 */
	public List<TradeCmt> viewCmt(Trade tradeno);

	/**
	 * 댓글 입력
	 * @param req
	 */
	public void writeCmt(HttpServletRequest req);
	
	
	/**
	 * 댓글 삭제
	 * @param req
	 */
	public void deleteCmt(HttpServletRequest req);

	/**
	 * 댓글 번호로 게시물 번호 가저오기
	 * @param req
	 * @return
	 */
	public int getTradenoByCmtno(HttpServletRequest req);




}
