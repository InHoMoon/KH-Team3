package web.dao.impl.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import web.dao.face.user.UserUpdateDao;
import web.dto.User;

public class UserUpdateDaoImpl implements UserUpdateDao {

	private PreparedStatement ps;
	private ResultSet rs;
	
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
	
}
