package web.service.impl.mypage;

import java.util.List;

import common.JDBCTemplate;
import web.dao.face.mypage.WishListDao;
import web.dao.impl.mypage.WishListDaoImpl;
import web.dto.Trade;
import web.service.face.mypage.WishListService;

public class WishListServiceImpl implements WishListService {
	
	private WishListDao wishListDao = new WishListDaoImpl();

	@Override
	public List<Trade> getWishList(String userid) {
		
		return wishListDao.selectWishList(JDBCTemplate.getConnection(), userid);
	}

}
