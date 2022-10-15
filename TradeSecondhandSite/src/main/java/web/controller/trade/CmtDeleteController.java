package web.controller.trade;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.service.face.trade.TradeService;
import web.service.impl.trade.TradeServiceImpl;

/**
 * Servlet implementation class CmtDeleteController
 */
@WebServlet("/trade/cmtdel")
public class CmtDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TradeService tradeService = new TradeServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		//댓글 번호로 게시물 번호 가저오기
		int tradeno = tradeService.getTradenoByCmtno(req);
		
		
		//댓글 삭제
		tradeService.deleteCmt(req);
		
		
		resp.sendRedirect("/trade/view?tradeno="+tradeno);
	}

}
