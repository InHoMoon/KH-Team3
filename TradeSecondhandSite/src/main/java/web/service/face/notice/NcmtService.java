package web.service.face.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Ncomment;
import web.dto.Notice;

public interface NcmtService {

	
	//댓글 목록 조회
	public List<Ncomment> getCmtList(String  nno);
	
	//댓글 작성
	public void ncmtWrite(HttpServletRequest req, Ncomment ncomment);
	
	
	//댓글 수정
	public void ncmtUpdate(HttpServletRequest req, Ncomment ncomment);
	
	
	//댓글 삭제
	public void ncmtDelete(Ncomment ncomment);
}
