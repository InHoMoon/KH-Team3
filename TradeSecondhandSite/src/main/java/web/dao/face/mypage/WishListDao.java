package web.dao.face.mypage;

import java.sql.Connection;
import java.util.List;

import web.dto.WishList;
import web.dto.addWishList;

public interface WishListDao {
	
	/**
	 * 관심상품 추가
	 * 
	 * 
	 * @param wishList
	 */
	public void addWishList(Connection conn, addWishList addwishList);

	/**
	 * userid로 관심상품 전체 목록 조회
	 * 
	 * @param connection - DB연결 객체
	 * @param userid - 전달 파라미터
	 * @return List<Trade> - 관심상품 전체 조회 결과 목록
	 */
	public List<WishList> selectWishList(Connection conn, String userid);


}
