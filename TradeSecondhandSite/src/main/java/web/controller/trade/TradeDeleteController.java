package web.controller.trade;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Trade;
import web.service.face.trade.TradeService;
import web.service.impl.trade.TradeServiceImpl;


@WebServlet("/trade/delete")
public class TradeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TradeService tradeService = new TradeServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Trade tradeno = tradeService.getTradeno(req);
		
		tradeService.delete(tradeno);
		
		resp.sendRedirect("/trade/list");
		
	}

}
