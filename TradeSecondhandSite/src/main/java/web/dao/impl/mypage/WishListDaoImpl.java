package web.dao.impl.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import web.dao.face.mypage.WishListDao;
import web.dto.Trade;

public class WishListDaoImpl implements WishListDao {
	
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public List<Trade> selectWishList(Connection conn, String userid) {

		String sql = "";
		sql += "SELECT ";
		sql += "	tradeno, sale_state , title,";
		sql += "	price, hit, insert_date, ";
		sql += "	wish_check";
		sql += " FROM trade";
		sql += " WHERE userid = ?";
		sql += " and wish_check = 1";
		
		//결과 저장할 List
		List<Trade> wishList = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Trade wish = new Trade();
				
				wish.setTradeno(rs.getInt("tradeno"));
				wish.setSaleState(rs.getString("sale_state"));
				wish.setTitle(rs.getString("title"));
				wish.setPrice(rs.getInt("price"));
				wish.setHit(rs.getInt("hit"));
				wish.setInsertDate(rs.getDate("insert_date"));
				wish.setwishCheck(rs.getInt("wish_check"));
				
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
