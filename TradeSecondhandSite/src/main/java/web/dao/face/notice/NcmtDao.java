package web.dao.face.notice;

import java.sql.Connection;
import java.util.List;

import web.dto.Ncomment;

public interface NcmtDao {

	List<Ncomment> selectAllNcmt(Connection conn, int  nno);

	int insertNcmt(Connection conn, Ncomment ncomment);

	int updateNcmt(Connection conn, Ncomment ncomment, int ncmtid);

	int deleteNcmt(Connection conn, int ncmtid);

	
	
}
