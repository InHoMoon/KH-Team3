package web.dao.impl.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import web.dao.face.user.JoinDao;
import web.dto.Ufile;
import web.dto.User;

public class JoinDaoImpl implements JoinDao {

	private PreparedStatement ps;
	private ResultSet rs;
	
	
	@Override
	public int insert(Connection conn, User user) {
		
		String sql = "";
		sql += "INSERT INTO tuser (";
		sql += "	userno, userid, userpw, username, useremail";
		sql += "	, userphone, useraddr1, useraddr2, useraddr3";
		sql += "	, usergender, userbirth, usernick, usergrade";
		sql += " )";
		sql += " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '일반회원' )";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, user.getUserno());
			ps.setString(2, user.getUserid());
			ps.setString(3, user.getUserpw());
			ps.setString(4, user.getUsername());
			ps.setString(5, user.getUseremail());
			ps.setString(6, user.getUserphone());
			ps.setString(7, user.getUseraddr1());
			ps.setString(8, user.getUseraddr2());
			ps.setString(9, user.getUseraddr3());
			ps.setString(10, user.getUsergender());
			ps.setString(11, user.getUserbirth());
			ps.setString(12, user.getUsernick());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}
	
	@Override
	public int selectNextUserno(Connection conn) {
		
		String sql = "";
		sql += "SELECT tuser_seq.nextval FROM dual";
		
		int nextUserno = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				nextUserno = rs.getInt("nextval");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return nextUserno;
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
	public int checkCntUserByUserid(Connection conn, User user) {
		
		String sql = "";
		sql += "SELECT count(*) cnt FROM tuser";
		sql += " WHERE userid = ?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUserid());
			
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
	public int checkCntUserByUsernick(Connection conn, User user) {
		
		String sql = "";
		sql += "SELECT count(*) cnt FROM tuser";
		sql += " WHERE usernick = ?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUsernick());
			
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
