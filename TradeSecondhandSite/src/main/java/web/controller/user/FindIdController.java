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
		
		// 전달파라미터 아이디 정보 얻어오기
		User user = findService.getFindUserid(req);
		
		// 아이디 찾기 인증
		boolean isFindId = findService.findId(user);
		
		// 포워딩 URL
		String url = null;
		
		// 아이디 찾기 인증 성공
		if( isFindId ) {
			
			// 로그인 사용자 정보 조회
			user = findService.info(user);
			
			// 세션 정보 객체
			HttpSession session = req.getSession();
			
			session.setAttribute("FindId", isFindId);
			session.setAttribute("userid", user.getUserid());
			session.setAttribute("username", user.getUsername());
			
			url = "/WEB-INF/views/user/findIdSuccess.jsp";
			
		} else {
			
			url = "/WEB-INF/views/user/findIdFail.jsp";
			
		}
		
		// 포워드 
		req.getRequestDispatcher(url).forward(req, resp);
		
	}
	
}
