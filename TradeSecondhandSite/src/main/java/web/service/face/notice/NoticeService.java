package web.service.face.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.Nfile;
import web.dto.Notice;

public interface NoticeService {
	
	/** 
	 * 게시글 전체 조회
	 * 
	 * @return List<Notice> - 게시글 전체 조회 결과 목록
	 */
	public List<Notice> getList();

	
	
	/** 
	 * 게시글 전체 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return List<Notice> - 게시글 전체 조회 결과 목록
	 */
	public List<Notice> getNoticeList(Paging paging);
	
	
	
	/** 
	 * 게시글 페이징 객체 생성
	 * 
	 * @param req - 요청 정보 객체
	 * @return Paging - 페이징 계산이 완료된 객체
	 */
	public Paging getPaging(HttpServletRequest req);

	
	
	
	/** 
	 * 전달파라미터를 Notice DTO로 저장하여 반환
	 * 
	 * @param req - 요청 정보 객체
	 * @return Notice - 전달파라미터 nno를 저장한 객체 
	 */
	public Notice getNoticeno(HttpServletRequest req);

	
	
	/**
	 * 전달된 nno를 이용하여 게시글을 조회한다
	 * 조회된 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param nno - 조회할 nno를 가진 DTO객체
	 * @return Notice - 조회된 게시글 정보
	 */
	public Notice view(Notice nno);



	/**
	 * 게시글 작성
	 * 입력한 게시글을 DB에 저장한다
	 * 
	 * @param req  -요청정보객체
	 */
	public void write(HttpServletRequest req);



	
	/**
	 * 첨부파일 정보 조회하기
	 * 
	 * @param viewNotice - 첨부파일과 연결된 게시글의 번호
	 * @return Nfile - 첨부파일 정보 DTO객체
	 */
	public Nfile viewFile(Notice viewNotice);
	
	
	/**
	 * 게시글 수정
	 * 
	 * @param req - 요청 정보 객체
	 */
	public void update(HttpServletRequest req);

	

	/**
	 * 게시글 삭제
	 * @param nno - 삭제하려는 게시글 번호
	 */
	public void delete(Notice notice);
	
	
	//-------검색(페이징 없)
	
	/**
	 * 검색 게시글 전체 조회
	 * 
	 * @param keyWord - 분류 키워드
	 * @param searchWord - 제목/내용 검색어
	 * @return 
	 */
	public List<Notice> getSearch(String keyWord, String searchWord);
	
	
	
	
	//----검색 (페이징 있)------
	
	/** 
	 * 검색 게시글 페이징 객체 생성
	 * 
	 * @param req - 요청 정보 객체
	 * @return Paging - 검색 페이징 계산이 완료된 객체
	 */
	public Paging getSearchPaging(HttpServletRequest req, String keyWord, String searchWord );
	
	
	
	/** 
	 * 검색 게시글 전체 조회 (페이징)
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return List<Notice> - 검색 게시글 전체 조회 결과 목록
	 */
	public List<Notice> getNoticeSearchList(Paging paging,String keyWord, String searchWord);



}
