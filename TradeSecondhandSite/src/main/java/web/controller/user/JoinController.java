package web.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.User;
import web.service.face.user.JoinService;
import web.service.impl.user.JoinServiceImpl;

@WebServlet("/join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 서비스 객체
	private JoinService joinService = new JoinServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/user/join.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 회원가입 전달파라미터 추출하기
		User user = joinService.getJoinUser(req);
		
		// 회원가입 처리
		joinService.join(user);
		
		System.out.println("JoinController doPost() - 회원가입 성공" + user);
		
		// 회원가입 성공 페이지로 이동
		req.getRequestDispatcher("/WEB-INF/views/user/joinSuccess.jsp").forward(req, resp);
		
	}
	
}
