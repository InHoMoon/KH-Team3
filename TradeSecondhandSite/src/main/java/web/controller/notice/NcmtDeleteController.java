package web.controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Ncomment;
import web.service.face.notice.NcmtService;
import web.service.impl.notice.NcmtServiceImpl;


@WebServlet("/ncmt/delete")
public class NcmtDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private NcmtService ncmtService = new NcmtServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//댓글 id 번호 받기
		int ncmtid = Integer.parseInt(req.getParameter("ncmtid"));
		
		//댓글 삭제
		ncmtService.ncmtDelete(ncmtid);
		
		//게시글 번호 받기 (전체목록 반환)
		int noticeno = Integer.parseInt(req.getParameter("nno"));
				
		
		//작성 댓글 포함 댓글 리스트 출력
		List<Ncomment> ncmtList = ncmtService.getCmtList(noticeno);
		
		req.setAttribute("ncmtList", ncmtList);
		
		req.getRequestDispatcher("/WEB-INF/views/notice/ncmtList.jsp").forward(req, resp);
	}
}
