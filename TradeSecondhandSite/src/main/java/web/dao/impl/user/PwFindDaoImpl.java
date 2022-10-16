package web.dao.impl.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import web.dao.face.user.PwFindDao;
import web.dto.User;

public class PwFindDaoImpl implements PwFindDao {

	private PreparedStatement ps;
	private ResultSet rs;
	
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
