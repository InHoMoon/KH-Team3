package web.dao.impl.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import web.dao.face.main.MainDao;
import web.dto.Trade;

public class MainDaoImpl implements MainDao {

	private PreparedStatement ps = null; //SQL수행 객체
	private ResultSet rs = null; //조회 결과 객체
	
	
	@Override
	public List<Trade> selectNewPost(Connection conn) {
		
		//SQL작성
		String sql = "";
		sql += "SELECT * FROM (";
		sql += "	SELECT rownum rnum, T.* FROM (";
		sql += "		SELECT tradeno, title, insert_date, price, state, category";
		sql += "		FROM trade";
		sql += "		ORDER BY tradeno DESC";
		sql += "	 	) T";
		sql += "	)TRADE";
		sql += " WHERE rnum  BETWEEN 1 AND 8";
			
		//결과 저장할 List
		List<Trade> newList = new ArrayList<>();
		
		try {
			//SQL 수행 객체 생성
			ps = conn.prepareStatement(sql);
			
			//SQL 수행 및 결과 저장
			rs = ps.executeQuery();
			System.out.println("21");
			
			//조회 결과 처리
			while(rs.next() ) {
				
				Trade t = new Trade();	 //결과값 저장 객체
				
				t.setTradeno(rs.getInt("tradeno"));
				t.setTitle(rs.getString("title"));
				System.out.println("22");
				t.setPrice(rs.getInt("price"));
				t.setInsertDate(rs.getDate("insert_date"));
				System.out.println("23");
				t.setSaleState(rs.getString("state"));
				t.setCategory(rs.getString("category"));
				
				//리스트에 결과값 저장
				newList.add(t);
				System.out.println("24");
				System.out.println(newList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return newList;
	}

}
