package web.dao.face.main;

import java.sql.Connection;
import java.util.List;

import web.dto.Trade;

public interface MainDao {

	/**
	 * trade테이블 최신글 8개 조회
	 * 
	 * @param connection - DB 연결 객체
	 * @return List<Trade> - Trade 테이블의 최신 조회 결과 8개
	 */
	List<Trade> selectNewPost(Connection conn);

}
