package web.dao.impl.trade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import util.Paging;
import web.dao.face.trade.TradeDao;
import web.dto.Trade;
import web.dto.TradeCmt;
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
				trade.setUserphone(rs.getString("userphone"));

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
		sql += "INSERT INTO trade ( tradeno, title, userid, content, product_state, price, sale_state, category, userphone, hit )";
		sql += " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?,  0 )";

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
			ps.setString(9, trade.getUserphone());

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
		String sql = "";
		sql += "UPDATE trade ";
		sql += " SET";
		sql += "	title = ? , category = ?, product_state = ?, sale_state = ?, price = ? ";
		sql += "	, content = ?, userphone = ?";
		sql += " WHERE tradeno = ?";
		
		int res = 0;

		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, trade.getTitle());
			ps.setString(2, trade.getCategory());
			ps.setString(3, trade.getProductState());
			ps.setString(4, trade.getSaleState());
			ps.setInt(5, trade.getPrice());
			ps.setString(6, trade.getContent());
			ps.setString(7, trade.getUserphone());
			ps.setInt(8, trade.getTradeno());
			
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

	@Override
	public int deleteImg(Connection conn, Trade tradeno) {
		
		String sql= "";
		sql += "DELETE tradeimg";
		sql += " WHERE tradeno = ?";
		
		int res= 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, tradeno.getTradeno());
			
			res= ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		
		return res;
	}

	@Override
	public int delete(Connection conn, Trade tradeno) {
		String sql= "";
		sql += "DELETE trade";
		sql += " WHERE tradeno = ?";
		
		int res= 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, tradeno.getTradeno());
			
			res= ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		
		return res;
	}

	@Override
	public List<TradeCmt> selectCmt(Connection conn, Trade tradeno) {
		
		List<TradeCmt> cmtList = new ArrayList<>();
		
		String sql="";
		sql+= "SELECT cmtno, cmt_content, cmt_date, tradeno, cmt_depth, cmt_group, userno, userid";
		sql+= " FROM tradecmt";
		sql+= " WHERE tradeno = ?";
		sql+= " ORDER BY cmtno";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, tradeno.getTradeno());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				TradeCmt c = new TradeCmt();
				
				c.setCmtno(rs.getInt("cmtno"));
				c.setCmtContent(rs.getString("cmt_content"));
				c.setCmtDate(rs.getDate("cmt_date"));
				c.setTradeno(rs.getInt("tradeno"));
				c.setCmtDepth(rs.getInt("cmt_depth"));
				c.setCmtGroup(rs.getInt("cmt_group"));
				c.setUserno(rs.getInt("userno"));
				c.setUserid(rs.getString("userid"));
				
				cmtList.add(c);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		
		return cmtList;
	}
	
	
	
	@Override
	public int selectNextCmtno(Connection conn) {
		String sql = "";
		sql += "SELECT tradecmt_seq.nextval FROM dual";

		int nextCmtno = 0;

		try {
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();

			while (rs.next()) {
				nextCmtno = rs.getInt("nextval");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		return nextCmtno;
	}

	@Override
	public int selectUsernoByUserId(Connection conn, HttpServletRequest req) {
		String sql="";
		sql+="SELECT userno FROM tuser";
		sql+=" WHERE userid = ?";
		
		int userno = 0;
		
		try {
			ps= conn.prepareStatement(sql);
			
			ps.setString(1, req.getParameter("userid"));
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				userno=rs.getInt("userno");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		
		return userno;
	}

	@Override
	public int insertCmt(Connection conn, TradeCmt tradeCmt) {
		
		String sql = "";
		sql+="INSERT INTO tradecmt (cmtno, userno, tradeno, cmt_content, userid )";
		sql+=" VALUES (?, ?, ?, ?, ?)";
		
		int res= 0;
		try {
			ps= conn.prepareStatement(sql);
			
			ps.setInt(1, tradeCmt.getCmtno());
			ps.setInt(2, tradeCmt.getUserno());
			ps.setInt(3, tradeCmt.getTradeno());
			ps.setString(4, tradeCmt.getCmtContent());
			ps.setString(5, tradeCmt.getUserid());
			
			res= ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}

	@Override
	public int deleteCmt(Connection conn, HttpServletRequest req) {
		
		String sql="";
		sql+="DELETE tradecmt";
		sql+=" WHERE cmtno= ?";
		
		int res = 0;
		
		try {
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1, Integer.parseInt(req.getParameter("cmtno")));
			
			res=ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		
		return res;
	}

	@Override
	public int selectTradenoByCmtno(Connection conn, HttpServletRequest req) {


		String sql= "";
		sql+="SELECT tradeno FROM tradecmt";
		sql+=" WHERE cmtno = ?";
		
		int tradeno=0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, Integer.parseInt(req.getParameter("cmtno")) );
			
			rs = ps.executeQuery();
			
			while( rs.next() ){
				tradeno = rs.getInt("tradeno");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
			
		}
		
		
		return tradeno;
	}

	@Override
	public String selectCategoryByTradeno(Connection conn, Trade tradeno) {
		
		String sql="";
		sql+="SELECT category FROM trade";
		sql+=" WHERE tradeno = ?";
		
		String category=null;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, tradeno.getTradeno());
			
			rs=ps.executeQuery();
			
			
			while(rs.next()) {
				category = rs.getString("category");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
			
		}
		
		
		return category;
	}

	@Override
	public List<Trade> selectListByCategory(Connection conn, String category) {
		
		String sql = "";
		sql += "SELECT * FROM (";
		sql += "	SELECT rownum rnum, T.* FROM (";
		sql += "		SELECT";
		sql += "			tradeno, title, userid, sale_state";
		sql += "			, hit, insert_date, product_state, price";
		sql += "		FROM trade";
		sql += "        WHERE category= ?";
		sql += "		ORDER BY tradeno DESC";
		sql += "	) T";
		sql += " ) TRADE";
		sql += " WHERE rnum BETWEEN 1 AND 5";
		
		List<Trade> relatedList = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, category);
			
			rs=ps.executeQuery();
			
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
				t.setPrice(rs.getInt("price"));

				// 리스트에 결과값 저장
				relatedList.add(t);

			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
			
		}
		
		
		
		return relatedList;
	}

	@Override
	public int deleteAllCmt(Connection conn, Trade tradeno) {
		String sql="";
		sql+="DELETE tradecmt";
		sql+=" WHERE tradeno = ?";
		
		int res = 0;
		
		try {
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1, tradeno.getTradeno());
			
			res=ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		
		return res;
	}

	



}
