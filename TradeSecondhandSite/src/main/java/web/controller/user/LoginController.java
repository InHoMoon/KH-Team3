package web.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dto.User;
import web.service.face.user.LoginService;
import web.service.impl.user.LoginServiceImpl;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 서비스 객체
	private LoginService loginService = new LoginServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전달파라미터 로그인 정보 얻어오기
		User user = loginService.getLoginUser(req);
		
		// 로그인 인증
		boolean isLogin = loginService.login(user);
		
		// 포워딩 URL
		String url = null;
		
		// 로그인 인증 성공
		if( isLogin ) {
			System.out.println("LoginController doPost() - 로그인 성공" + user);
			
			// 로그인 사용자 정보 조회
			user = loginService.info(user);
			
			// 세션 정보 객체
			HttpSession session = req.getSession();
			
			session.setAttribute("login", isLogin);
			session.setAttribute("userid", user.getUserid());
			session.setAttribute("usernick", user.getUsernick());
			session.setAttribute("usergrade", user.getUsergrade());
			session.setAttribute("useraddr", user.getUseraddr());
			
			System.out.println("LoginController doPost() - 세션 정보 객체 확인" + user);
			
			url = "/WEB-INF/views/main.jsp";
			
		} else {
			System.out.println("LoginController doPost() - 로그인 실패" + user);
			
			url = "/WEB-INF/views/user/loginFail.jsp";
			
		}
		
		// 포워드 
		req.getRequestDispatcher(url).forward(req, resp);
		
	}
	
}
