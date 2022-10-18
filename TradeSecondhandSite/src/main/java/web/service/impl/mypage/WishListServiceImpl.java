package web.service.impl.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import web.dao.face.mypage.WishListDao;
import web.dao.impl.mypage.WishListDaoImpl;
import web.dto.WishList;
import web.dto.addWishList;
import web.service.face.mypage.WishListService;

public class WishListServiceImpl implements WishListService {

	private WishListDao wishListDao = new WishListDaoImpl();

	@Override
	public void addWishList(HttpServletRequest req, addWishList addwishList) {
		
		wishListDao.addWishList(JDBCTemplate.getConnection(), addwishList);
	}

	@Override
	public List<WishList> getWishList(HttpServletRequest req, String userid) {
		
		return wishListDao.selectWishList(JDBCTemplate.getConnection(), userid);
	}

}
