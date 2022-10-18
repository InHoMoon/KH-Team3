package web.service.face.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.WishList;
import web.dto.addWishList;

public interface WishListService {

	/**
	 * 관심상품 등록 
	 * 
	 * @param wishList - 전달 파라미터
	 */
	public void addWishList(HttpServletRequest req, addWishList addwishList);

	/**
	 * 관심상품 조회
	 * 
	 * @param userid - 전달 파라미터
	 * @return List<Trade> - 관심상품 리스트 조회 결과 목록
	 */
	public List<WishList> getWishList(HttpServletRequest req, String userid);
}
