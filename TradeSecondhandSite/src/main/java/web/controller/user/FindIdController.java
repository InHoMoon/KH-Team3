package web.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.User;
import web.service.face.user.FindService;
import web.service.impl.user.FindServiceImpl;

@WebServlet("/find/id")
public class FindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 서비스 객체
	private FindService findService = new FindServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/user/findId.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전달 파라미터에 대한 한글 인코딩 설정(UTF-8)
		req.setCharacterEncoding("UTF-8");
		
		// 전달파라미터 정보 얻어오기
		User user = findService.getFindUserid(req);
		
		// 아이디 찾기 인증
		boolean isFindId = findService.findId(user);
		
		// 아이디 찾기 인증 성공
		if( isFindId ) {
			
			// userid 정보 저장
			user = findService.info(user);
			
		}
		
		// 회원정보 MODEL값 전달
		req.setAttribute("user", user);
		
		// 아이디 찾기 결과 페이지로 이동 
		req.getRequestDispatcher("/WEB-INF/views/user/findIdResult.jsp").forward(req, resp);
		
	}
	
}
