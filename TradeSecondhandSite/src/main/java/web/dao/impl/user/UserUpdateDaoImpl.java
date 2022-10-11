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
		sql += "UPDATE tuser SET userpw = ?, useremail = ?, userphone = ?, useraddr = ?, usernick = ?";
		sql += " WHERE userid = ?";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUserpw());
			ps.setString(2, user.getUseremail());
			ps.setString(3, user.getUserphone());
			ps.setString(4, user.getUseraddr());
			ps.setString(5, user.getUsernick());
			ps.setString(6, user.getUserid());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
		
	}
	
}
