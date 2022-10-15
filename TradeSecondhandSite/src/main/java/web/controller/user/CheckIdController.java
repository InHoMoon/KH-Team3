package web.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import web.dto.User;
import web.service.face.user.JoinService;
import web.service.impl.user.JoinServiceImpl;

@WebServlet("/check/id")
public class CheckIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 서비스 객체
	private JoinService joinService = new JoinServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/check/id [GET]");
		
		req.getRequestDispatcher("/WEB-INF/views/user/join.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/check/id [POST]");

		// 전달파라미터 정보 얻어오기
		User user = joinService.getCheckId(req);
		
		// 아이디 중복체크 인증 값 전달
		boolean isCheckId = joinService.checkId(user); // true: 인증 성공, false: 인증 실패
		
		resp.setContentType("application/json; charset=utf-8"); // JSON 응답 형식
		
		// 응답 출력 스트림
		PrintWriter out = resp.getWriter();
		
		Map<String, Object> resultId = new HashMap<String, Object>();
		
		resultId.put("checkId", isCheckId);
		resultId.put("userid", user.getUserid());
		
		// JSP(View)를 이용한 AJAX 응답
		req.setAttribute("map", resultId); // 모델값 전달
		out.append( new Gson().toJson(resultId) );
		
	}
	
}
