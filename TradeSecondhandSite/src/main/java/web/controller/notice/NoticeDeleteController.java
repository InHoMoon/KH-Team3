package web.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Notice;
import web.service.face.notice.NoticeService;
import web.service.impl.notice.NoticeServiceImpl;


@WebServlet("/notice/delete")
public class NoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//서비스 객체
	private NoticeService noticeService = new NoticeServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//해당 게시물의 번호 객체를 얻어서
		Notice notice = noticeService.getNoticeno(req);
		
		//그 객체를 삭제
		noticeService.delete( notice );
		
		//목록으로 리다이렉트
		resp.sendRedirect("/33/notice/list");
				
	}
	
	
}
