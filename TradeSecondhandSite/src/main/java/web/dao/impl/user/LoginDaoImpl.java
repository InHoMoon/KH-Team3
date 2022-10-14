package web.dao.impl.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import web.dao.face.user.LoginDao;
import web.dto.User;

public class LoginDaoImpl implements LoginDao {

	private PreparedStatement ps;
	private ResultSet rs;
	
	@Override
	public int selectCntUserByUseridUserpw(Connection conn, User user) {
		
		String sql = "";
		sql += "SELECT count(*) cnt FROM tuser";
		sql += " WHERE userid = ?";
		sql += "	AND userpw = ?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUserid());
			ps.setString(2, user.getUserpw());
			
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
	public User selectUserByUserid(Connection conn, User user) {
		
		String sql = "";
		sql += "SELECT * FROM tuser";
		sql += " WHERE userid = ?";
		
		User result = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUserid());
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				result = new User();
				
				result.setUserid( rs.getString("userid") );
				result.setUserpw( rs.getString("userpw") );
				result.setUsername( rs.getString("username") );
				result.setUseremail( rs.getString("useremail") );
				result.setUserphone( rs.getString("userphone") );
				result.setUseraddr1( rs.getString("useraddr1"));
				result.setUseraddr2( rs.getString("useraddr2"));
				result.setUseraddr3( rs.getString("useraddr3"));
				result.setUsergender( rs.getString("usergender") );
				result.setUserbirth( rs.getInt("userbirth") );
				result.setUsernick( rs.getString("usernick") );
				result.setUsergrade( rs.getString("usergrade"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return result;
	}
	
}
