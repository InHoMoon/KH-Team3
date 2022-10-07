package web.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.service.face.notice.NoticeService;
import web.service.impl.notice.NoticeServiceImpl;



@WebServlet("/notice/write")
public class NoticeWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private NoticeService noticeService = new NoticeServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/views/notice/noticeWrite.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//작성글 삽입
		noticeService.write(req);
		
		//목록으로 리다이렉트
		resp.sendRedirect("/33/notice/list");
	
	}
	
}
