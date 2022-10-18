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
		
		// 전달파라미터 정보 얻어오기
		User user = updateService.getUpdateUserpw(req);
		
		// 비밀번호 수정 처리
		updateService.updatePw(user);
		System.out.println("UpdatePwController doPost() - 비밀번호 수정 확인" + user);
		
		// 비밀번호 수정 성공 페이지로 이동
		req.getRequestDispatcher("/WEB-INF/views/user/updatePwSuccess.jsp").forward(req, resp);
		
	}
	
}
