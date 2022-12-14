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
		
		// 전달파라미터 정보 얻어오기
		User user = loginService.getLoginUser(req);
		
		// 로그인 인증
		boolean isLogin = loginService.login(user);
		
		// 로그인 인증 성공
		if( isLogin ) {
			System.out.println("LoginController doPost() - 로그인 성공" + user);
			
			// 로그인 사용자 정보 조회
			user = loginService.info(user);
			
			// 세션 정보 객체
			HttpSession session = req.getSession();
			
			session.setAttribute("login", isLogin);
			session.setAttribute("userno", user.getUserno());
			session.setAttribute("userid", user.getUserid());
			session.setAttribute("userphone", user.getUserphone());
			session.setAttribute("useraddr2", user.getUseraddr2());
			session.setAttribute("usernick", user.getUsernick());
			session.setAttribute("usergrade", user.getUsergrade());
			
			System.out.println("LoginController doPost() - 세션 정보 객체 확인" + user);
			
			// 메인페이지로 리다이렉트
			resp.sendRedirect("/");
			
		} else {
			System.out.println("LoginController doPost() - 로그인 실패" + user);
			
			// 로그인 실패 페이지로 이동
			req.getRequestDispatcher("/WEB-INF/views/user/loginFail.jsp").forward(req, resp);
			
		}
		
	}
	
}
