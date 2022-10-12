package web.dao.impl.trade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import util.Paging;
import web.dao.face.trade.TradeDao;
import web.dto.Trade;
import web.dto.TradeImg;

public class TradeDaoImpl implements TradeDao {

	private PreparedStatement ps; // sql 수행 객체
	private ResultSet rs; // 조회결과 객체

	@Override
	public int selectCnt(Connection conn) {
		// sql작성
		String sql = "";
		sql += "SELECT count(*) cnt FROM trade";

		// 총 게시물 수
		int res = 0;

		try {
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();

			while (rs.next()) {
				res = rs.getInt("cnt");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		return res;
	}

	@Override
	public List<Trade> selectAll(Connection conn, Paging paging) {
		// sql작성
		String sql = "";
		sql += "SELECT * FROM (";
		sql += "	SELECT rownum rnum, T.* FROM (";
		sql += "		SELECT";
		sql += "			tradeno, title, userid, sale_state";
		sql += "			, hit, insert_date, product_state";
		sql += "		FROM trade";
		sql += "		ORDER BY tradeno DESC";
		sql += "	) T";
		sql += " ) TRADE";
		sql += " WHERE rnum BETWEEN ? AND ?";

		// 결과 저장할 List
		List<Trade> tradeList = new ArrayList<>();

		try {
			ps = conn.prepareStatement(sql); // SQL수행 객체

			ps.setInt(1, paging.getStartNo());
			ps.setInt(2, paging.getEndNo());

			rs = ps.executeQuery(); // SQL수행 및 결과 집합 저장

			// 조회 결과 처리
			while (rs.next()) {
				Trade t = new Trade(); // 결과값 저장 객체

				// 결과값 처리
				t.setTradeno(rs.getInt("tradeno"));
				t.setTitle(rs.getString("title"));
				t.setUserid(rs.getString("userid"));
				t.setHit(rs.getInt("hit"));
				t.setInsertDate(rs.getDate("insert_date"));
				t.setProductState(rs.getString("product_state"));
				t.setSaleState(rs.getString("sale_state"));

				// 리스트에 결과값 저장
				tradeList.add(t);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		// 최종 결과 반환
		return tradeList;
	}

	@Override
	public List<Trade> selectAll(Connection conn, Trade search, Paging paging) {
		// 결과 저장할 List
		List<Trade> searchList = new ArrayList<>();

		// 제목으로 검색
		if (search.getTitle() != null) {

			// sql작성
			String sql = "";
			sql += "SELECT * FROM (";
			sql += "	SELECT rownum rnum, T.* FROM (";
			sql += "		SELECT";
			sql += "			tradeno, title, userid, sale_state";
			sql += "			, hit, insert_date, product_state";
			sql += "		FROM trade";
			sql += "		WHERE title LIKE ?";
			sql += "		ORDER BY tradeno DESC";
			sql += "	) T";
			sql += " ) TRADE";
			sql += " WHERE rnum BETWEEN ? AND ?";

			try {
				ps = conn.prepareStatement(sql); // SQL수행 객체

				ps.setString(1, "%" + search.getTitle() + "%");
				ps.setInt(2, paging.getStartNo());
				ps.setInt(3, paging.getEndNo());

				rs = ps.executeQuery(); // SQL수행 및 결과 집합 저장

				// 조회 결과 처리
				while (rs.next()) {
					Trade t = new Trade(); // 결과값 저장 객체

					// 결과값 처리
					t.setTradeno(rs.getInt("tradeno"));
					t.setTitle(rs.getString("title"));
					t.setUserid(rs.getString("userid"));
					t.setHit(rs.getInt("hit"));
					t.setInsertDate(rs.getDate("insert_date"));
					t.setProductState(rs.getString("product_state"));
					t.setSaleState(rs.getString("sale_state"));

					// 리스트에 결과값 저장
					searchList.add(t);

				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rs);
				JDBCTemplate.close(ps);
			}
			// id로 검색한 경우
		} else if (search.getUserid() != null) {
			// sql작성
			String sql = "";
			sql += "SELECT * FROM (";
			sql += "	SELECT rownum rnum, T.* FROM (";
			sql += "		SELECT";
			sql += "			tradeno, title, userid, sale_state";
			sql += "			, hit, insert_date, product_state";
			sql += "		FROM trade";
			sql += "		WHERE userid LIKE ?";
			sql += "		ORDER BY tradeno DESC";
			sql += "	) T";
			sql += " ) TRADE";
			sql += " WHERE rnum BETWEEN ? AND ?";

			try {
				ps = conn.prepareStatement(sql); // SQL수행 객체

				ps.setString(1, "%" + search.getUserid() + "%");
				ps.setInt(2, paging.getStartNo());
				ps.setInt(3, paging.getEndNo());

				rs = ps.executeQuery(); // SQL수행 및 결과 집합 저장

				// 조회 결과 처리
				while (rs.next()) {
					Trade t = new Trade(); // 결과값 저장 객체

					// 결과값 처리
					t.setTradeno(rs.getInt("tradeno"));
					t.setTitle(rs.getString("title"));
					t.setUserid(rs.getString("userid"));
					t.setHit(rs.getInt("hit"));
					t.setInsertDate(rs.getDate("insert_date"));
					t.setProductState(rs.getString("product_state"));
					t.setSaleState(rs.getString("sale_state"));

					// 리스트에 결과값 저장
					searchList.add(t);

				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rs);
				JDBCTemplate.close(ps);
			}

		}

		// 최종 결과 반환
		return searchList;
	}

	@Override
	public int updateHit(Connection conn, Trade tradeno) {
		// sql 구문
		String sql = "";
		sql += "UPDATE trade";
		sql += " SET hit = hit+1";
		sql += " WHERE tradeno = ?";

		int res = 0;

		try {

			ps = conn.prepareStatement(sql);

			ps.setInt(1, tradeno.getTradeno());

			res = ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}

		return res;
	}

	@Override
	public Trade selectTradeByTradeNo(Connection conn, Trade tradeno) {

		String sql = "";
		sql += "SELECT * FROM trade";
		sql += " WHERE tradeno = ?";

		// 조회 결과 저장 객체
		Trade trade = new Trade();

		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, tradeno.getTradeno());

			rs = ps.executeQuery();

			while (rs.next()) {
				trade.setTradeno(rs.getInt("tradeno"));
				trade.setTitle(rs.getString("title"));
				trade.setUserid(rs.getString("userid"));
				trade.setContent(rs.getString("content"));
				trade.setProductState(rs.getString("product_state"));
				trade.setSaleState(rs.getString("sale_state"));
				trade.setPrice(rs.getInt("price"));
				trade.setHit(rs.getInt("hit"));
				trade.setCategory(rs.getString("category"));
				trade.setInsertDate(rs.getDate("insert_date"));

			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);

		}

		return trade;
	}

	@Override
	public int selectNextTradeno(Connection conn) {

		String sql = "";
		sql += "SELECT trade_seq.nextval FROM dual";

		int nextTradeno = 0;

		try {
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();

			while (rs.next()) {
				nextTradeno = rs.getInt("nextval");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		return nextTradeno;
	}

	@Override
	public int insert(Connection conn, Trade trade) {

		String sql = "";
		sql += "INSERT INTO trade ( tradeno, title, userid, content, product_state, price, sale_state, category, hit )";
		sql += " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?,  0 )";

		int res = 0;

		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, trade.getTradeno());
			ps.setString(2, trade.getTitle());
			ps.setString(3, trade.getUserid());
			ps.setString(4, trade.getContent());
			ps.setString(5, trade.getProductState());
			ps.setInt(6, trade.getPrice());
			ps.setString(7, trade.getSaleState());
			ps.setString(8, trade.getCategory());

			res = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}

		return res;
	}

	@Override
	public int insertImg(Connection conn, TradeImg tradeImg) {

		String sql = "";
		sql += "INSERT INTO tradeimg( imgno, storedname, originname, imgsize, tradeno)";
		sql += " VALUES( tradeimg_seq.nextval, ?, ?, ?, ?)";

		int res = 0;

		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, tradeImg.getStoredName());
			ps.setString(2, tradeImg.getOriginName());
			ps.setInt(3, tradeImg.getImgsize());
			ps.setInt(4, tradeImg.getTradeno());

		

			res = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}

		return res;
	}

	@Override
	public TradeImg selectImg(Connection conn, Trade tradeno) {

		String sql = "";
		sql += "SELECT * FROM tradeimg";
		sql += " WHERE tradeno = ?";

		TradeImg img = new TradeImg();

		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, tradeno.getTradeno());

			rs = ps.executeQuery();

			while (rs.next()) {
				
				
				img.setImgno(rs.getInt("imgno"));
				img.setImgsize(rs.getInt("imgsize"));
				img.setOriginName(rs.getString("originname"));
				img.setStoredName(rs.getString("storedname"));
				img.setTradeno(rs.getInt("tradeno"));
				
				

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		return img;
	}

	@Override
	public int update(Connection conn, Trade trade) {
		String sql="";
		sql += "UPDATE trade";
		sql += " SET title = ?, category = ?, product_state = ?, price = ?, content = ?, sale_state = ?";
		sql += " WHERE tradeno = ?";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, trade.getTitle());
			ps.setString(2, trade.getCategory());
			ps.setString(3, trade.getProductState());
			ps.setInt(4, trade.getPrice());
			ps.setString(5, trade.getContent());
			ps.setString(6, trade.getSaleState());
			ps.setInt(7, trade.getTradeno());
			
			res = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		
		
		return res;
	}

	@Override
	public int updateImg(Connection conn, TradeImg tradeImg) {
		String sql = "";
		sql += "UPDATE tradeimg";
		sql += " SET originname = ?, storedname = ?, imgsize = ?";
		sql += " WHERE tradeno = ?";

		int res = 0;

		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, tradeImg.getOriginName());
			ps.setString(2, tradeImg.getStoredName());
			ps.setInt(3, tradeImg.getImgsize());
			ps.setInt(4, tradeImg.getTradeno());

		

			res = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}

		return res;
	}

}
