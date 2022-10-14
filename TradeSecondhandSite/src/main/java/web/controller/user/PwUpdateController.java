package web.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.User;
import web.service.face.user.PwUpdateService;
import web.service.impl.user.PwUpdateServiceImpl;

@WebServlet("/pw/update")
public class PwUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 서비스 객체
	private PwUpdateService pwUpdateService = new PwUpdateServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/user/pwUpdate.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 회원수정 전달파라미터 추출하기
		User user = pwUpdateService.getpwUpdate(req);
		
		// 회원수정 처리
		pwUpdateService.update(user);
		
		// 로그인 페이지로 리다이렉트
		resp.sendRedirect("/login");
		
	}
	
}
