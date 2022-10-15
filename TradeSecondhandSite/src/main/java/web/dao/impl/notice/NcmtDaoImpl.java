package web.dao.impl.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import web.dao.face.notice.NcmtDao;
import web.dto.Ncomment;

public class NcmtDaoImpl implements NcmtDao {

	
	private PreparedStatement ps = null; //SQL수행 객체
	private ResultSet rs = null; //조회 결과 객체
	
	@Override
	public List<Ncomment> selectAllNcmt(Connection conn, String nno) {
		
		//SQL작성
		String sql = "";
		sql += "SELECT * FROM ncomment";
		sql += " WHERE nno=?";
		sql += " ORDER BY ncmtid";
		
		List<Ncomment> ncmtList = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);

			ps.setString( 1, nno );
			
			//SQL 수행 및 결과 저장
			rs = ps.executeQuery();
			
			//조회 결과 처리
			while(rs.next() ) {
			
				Ncomment ncmt = new Ncomment();
				
				ncmt.setNcmtid(rs.getInt("ncmtid"));
				ncmt.setNno(rs.getInt("nno"));
				ncmt.setNcmtcontent(rs.getString("ncmtcontent"));
				ncmt.setNcmtwritedate(rs.getDate("ncmtwritedate"));
				ncmt.setNcmtupdatetime(rs.getDate("ncmtupdatetime"));
				ncmt.setUserno(rs.getInt("userno"));
				
				ncmtList.add(ncmt);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		
		return ncmtList;
	}

	@Override
	public int insertNcmt(Connection conn, Ncomment ncomment) {

		System.out.println(ncomment);

		String sql = "";
		sql += "INSERT INTO ncomment";
		sql += " ( ncmtid, nno, ncmtcontent, userno)";
		sql += " VALUES (  ncomment_seq.nextval, ?, ?, ?)";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, ncomment.getNno());
			ps.setString(2, ncomment.getNcmtcontent());
			ps.setInt(3, ncomment.getUserno());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(ps);
		}
		return res;
	}

	@Override
	public int updateNcmt(Connection conn, Ncomment ncomment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNcmt(Connection conn, Ncomment ncomment) {
		
		String sql = "";
		sql += "DELETE ncomment";
		sql += " WHERE ncmtid = ?";
		
		int res = 0;

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ncomment.getNcmtid());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}

}
