package web.service.face.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Ncomment;
import web.dto.Notice;

public interface NcmtService {

	/**
	 * 전달된 댓글 객체 생성
	 * @param req
	 * @return
	 */
	public Ncomment getNcmtParam(HttpServletRequest req);
	
	//댓글 목록 조회
	public List<Ncomment> getCmtList(int nno);
	
	//댓글 작성
	public void ncmtWrite(HttpServletRequest req);
	
	
	//댓글 수정
	public void ncmtUpdate(HttpServletRequest req, int ncmtid);
	
	
	//댓글 삭제
	public void ncmtDelete(int ncmtid);

	
}
