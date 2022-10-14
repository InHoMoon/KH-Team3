package web.dao.impl.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import web.dao.face.user.FindDao;
import web.dto.User;

public class FindDaoImpl implements FindDao {
	
	private PreparedStatement ps;
	private ResultSet rs;
	
	@Override
	public int selectCntByUsernameUseremail(Connection conn, User user) {
		
		String sql = "";
		sql += "SELECT count(*) cnt FROM tuser";
		sql += " WHERE username = ?";
		sql += "	AND useremail = ?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getUseremail());
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				cnt = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return cnt;
	}
	
	@Override
	public User selectUserByUseremail(Connection conn, User user) {
		
		String sql = "";
		sql += "SELECT userid, username, useremail FROM tuser";
		sql += " WHERE useremail = ?";
		
		User result = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUseremail());
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				result = new User();
				
				result.setUserid( rs.getString("userid") );
				result.setUsername( rs.getString("username") );
				result.setUseremail( rs.getString("useremail") );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return result;
	}
	
	@Override
	public int selectCntByUseridUsernameUseremail(Connection conn, User user) {
		
		String sql = "";
		sql += "SELECT count(*) cnt FROM tuser";
		sql += " WHERE userid = ?";
		sql += "	AND username = ?";
		sql += "	AND useremail = ?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUserid());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getUseremail());
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				cnt = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return cnt;
	}
	
}
