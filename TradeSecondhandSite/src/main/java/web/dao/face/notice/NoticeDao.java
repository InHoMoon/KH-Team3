package web.dao.face.notice;

import java.sql.Connection;
import java.util.List;

import util.Paging;
import web.dto.Nfile;
import web.dto.Notice;

public interface NoticeDao {

	/** 
	 * 테이블 전체 조회
	 * 
	 * @param conn - DB연결 객체
	 * @return List<Notice> -  Notice 테이블의 전체 조회 결과 목록을 List로 반환한다
	 */
	public List<Notice> selectAll(Connection conn);

	
	/** 
	 * Notice 테이블 전체 조회
	 * 	->페이징 처리 추가
	 * 
	 * @param conn - DB연결 객체
	 * @param paging - 페이징 정보 객체
	 * @return List<Notice> -  테이블 페이징 목록 조회 결과
	 */
	public List<Notice> selectAll(Connection conn, Paging paging);
	
	
	/** 
	 * 총 게시글 수 조회
	 * 
	 * @param conn - DB 연결 객체
	 * @return int - 테이블의 전체 행 수
	 */
	public int selectCntAll(Connection conn);



	/** 
	 * 조회된 게시글의 조회수 증가시키기
	 * 
	 * @param conn - DB 연결 객체
	 * @param nno - 조회할 게시글의 nno를 가진 DTO객체
	 * @return int - UPDATE쿼리 수행 결과
	 */
	public int updateHit(Connection conn, Notice nno);

	
	/** 
	 * 지정된 nno의 게시글 조회하기
	 * 
	 * @param conn - DB 연결 객체
	 * @param nno - 조회할 게시글의 nno를 가진 DTO객체
	 * @return Notice - 조회된 게시글의 상세정보 DTO객체
	 */
	public Notice selectNoticeByNno(Connection conn, Notice nno);


	/**
	 * 디비에 게시글 입력
	 * 
	 * 
	 * @param conn - DB연결 객체
	 * @param notice - 삽입될 게시글 내용
	 * @return int - INSERT 쿼리 수행 결과
	 */
	public int insert(Connection conn, Notice notice);


	
	/**
	 * 시퀀스를 이용하여 다음 게시글 번호 조회하기
	 * 
	 * @param conn - DB연결 객체
	 * @return int - 다음 게시글 번호
	 */
	public int selectNextNno(Connection conn);


	/**
	 * 첨부파일 삽입
	 * 
	 * @param conn - DB연결 객체
	 * @param Nfile - 첨부파일 정보
	 * @return int - INSERT 수행 결과
	 */
	public int insertFile(Connection conn, Nfile nfile);

	/**
	 * 첨부파일 정보 조회
	 * 
	 * @param conn - DB연결 객체
	 * @param viewNotice - 조회할 게시글 번호
	 * @return Nfile - 첨부파일 정보
	 */
	public Nfile selectFile(Connection conn, Notice viewNotice);

	
	/**
	 * 게시글 수정
	 * 
	 * @param conn - DB연결 객체
	 * @param notice - 수정할 내용을 담은 객체
	 * @return UPDATE 수행 결과
	 */
	public int update(Connection conn, Notice notice);

	
	/**
	 * 게시글에 첨부된 파일 정보 삭제 
	 * (FK로 참조하고있는 파일먼저 삭제!! 후 게시글 삭제)
	 * 
	 * @param conn - DB연결 객체
	 * @param notice - 삭제할 게시글 번호(가 담긴 객체)
	 * @return UPDATE 수행 결과
	 */
	public int deleteFile(Connection conn, Notice notice);
	
	/**
	 * 게시글 삭제
	 * 
	 * @param conn - DB연결 객체
	 * @param notice - 삭제할 게시글 번호(가 담긴 객체)
	 * @return UPDATE 수행 결과
	 */
	public int delete(Connection conn, Notice notice);


	
	//----검색 기능(페이징 없)-----------------------------
	
	/**
	 * Notice 테이블 검색결과 전체 조회 (페이징 없이)
	 * 
	 * @param connection - 연결
	 * @param keyWord - 분류 키워드
	 * @param searchWord - 검색 키워드
	 * @return 검색된 테이블 목록 조회 결과
	 */
	public List<Notice> selectAllSearch(Connection connection, String keyWord, String searchWord);
	
	
	
	
	//----검색 기능(페이징)-----------------------------
	
	/** 
	 * Notice 테이블 검색결과 전체 조회
	 * 	->페이징 처리 추가
	 * 
	 * @param conn - DB연결 객체
	 * @param paging - 페이징 정보 객체
	 * @return List<Notice> -  테이블 페이징 목록 조회 결과
	 */
	public List<Notice> selectAllSearch(Connection conn, Paging paging, String keyWord, String searchWord);
	
	
	/** 
	 * 총 게시글 수 조회
	 * 
	 * @param conn - DB 연결 객체
	 * @return int - 테이블의 전체 행 수
	 */
	public int selectCntSearch(Connection conn, String keyWord, String searchWord);

	

}
