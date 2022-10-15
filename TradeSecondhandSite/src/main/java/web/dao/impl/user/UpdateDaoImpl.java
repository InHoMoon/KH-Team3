package web.dao.impl.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import web.dao.face.user.UpdateDao;
import web.dto.Ufile;
import web.dto.User;

public class UpdateDaoImpl implements UpdateDao {
	
	private PreparedStatement ps;
	private ResultSet rs;
	
	@Override
	public User selectUserByUserno(Connection conn, User userno) {
		
		String sql = "";
		sql += "SELECT * FROM tuser";
		sql += " WHERE userno = ?";
		
		User user = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userno.getUserno());
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				user = new User();
				
				user.setUserno( rs.getInt("userno") );
				user.setUserid( rs.getString("userid") );
				user.setUserpw( rs.getString("userpw") );
				user.setUsername( rs.getString("username") );
				user.setUseremail( rs.getString("useremail") );
				user.setUserphone( rs.getString("userphone") );
				user.setUseraddr1( rs.getString("useraddr1") );
				user.setUseraddr2( rs.getString("useraddr2") );
				user.setUseraddr3( rs.getString("useraddr3") );
				user.setUsergender( rs.getString("usergender") );
				user.setUserbirth( rs.getString("userbirth") );
				user.setUsernick( rs.getString("usernick") );
				user.setUsergrade( rs.getString("usergrade") );
				user.setUserjoindate( rs.getDate("userjoindate") );
				user.setUserupdate( rs.getDate("userupdate") );
				user.setReportcount( rs.getInt("reportcount") );
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return user;
	}
	
	@Override
	public Ufile selectFile(Connection conn, User updateUser) {
		
		String sql = "";
		sql += "SELECT * FROM ufile";
		sql += " WHERE userno = ?";
		sql += " ORDER BY ufileno";
		
		// 조회 결과 객체
		Ufile ufile = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, updateUser.getUserno());
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				ufile = new Ufile();
				
				ufile.setUfileno( rs.getInt("ufileno") );
				ufile.setUserno( rs.getInt("userno") );
				ufile.setUfileoriginname( rs.getString("ufileoriginname") );
				ufile.setUfilestoredname( rs.getString("ufilestoredname") );
				ufile.setUfilesize( rs.getInt("ufilesize") );
				ufile.setUfilewritedate( rs.getDate("ufilewritedate") );
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return ufile;
	}
	
	@Override
	public int update(Connection conn, User user) {
		
		String sql = "";
		sql += "UPDATE tuser SET";
		sql += "	userpw = ?, useremail = ?, userphone = ?";
		sql += "	, useraddr1 = ?, useraddr2 = ?, useraddr3 = ?";
		sql += "	, usergender = ?, userbirth = ?, usernick = ?";
		sql += "	, userupdate = sysdate";
		sql += " WHERE userid = ?";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUserpw());
			ps.setString(2, user.getUseremail());
			ps.setString(3, user.getUserphone());
			ps.setString(4, user.getUseraddr1());
			ps.setString(5, user.getUseraddr2());
			ps.setString(6, user.getUseraddr3());
			ps.setString(7, user.getUsergender());
			ps.setString(8, user.getUserbirth());
			ps.setString(9, user.getUsernick());
			ps.setString(10, user.getUserid());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}
	
	@Override
	public int insertFile(Connection conn, Ufile ufile) {
		
		String sql = "";
		sql += "INSERT INTO ufile( ufileno, userno, ufileoriginname, ufilestoredname, ufilesize)";
		sql += " VALUES( ufile_seq.nextval, ?, ?, ?, ? )";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, ufile.getUserno());
			ps.setString(2, ufile.getUfileoriginname());
			ps.setString(3, ufile.getUfilestoredname());
			ps.setInt(4, ufile.getUfilesize());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}
	
	@Override
	public int updatePw(Connection conn, User user) {
		
		String sql = "";
		sql += "UPDATE tuser SET userpw = ?, userupdate = sysdate";
		sql += " WHERE userid = ?";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUserpw());
			ps.setString(2, user.getUserid());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}
	
}
