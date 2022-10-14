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


@WebServlet("/ncmt/list")
public class NcmtListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private NcmtService ncmtService = new NcmtServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String nno = req.getParameter("nno");
		
		List<Ncomment> ncmtList = null;
		
		ncmtList = ncmtService.getCmtList( nno );		
		
		req.setAttribute("ncmtList", ncmtList);
		
		
		req.getRequestDispatcher("/WEB-INF/views/notice/ncmtList.jsp").forward(req, resp);
		
	}
	

}
