package web.controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import web.dto.Ncomment;
import web.service.face.notice.NcmtService;
import web.service.impl.notice.NcmtServiceImpl;


@WebServlet("/ncmt/write")
public class NcmtWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private NcmtService ncmtService = new NcmtServiceImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/ncmt/write [POST]");		
		
		//게시글 번호 받기
		int noticeno = Integer.parseInt(req.getParameter("nno"));
		
		System.out.println(noticeno);
		
		//댓글 작성
		ncmtService.ncmtWrite(req);
		
		
		//작성 댓글 포함 댓글 리스트 출력
		List<Ncomment> ncmtList = ncmtService.getCmtList(noticeno);
		
		req.setAttribute("ncmtList", ncmtList);
		
		
		req.getRequestDispatcher("/WEB-INF/views/notice/ncmtList.jsp").forward(req, resp);
	}
}
