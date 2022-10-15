package web.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Paging;
import web.dto.Trade;
import web.service.face.mypage.MypostService;
import web.service.impl.mypage.MypostServiceImpl;

@WebServlet("/mypage/mypost")
public class MypostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MypostService mypostService = new MypostServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//세션 정보 객체
		HttpSession session = req.getSession();
		
		int userno = (int) session.getAttribute("userno");

		//페이징 객체 생성
		Paging paging = mypostService.getPaging(req, userno);

		//페이징 된 게시글 목록 조회
		List<Trade> mypostList = mypostService.getList(paging, userno);

		//게시글 목록 조회 결과 전달
		req.setAttribute("mypostList", mypostList);

		//페이징 객체 전달
		req.setAttribute("paging", paging);
		
		//포워드
		req.getRequestDispatcher("/WEB-INF/views/mypage/mypost.jsp").forward(req, resp);
	}
}