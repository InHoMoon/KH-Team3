package web.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.User;
import web.service.face.user.UpdateService;
import web.service.impl.user.UpdateServiceImpl;

@WebServlet("/update/pw")
public class UpdatePwController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 서비스 객체
	private UpdateService updateService = new UpdateServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/user/updatePw.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 회원수정 전달파라미터 추출하기
		User user = updateService.getUpdateUserpw(req);
		
		// 회원수정 처리
		updateService.updatePw(user);
		
		// 로그인 페이지로 리다이렉트
		resp.sendRedirect("/login");
		
	}
	
}
