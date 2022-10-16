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
	public List<Ncomment> selectAllNcmt(Connection conn, int nno) {
		
		//SQL작성
		String sql = "";
		sql += "SELECT * FROM ncomment";
		sql += " WHERE nno=?";
		sql += " ORDER BY ncmtid DESC";
		
		List<Ncomment> ncmtList = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);

			ps.setInt( 1, nno );
			
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
				ncmt.setUserid(rs.getString("userid"));
				
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
	public int insertNcmt(Connection conn, Ncomment ncmt) {

		System.out.println(ncmt);

		String sql = "";
		sql += "INSERT INTO ncomment";
		sql += " ( ncmtid, nno, ncmtcontent, userid)";
		sql += " VALUES (  ncomment_seq.nextval, ?, ?, ?)";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, ncmt.getNno());
			ps.setString(2, ncmt.getNcmtcontent());
			ps.setString(3, ncmt.getUserid());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(ps);
		}
		return res;
	}

	//수정
	@Override
	public int updateNcmt(Connection conn, Ncomment ncomment, int ncmtid) {


		
		String sql = "";
		sql += "UPDATE ncomment";
		sql += " SET";
		sql += "	ncmtcontent= ?";
		sql += "	WHERE ncmtid = ?";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, ncomment.getNcmtcontent());
			ps.setInt(2, ncmtid);
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(ps);
		}
		return res;
	}
	
	
	//삭제
	@Override
	public int deleteNcmt(Connection conn, int ncmtid) {
		
		String sql = "";
		sql += "DELETE ncomment";
		sql += " WHERE ncmtid = ?";
		
		int res = 0;

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ncmtid);
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}

}
