package web.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Nfile;
import web.dto.Notice;
import web.service.face.notice.NoticeService;
import web.service.impl.notice.NoticeServiceImpl;


@WebServlet("/notice/update")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//서비스 객체
	private NoticeService noticeService = new NoticeServiceImpl();
	
	//doGet에서는 페이지가 로드될 때 바로 셋팅 될 화면!!!
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("NoticeUpdateController doGet() - 전달파라미터 nno : " + req.getParameter("nno"));
		
		//전달파라미터 저장 객체 얻기
		Notice nno = noticeService.getNoticeno(req);
		System.out.println("NoticeUpdateController doGet() - 전달파라미터 객체 : " + nno);
		
		
		
		//상세보기 결과 조회
		Notice updateNotice = noticeService.view(nno);
		System.out.println("NoticeUpdateController doGet() - 상세보기 객체 : " + updateNotice);
		
		//조회결과 MODEL값 전달
		req.setAttribute("updateNotice", updateNotice);

		
		//첨부파일 정보 조회
		Nfile nFile = noticeService.viewFile(updateNotice);
		
		//첨부파일 정보를 MODEL값 전달
		req.setAttribute("nFile", nFile);
		
		
		
		//VIEW 지정 및 응답
		req.getRequestDispatcher("/WEB-INF/views/notice/noticeUpdate.jsp").forward(req, resp);
	
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		noticeService.update(req);
		
		resp.sendRedirect("/33/notice/list");
		
	}
	
	
	
}
