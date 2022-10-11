package web.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dto.User;
import web.service.face.user.IdFindService;
import web.service.impl.user.IdFindServiceImpl;

@WebServlet("/idFind")
public class IdFindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 서비스 객체
	private IdFindService idFindService = new IdFindServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/user/idFind.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전달파라미터 아이디 정보 얻어오기
		User user = idFindService.getIdFindUser(req);
		
		// 아이디 찾기 인증
		boolean isIdFind = idFindService.idFind(user);
		
		// 포워딩 URL
		String url = null;
		
		// 아이디 찾기 인증 성공
		if( isIdFind ) {
			
			// 로그인 사용자 정보 조회
			user = idFindService.info(user);
			
			// 세션 정보 객체
			HttpSession session = req.getSession();
			
			session.setAttribute("idFind", isIdFind);
			session.setAttribute("username", user.getUsername());
			session.setAttribute("userid", user.getUserid());
			
			url = "/WEB-INF/views/user/idFindSuccess.jsp";
			
		} else {
			
			url = "/WEB-INF/views/user/idFindFail.jsp";
			
		}
		
		// 포워드 
		req.getRequestDispatcher(url).forward(req, resp);
		
	}
	
}
