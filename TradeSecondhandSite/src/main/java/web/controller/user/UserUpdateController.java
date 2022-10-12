package web.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.User;
import web.service.face.user.UserUpdateService;
import web.service.impl.user.UserUpdateServiceImpl;

@WebServlet("/user/update")
public class UserUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 서비스 객체
	private UserUpdateService userUpdateService = new UserUpdateServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/user/update.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전달 파라미터에 대한 한글 인코딩 설정(UTF-8)
		req.setCharacterEncoding("UTF-8");
		
		// 회원수정 전달파라미터 추출하기
		User user = userUpdateService.getUpdateUser(req);
		
		// 회원수정 처리
		userUpdateService.update(user);
		
		System.out.println("UserUpdateController doPost() - 회원수정 성공" + user);
		
		// 회원수정 성공 페이지로 이동
		req.getRequestDispatcher("/WEB-INF/views/user/updateSuccess.jsp").forward(req, resp);
		
	}
	
}
