package web.service.face.main;

import java.util.List;

import web.dto.Trade;

public interface MainService {

	
	/**
	 * 최근 중고거래글 8개 조회
	 * 
	 * @return List<Trade> - 최신글 8개 조회 목록
	 */
	public List<Trade> getNewList();
}
