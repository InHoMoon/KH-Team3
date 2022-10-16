package web.dao.face.mypage;

import java.sql.Connection;
import java.util.List;

import web.dto.Trade;

public interface WishListDao {
	
	/**
	 * 관심상품 전체 조회 
	 * 
	 * @param conn - DB연결 객체
	 * @return List<Trade> - 테이블 전체조회 결과 목록
	 */
	public List<Trade> selectWishList(Connection conn, String userid);

}
