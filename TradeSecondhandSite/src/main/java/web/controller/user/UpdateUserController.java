package web.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Ufile;
import web.dto.User;
import web.service.face.user.UpdateService;
import web.service.impl.user.UpdateServiceImpl;

@WebServlet("/update/user")
public class UpdateUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 서비스 객체
	private UpdateService updateService = new UpdateServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전달파라미터 저장 객체 얻기
		User userno = updateService.getUserno(req);
		System.out.println("UpdateUserController doGet() - 전달파라미터 객체 : " + userno);
		
		// 상세보기 결과 조회
		User updateUser = updateService.view(userno);
		System.out.println("UpdateUserController doGet() - 상세보기 객체 : " + updateUser);
		
		// 조회결과 MODEL값 전달
		req.setAttribute("updateUser", updateUser);
		
		// 첨부파일 정보 조회
		Ufile ufile = updateService.viewFile(updateUser);
		
		// 첨부파일 정보를 MODEL값 전달
		req.setAttribute("ufile", ufile);
		
		// VIEW 지정 및 응답
		req.getRequestDispatcher("/WEB-INF/views/user/update.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전달 파라미터에 대한 한글 인코딩 설정(UTF-8)
		req.setCharacterEncoding("UTF-8");
		
		// 회원수정 처리
		updateService.update(req);
		
		System.out.println("UpdateUserController doPost() - 회원수정 성공" + req);
		
		// 회원수정 성공 페이지로 이동
		req.getRequestDispatcher("/WEB-INF/views/user/updateSuccess.jsp").forward(req, resp);
		
	}
	
}
