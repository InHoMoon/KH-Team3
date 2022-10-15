package web.dao.impl.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import util.Paging;
import web.dao.face.mypage.MypostDao;
import web.dto.Trade;

public class MypostDaoImpl implements MypostDao {

	private PreparedStatement ps; //SQL수행 객체
	private ResultSet rs; //SQL조회 결과 객체
	
	@Override
	public List<Trade> selectAll(Connection conn, Paging paging, int userno) {
		
		//SQL 작성
		String sql = "";
		sql += "SELECT * FROM (";
		sql += "	SELECT rownum rnum, T.* FROM (";
		sql += "		SELECT";
		sql += "			tradeno, sale_state, title";
		sql += "			,userid , hit, insert_date";
		sql += "		FROM trade";
		sql += "		ORDER BY insert_date DESC";
		sql += "	) T";
		sql += " ) TRADE";
		sql += " WHERE userid = ( ";
		sql += "	SELECT userid FROM tuser";
		sql += "	WHERE userno = ? )";
		sql += " AND rnum BETWEEN ? AND ?";
		
		System.out.println(sql);
		System.out.println(userno);
		System.out.println(paging.getStartNo());
		System.out.println(paging.getEndNo());
		
		
		//결과 저장할 List
		List<Trade> mypostList = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql); //SQL수행 객체
			
			ps.setInt(1, userno);
			ps.setInt(2, paging.getStartNo());
			ps.setInt(3, paging.getEndNo());

			rs = ps.executeQuery(); //SQL수행 및 결과 집합 저장

			//조회 결과 처리
			while(rs.next()) {
				Trade mypost = new Trade(); //결과값 저장 객체

				//결과값 처리
				mypost.setUserid(rs.getString("userid"));
				mypost.setTradeno(rs.getInt("tradeno"));
				mypost.setSaleState(rs.getString("sale_state"));
				mypost.setTitle(rs.getString("title"));
				mypost.setHit(rs.getInt("hit"));
				mypost.setInsertDate(rs.getDate("insert_date"));

				//리스트에 결과값 저장
				mypostList.add(mypost);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		//최종 결과 반환
		return mypostList;
	}
	@Override
	public int selectCnt(Connection conn, int userno) {
		
		//SQL작성
		String sql="";
		sql+= "SELECT count(*) cnt FROM trade";
		sql += " WHERE userid = ( ";
		sql += "	SELECT userid FROM tuser";
		sql += "	WHERE userno = ? )";

		//총 게시물 수
		int res = 0;

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userno);

			rs = ps.executeQuery();

			while(rs.next()) {
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
}
