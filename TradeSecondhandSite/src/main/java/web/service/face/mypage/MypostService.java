package web.service.face.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.Trade;

public interface MypostService {
	
	/**
	 * 페이징 객체로 게시글 전체 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return List<Trade> - 게시글 전체조회 결과 리스트
	 */
	public List<Trade> getList(Paging paging, int userno);
	
	/**
	 * 페이징 객체 생성 
	 * 
	 * @param req - 요청 정보 객체
	 * @return paging - 페이징 처리 결과 객체
	 */
	public Paging getPaging(HttpServletRequest req, int userno);
	
}
