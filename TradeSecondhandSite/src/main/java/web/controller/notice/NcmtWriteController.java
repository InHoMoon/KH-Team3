package web.controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Ncomment;
import web.service.face.notice.NcmtService;
import web.service.impl.notice.NcmtServiceImpl;


@WebServlet("/ncmt/write")
public class NcmtWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private NcmtService ncmtService = new NcmtServiceImpl();
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/ncmt/write [POST]");		
		
		System.out.println();
		
		
		req.getRequestDispatcher("/WEB-INF/views/notice/ncmtList.jsp").forward(req, resp);
	}
}
