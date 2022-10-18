package web.dao.impl.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import web.dao.face.mypage.WishListDao;
import web.dto.WishList;
import web.dto.addWishList;

public class WishListDaoImpl implements WishListDao {

	private PreparedStatement ps;
	private ResultSet rs;


	@Override
	public void addWishList(Connection conn, addWishList wishList) {
		
		String sql = "";
		sql += "INSERT INTO wishlist (";
		sql += "	wishlistno, userno, userid, tradeno";
		sql += "	) VALUES (";
		sql += " wishlist_seq.nextval, ?, ?, ?";

		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, wishList.getUserno());
			ps.setString(2, wishList.getUserid());
			ps.setInt(3, wishList.getTradeno());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
			JDBCTemplate.close(conn);
		}
	}


	@Override
	public List<WishList> selectWishList(Connection conn, String userid) {
		
		String sql = "";
		sql += "SELECT row_number() OVER(";
		sql += "	ORDER BY w.wishlistno DESC";
		sql += "	) as num,";
		sql += "		w.wishlistno, w.userno, w.tradeno, i.imgno,";
		sql += "		w.userid, w.addDate, t.title, t.price, t.sale_State";
		sql += "	FROM wishlist w";
		sql += "	INNER JOIN trade t";
		sql += "	ON w.tradeno = t.tradeno";
		sql += "	INNER JOIN tradeimg i";
		sql += "	ON w.imgno = i.imgno";
		sql += " WHERE w.userid = ?";
		
		
		//결과 저장 List
		List<WishList> wishList = new ArrayList<>(); 
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
					
			while (rs.next()) {
				
				WishList wish = new WishList(); //결과값 저장 객체
				
				wish.setWishlistno(rs.getInt("wishlistno"));
				wish.setUserno(rs.getInt("userno"));
				wish.setTradeno(rs.getInt("tradeno"));
				wish.setImgno(rs.getInt("imgno"));
				wish.setUserid(rs.getString("userid"));
				wish.setAddDate(rs.getDate("addDate"));
				wish.setTitle(rs.getString("title"));
				wish.setPrice(rs.getInt("price"));
				wish.setSaleState(rs.getString("sale_state"));
				
				wishList.add(wish);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
			JDBCTemplate.close(rs);
		}
		
		return wishList;
	}

}
