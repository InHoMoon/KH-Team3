package web.controller.trade;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.service.face.trade.TradeService;
import web.service.impl.trade.TradeServiceImpl;


@WebServlet("/trade/cmtwrite")
public class CmtWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TradeService tradeService = new TradeServiceImpl();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		
		tradeService.writeCmt(req);
		
		resp.sendRedirect("/trade/list");
		
		
	}

}
