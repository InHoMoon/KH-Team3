package web.service.face.trade;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.Trade;



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



}