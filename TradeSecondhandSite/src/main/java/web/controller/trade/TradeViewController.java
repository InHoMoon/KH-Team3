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



@WebServlet("/trade/view")
public class TradeViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TradeService tradeService = new TradeServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//전달 파라미터 tradeno 저장 
		Trade tradeno = tradeService.getTradeno(req);
				
		Trade viewTrade = tradeService.view(tradeno);
				
		req.setAttribute("viewTrade", viewTrade);
				
		req.getRequestDispatcher("/WEB-INF/views/trade/view.jsp").forward(req, resp);
	}

}
