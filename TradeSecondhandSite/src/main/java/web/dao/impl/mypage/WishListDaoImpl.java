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
	public List<Trade> selectAll(Connection conn) {

		String sql = "";
		sql += "SELECT * FROM trade";
		
		//리스트 추출 쿼리 작성 예정

		//결과 저장할 List
		List<Trade> wishList = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Trade wish = new Trade();
				
				wish.setTradeno(rs.getInt("tradeno"));
				wish.setTitle(rs.getString("title"));
				wish.setPrice(rs.getInt("price"));
				wish.setSaleState(rs.getString("salestate"));
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
