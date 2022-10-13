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

		List<Trade> newlist = mainService.getNewList();
		
		//조회된 결과(MODEL값)를 "newlist"라는 이름으로 JSP코드에 list객체를 전달한다
		req.setAttribute("newlist", newlist);
		
		req.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(req, resp);
	
	}
}
