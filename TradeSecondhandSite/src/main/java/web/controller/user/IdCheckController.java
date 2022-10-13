package web.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/id/check")
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("/id/check [GET]");
		
		req.getRequestDispatcher("/WEB-INF/views/user/join.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("/id/check [POST]");
		
		resp.setContentType("application/json; charset=utf-8"); // JSON 응답 형식
		
		// 응답 출력 스트림
		PrintWriter out = resp.getWriter();
		
	}
	
}
