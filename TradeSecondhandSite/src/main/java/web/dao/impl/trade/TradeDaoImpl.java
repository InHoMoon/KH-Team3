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


public class TradeDaoImpl implements TradeDao {
	
	private PreparedStatement ps; //sql 수행 객체
	private ResultSet rs; //조회결과 객체

	@Override
	public int selectCnt(Connection conn) {
		//sql작성
		String sql="";
		sql+= "SELECT count(*) cnt FROM trade";
		
		//총 게시물 수
		int res=0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			
			while(rs.next()) {
				res = rs.getInt("cnt");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return res;
	}

	@Override
	public List<Trade> selectAll(Connection conn, Paging paging) {
		//sql작성
		String sql = "";
		sql += "SELECT * FROM (";
		sql += "	SELECT rownum rnum, T.* FROM (";
		sql += "		SELECT";
		sql += "			tradeno, title, userid";
		sql += "			, hit, insert_date";
		sql += "		FROM trade";
		sql += "		ORDER BY tradeno DESC";
		sql += "	) T";
		sql += " ) TRADE";
		sql += " WHERE rnum BETWEEN ? AND ?";
				
		//결과 저장할 List
		List<Trade> tradeList = new ArrayList<>();
				
		try {
			ps = conn.prepareStatement(sql); //SQL수행 객체
					
			ps.setInt(1, paging.getStartNo());
			ps.setInt(2, paging.getEndNo());
					
			rs = ps.executeQuery(); //SQL수행 및 결과 집합 저장
					
			//조회 결과 처리
			while(rs.next()) {
				Trade t = new Trade(); //결과값 저장 객체
						
				//결과값 처리
				t.setTradeno(rs.getInt("tradeno"));
				t.setTitle(rs.getString("title"));
				t.setUserid(rs.getString("userid"));
				t.setHit(rs.getInt("hit"));
				t.setInsertDate(rs.getDate("insert_date"));
						
				//리스트에 결과값 저장
				tradeList.add(t);
						
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
				
		//최종 결과 반환
		return tradeList;
	}

	@Override
	public List<Trade> selectAll(Connection conn, Trade search, Paging paging) {
				//결과 저장할 List
				List<Trade> searchList = new ArrayList<>();
				
				//제목으로 검색
				if(search.getTitle()!=null) {
		
				//sql작성
				String sql = "";
				sql += "SELECT * FROM (";
				sql += "	SELECT rownum rnum, T.* FROM (";
				sql += "		SELECT";
				sql += "			tradeno, title, userid";
				sql += "			, hit, insert_date";
				sql += "		FROM trade";
				sql += "		WHERE title LIKE ?";
				sql += "		ORDER BY tradeno DESC";
				sql += "	) T";
				sql += " ) TRADE";
				sql += " WHERE rnum BETWEEN ? AND ?";
						
						
				try {
					ps = conn.prepareStatement(sql); //SQL수행 객체
							
					ps.setString(1, "%"+search.getTitle()+"%");
					ps.setInt(2, paging.getStartNo());
					ps.setInt(3, paging.getEndNo());
							
					rs = ps.executeQuery(); //SQL수행 및 결과 집합 저장
							
					//조회 결과 처리
					while(rs.next()) {
						Trade t = new Trade(); //결과값 저장 객체
								
						//결과값 처리
						t.setTradeno(rs.getInt("tradeno"));
						t.setTitle(rs.getString("title"));
						t.setUserid(rs.getString("userid"));
						t.setHit(rs.getInt("hit"));
						t.setInsertDate(rs.getDate("insert_date"));
								
						//리스트에 결과값 저장
						searchList.add(t);
								
					}
							
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					JDBCTemplate.close(rs);
					JDBCTemplate.close(ps);
				}
		//id로 검색한 경우
		}else if(search.getUserid()!=null){
			//sql작성
			String sql = "";
			sql += "SELECT * FROM (";
			sql += "	SELECT rownum rnum, T.* FROM (";
			sql += "		SELECT";
			sql += "			tradeno, title, userid";
			sql += "			, hit, insert_date";
			sql += "		FROM trade";
			sql += "		WHERE userid LIKE ?";
			sql += "		ORDER BY tradeno DESC";
			sql += "	) T";
			sql += " ) TRADE";
			sql += " WHERE rnum BETWEEN ? AND ?";
					
					
			try {
				ps = conn.prepareStatement(sql); //SQL수행 객체
						
				ps.setString(1, "%"+search.getUserid()+"%");
				ps.setInt(2, paging.getStartNo());
				ps.setInt(3, paging.getEndNo());
						
				rs = ps.executeQuery(); //SQL수행 및 결과 집합 저장
						
				//조회 결과 처리
				while(rs.next()) {
					Trade t = new Trade(); //결과값 저장 객체
							
					//결과값 처리
					t.setTradeno(rs.getInt("tradeno"));
					t.setTitle(rs.getString("title"));
					t.setUserid(rs.getString("userid"));
					t.setHit(rs.getInt("hit"));
					t.setInsertDate(rs.getDate("insert_date"));
							
					//리스트에 결과값 저장
					searchList.add(t);
							
				}
						
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rs);
				JDBCTemplate.close(ps);
			}
			
		}
						
				//최종 결과 반환
				return searchList;
	}

	@Override
	public int updateHit(Connection conn, Trade tradeno) {
		//sql 구문
		String sql = "";
		sql+= "UPDATE trade";
		sql+= " SET hit = hit+1";
		sql+= " WHERE tradeno = ?";
		
		
		int res= 0;
		
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

	@Override
	public Trade selectTradeByTradeNo(Connection conn, Trade tradeno) {
		
		String sql="";
		sql+="SELECT * FROM trade";
		sql+=" WHERE tradeno = ?";
		
		//조회 결과 저장 객체
		Trade trade = new Trade();
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, tradeno.getTradeno());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				trade.setTradeno(rs.getInt("tradeno"));
				trade.setTitle(rs.getString("title"));
				trade.setUserid(rs.getString("userid"));
				trade.setContent(rs.getString("content"));
				trade.setState(rs.getString("state"));
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

}