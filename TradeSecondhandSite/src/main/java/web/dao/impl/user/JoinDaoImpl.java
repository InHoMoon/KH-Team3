package web.dao.impl.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import web.dao.face.user.JoinDao;
import web.dto.User;

public class JoinDaoImpl implements JoinDao {

	private PreparedStatement ps;
	private ResultSet rs;
	
	@Override
	public int insert(Connection conn, User user) {
		
		String sql = "";
		sql += "INSERT INTO tuser ( userno, userid, userpw, username, useremail, userphone, usergender, useraddr, usernick )";
		sql += " VALUES ( tuser_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ? )";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUserid());
			ps.setString(2, user.getUserpw());
			ps.setString(3, user.getUsername());
			ps.setString(4, user.getUseremail());
			ps.setString(5, user.getUserphone());
			ps.setString(6, user.getUsergender());
			ps.setString(7, user.getUseraddr());
			ps.setString(8, user.getUsernick());
//			ps.setDate(7, user.getUserbirth());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}
	
}
