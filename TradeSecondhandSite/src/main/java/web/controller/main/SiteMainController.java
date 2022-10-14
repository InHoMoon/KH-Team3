package web.controller.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Trade;
import web.service.face.main.MainService;
import web.service.impl.main.MainServiceImpl;


@WebServlet("/main")
public class SiteMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//Service 객체 생성
	private MainService mainService = new MainServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//오늘하루 등록된 글 수
		int newPostCnt = mainService.getNewPostCnt();
		System.out.println(newPostCnt);

		
		//글 수 객체 전달
		req.setAttribute("newPostCnt", newPostCnt);
		
		
		//최신 글 목록
		List<Trade> newlist = mainService.getNewList();
		
		//최신글목록 객체 전달
		req.setAttribute("newlist", newlist);
		
		req.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(req, resp);
	
	}
}
