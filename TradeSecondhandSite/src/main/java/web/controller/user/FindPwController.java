package web.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dto.User;
import web.service.face.user.FindService;
import web.service.impl.user.FindServiceImpl;

@WebServlet("/find/pw")
public class FindPwController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 서비스 객체
	private FindService findService = new FindServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/user/findPw.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전달 파라미터에 대한 한글 인코딩 설정(UTF-8)
		req.setCharacterEncoding("UTF-8");
		
		// 전달파라미터 정보 얻어오기
		User user = findService.getFindUserpw(req);
		
		// 비밀번호 찾기 인증
		boolean isFindPw = findService.findPw(user);
		
		// 비밀번호 찾기 인증 성공
		if( isFindPw ) {
			
			// 세션 정보 객체
			HttpSession session = req.getSession();
			
			session.setAttribute("FindPw", isFindPw);
			session.setAttribute("userid", user.getUserid());
			
			// 비밀번호 수정 페이지로 리다이렉트
			resp.sendRedirect("/update/pw");
			
		} else {
			
			// 비밀번호 찾기 살패 페이지로 이동 
			req.getRequestDispatcher("/WEB-INF/views/user/findPwFail.jsp").forward(req, resp);
			
		}
		
	}
	
}
