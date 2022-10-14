package web.dao.impl.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JDBCTemplate;
import web.dao.face.user.JoinDao;
import web.dto.User;

public class JoinDaoImpl implements JoinDao {

	private PreparedStatement ps;
	
	@Override
	public int insert(Connection conn, User user) {
		
		String sql = "";
		sql += "INSERT INTO tuser (";
		sql += "	userno, userid, userpw, username, useremail";
		sql += "	, userphone, useraddr1, useraddr2, useraddr3";
		sql += "	, usergender, userbirth, usernick, usergrade";
		sql += " )";
		sql += " VALUES ( tuser_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '일반회원' )";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUserid());
			ps.setString(2, user.getUserpw());
			ps.setString(3, user.getUsername());
			ps.setString(4, user.getUseremail());
			ps.setString(5, user.getUserphone());
			ps.setString(6, user.getUseraddr1());
			ps.setString(7, user.getUseraddr2());
			ps.setString(8, user.getUseraddr3());
			ps.setString(9, user.getUsergender());
			ps.setInt(10, user.getUserbirth());
			ps.setString(11, user.getUsernick());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}
	
}
