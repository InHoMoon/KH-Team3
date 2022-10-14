package web.dao.impl.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import web.dao.face.user.PwUpdateDao;
import web.dto.User;

public class PwUpdateDaoImpl implements PwUpdateDao {
	
	private PreparedStatement ps;
	
	@Override
	public int update(Connection conn, User user) {
		
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
