package web.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dto.User;
import web.service.face.user.PwFindService;
import web.service.impl.user.PwFindServiceImpl;

@WebServlet("/pwFind")
public class PwFindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 서비스 객체
	private PwFindService pwFindService = new PwFindServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/user/pwFind.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전달 파라미터에 대한 한글 인코딩 설정(UTF-8)
		req.setCharacterEncoding("UTF-8");
		
		// 전달파라미터 비밀번호 정보 얻어오기
		User user = pwFindService.getPwFindUser(req);
		
		// 비밀번호 찾기 인증
		boolean isPwFind = pwFindService.pwFind(user);
		
		// 아이디 찾기 인증 성공
		if( isPwFind ) {
			
			// 세션 정보 객체
			HttpSession session = req.getSession();
			
			session.setAttribute("pwFind", isPwFind);
			session.setAttribute("userid", user.getUserid());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("useremail", user.getUseremail());
			
			// 비밀번호 수정 페이지로 리다이렉트
			resp.sendRedirect("/pw/update");
			
		} else {
			
			req.getRequestDispatcher("/WEB-INF/views/user/pwFindFail.jsp").forward(req, resp);
			
		}
		
	}
	
}
