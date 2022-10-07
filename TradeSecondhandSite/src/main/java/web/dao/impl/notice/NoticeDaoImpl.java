package web.dao.impl.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import util.Paging;
import web.dao.face.notice.NoticeDao;
import web.dto.Nfile;
import web.dto.Notice;

public class NoticeDaoImpl implements NoticeDao {

	private PreparedStatement ps = null; //SQL수행 객체
	private ResultSet rs = null; //조회 결과 객체
	
	// 총 게시글 조회 (페이징 처리X)
	@Override
	public List<Notice> selectAll(Connection conn) {
		
		//SQL작성
		String sql = "";
		sql += "SELECT * FROM notice";
		sql += " ORDER BY nno DESC";
		
		//결과 저장할 List
		List<Notice> noticeList = new ArrayList<>();
		
		try {
			//SQL 수행 객체 생성               
			ps = conn.prepareStatement(sql);
			
			//SQL 수행 및 결과 저장
			rs = ps.executeQuery();
			
			//조회 결과 처리
			while(rs.next() ) {
				Notice n = new Notice(); //결과값 저장 객체
				
				//결과값 한 행씩 처리
				n.setNno(rs.getInt("nno"));
				n.setNcategory(rs.getString("ncategory"));
				n.setNtitle(rs.getString("ntitle"));
				n.setNwritedate(rs.getDate("nwritedate"));
				n.setNhit(rs.getInt("nhit"));
				
				//리스트에 결과값 저장
				noticeList.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {  //DB객체 닫기
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return noticeList;	
	}

	
	// 총 게시글 조회 (페이징)
	@Override
	public List<Notice> selectAll(Connection conn, Paging paging) {
		//SQL작성
		String sql = "";
		sql += "SELECT * FROM (";
		sql += "	SELECT rownum rnum, N.* FROM (";
		sql += "	        SELECT";
		sql += "			  nno, ncategory, ntitle";
		sql += "	          , nhit, nwritedate";
		sql += "			FROM notice";
		sql += "	        ORDER BY ntop DESC, nno DESC";
		sql += " 	) N";
		sql += " ) NOTICE";
		sql += " WHERE rnum BETWEEN ? AND ?";
		
		
		//결과 저장할 List
		List<Notice> noticeList = new ArrayList<>();
		
		try {
			//SQL 수행 객체 생성
			ps = conn.prepareStatement(sql);
			
			ps.setInt( 1, paging.getStartNo() );
			ps.setInt( 2, paging.getEndNo() );
			
			//SQL 수행 및 결과 저장
			rs = ps.executeQuery();
			
			//조회 결과 처리
			while(rs.next() ) {
				Notice n = new Notice();	 //결과값 저장 객체
				
				n.setNno(rs.getInt("nno"));
				n.setNcategory(rs.getString("ncategory"));
				n.setNtitle(rs.getString("ntitle"));
				n.setNwritedate(rs.getDate("nwritedate"));
				n.setNhit(rs.getInt("nhit"));
				
				//리스트에 결과값 저장
				noticeList.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		return noticeList;
	}

	@Override
	public int selectCntAll(Connection conn) {

		//SQL 작성
		String sql = "";
		sql += "SELECT count(*) cnt FROM notice";
		
		//총 게시글 수
		int count = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				count = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return count;
	}

	
	//조회수 1 증가	
	@Override
	public int updateHit(Connection conn, Notice nno) {
		String sql = "";
		sql += "UPDATE notice";
		sql += "	SET nhit = nhit + 1";
		sql += " WHERE nno=?";
		
		//수행결과값 저장할 변수
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1,  nno.getNno());
			
			res=ps.executeUpdate();
			
			conn.commit();
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}

	@Override
	public Notice selectNoticeByNno(Connection conn, Notice nno) {
			
		String sql = "";
		sql += "SELECT";
		sql += "	nno, ncategory, ntitle";
		sql += "	, ncontent, nhit, nwritedate";
		sql += " FROM notice";
		sql += " WHERE nno = ?";
				
		Notice n = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, nno.getNno());
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				n = new Notice();
				
				n.setNno(rs.getInt("nno"));
				n.setNcategory(rs.getString("ncategory"));
				n.setNtitle(rs.getString("ntitle"));
				n.setNcontent(rs.getString("ncontent"));
				n.setNwritedate(rs.getDate("nwritedate"));
				n.setNhit(rs.getInt("nhit"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//--- 자원 해제 ----
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		//조회 결과 반환
		return n;
	}

	
	//공지글 삽입
	@Override
	public int insert(Connection conn, Notice notice) {
		
		System.out.println(notice);
		
		String sql = "";
		sql +="INSERT INTO notice ( nno, ncategory, ntitle, ncontent, ntop)";
		sql += " VALUES (  ?, ?, ?, ?, ? )";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, notice.getNno());
			ps.setString(2, notice.getNcategory());
			ps.setString(3, notice.getNtitle());
			ps.setString(4, notice.getNcontent());
			ps.setInt(5, notice.getNtop());

			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(ps);
		}
		return res;

	}

	@Override
	public int selectNextNno(Connection conn) {
		
		String sql = "";
		sql += "SELECT notice_seq.nextval FROM dual";
		
		int nextNno = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				nextNno = rs.getInt("nextval");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return nextNno;
	}

	@Override
	public int insertFile(Connection conn, Nfile nfile) {
		String sql = "";
		sql += "INSERT INTO nfile (nfileno, nno, nfileoriginname, nfilestoredname, nfilesize )";
		sql += " VALUES( nfile_seq.nextval, ?, ?, ?, ? )";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1,  nfile.getNno());
			ps.setString(2,  nfile.getNfileoriginname());
			ps.setString(3,  nfile.getNfilestoredname());
			ps.setInt(4,  nfile.getNfilesize());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}	
		
		return res;
	}

	
	
	@Override
	public Nfile selectFile(Connection conn, Notice viewNotice) {
		String sql = "";
		sql += "SELECT";
		sql += "	nfileno, nno, nfileoriginname, nfilestoredname, nfilesize, nfilewritedate";
		sql += " FROM nfile";
		sql += " WHERE nno = ?";
		
		//조회 결과 객체
		Nfile nFile = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, viewNotice.getNno());
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				nFile = new Nfile();
				
				nFile.setNfileno( rs.getInt("nfileno") );
				nFile.setNno( rs.getInt("nno") );
				nFile.setNfileoriginname( rs.getString("nfileoriginname") );
				nFile.setNfilestoredname( rs.getString("nfilestoredname") );
				nFile.setNfilesize( rs.getInt("nfilesize") );
				nFile.setNfilewritedate( rs.getDate("nfilewritedate") );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return nFile;
	}



	@Override
	public int update(Connection conn, Notice notice) {

		System.out.println("업데이트 쿼리 전" + notice);
		
		String sql = "";
		sql += "UPDATE notice ";
		sql += " SET";
		sql += "	ncategory = ?";
		sql += "	, ntitle = ?";
		sql += "	, ncontent = ?";
		sql += "	, ntop = ?";
		sql += " WHERE nno = ?";
		
		int res = 0;

		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, notice.getNcategory());
			ps.setString(2, notice.getNtitle());
			ps.setString(3, notice.getNcontent());
			ps.setInt(4, notice.getNtop());
			ps.setInt(5, notice.getNno());
			
			res = ps.executeUpdate();
			
			System.out.println("업데이트 쿼리 후" + notice);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;

	}

	//공지 첨부파일 삭제
	@Override
	public int deleteFile(Connection conn, Notice notice) {

		String sql = "";
		sql += "DELETE nfile ";
		sql += " WHERE nno = ?";
		
		int res = 0;

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, notice.getNno());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
		
	}


	//게시물 삭제
	@Override
	public int delete(Connection conn, Notice notice) {
		
		String sql = "";
		sql += "DELETE notice";
		sql += " WHERE nno = ?";
		
		int res = 0;

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, notice.getNno());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
		
	}


	@Override
	public List<Notice> selectAllSearch(Connection conn, Paging paging, String keyWord, String searchWord) {
	
		//SQL작성
		String sql = "";
		sql += "SELECT * FROM (";
		sql += "	SELECT rownum rnum, N.* FROM (";
		sql += "	        SELECT";
		sql += "			  nno, ncategory, ntitle, nhit, nwritedate";
		sql += "			FROM notice";
		sql += "			WHERE ncategory LIKE '?'";
		sql += "			AND (ncontent LIKE ? OR ntitle LIKE ? )";
		sql += "	        ORDER BY ntop DESC, nno DESC";
		sql += " 	) N";
		sql += " ) NOTICE";
		sql += " WHERE rnum BETWEEN ? AND ?";
		
		
		//결과 저장할 List
		List<Notice> noticeSerchList = new ArrayList<>();
		
		try {
			//SQL 수행 객체 생성
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, keyWord);
			ps.setString(2, "%" + searchWord + "%");
			ps.setString(3, "%" + searchWord + "%");
			ps.setInt( 4, paging.getStartNo() );
			ps.setInt( 5, paging.getEndNo() );
			
			//SQL 수행 및 결과 저장
			rs = ps.executeQuery();
			
			//조회 결과 처리
			while(rs.next() ) {
				Notice n = new Notice();	 //결과값 저장 객체
				
				n.setNno(rs.getInt("nno"));
				n.setNcategory(rs.getString("ncategory"));
				n.setNtitle(rs.getString("ntitle"));
				n.setNwritedate(rs.getDate("nwritedate"));
				n.setNhit(rs.getInt("nhit"));
				
				//리스트에 결과값 저장
				noticeSerchList.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		return noticeSerchList;
	}


	@Override
	public int selectCntSearch(Connection conn, String keyWord, String searchWord) {

		//SQL 작성
		String sql = "";
		sql += "SELECT count(*) cnt FROM notice";
		sql += " WHERE ncategory LIKE ?";
		sql += " 	AND (ncontent LIKE ? OR ntitle LIKE ?)";
		
		//총 게시글 수
		int count = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, keyWord);
			ps.setString(2, "%" + searchWord + "%");
			ps.setString(3, "%" + searchWord + "%");
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				count = rs.getInt("cnt");
				System.out.println(count);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return count;
	}



}
