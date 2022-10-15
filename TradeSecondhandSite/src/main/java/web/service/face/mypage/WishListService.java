package web.service.face.mypage;

import java.util.List;

import web.dto.Trade;

public interface WishListService {
	
	/**
	 * 관심상품 전체 조회
	 * 
	 * @return List<Trade> - 관심상품 전체 조회 결과 목록
	 */
	List<Trade> getWishList();

}
