package web.controller.trade;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Trade;
import web.dto.TradeImg;
import web.service.face.trade.TradeService;
import web.service.impl.trade.TradeServiceImpl;


@WebServlet("/trade/update")
public class TradeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TradeService tradeService = new TradeServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//전달 파라미터에서 거래글 번호 가져와 객체에 저
		Trade tradeno = tradeService.getTradeno(req);
		
		//거래글 상세보기 결과 조회
		Trade updateTrade = tradeService.view(tradeno);
		
		//거래글 상세보기 조회결과 값 전달
		req.setAttribute("updateTrade", updateTrade);
		
		//첨부파일 정보 조회
		TradeImg tradeImg = tradeService.viewImg(tradeno);
		
		req.setAttribute("tradeImg", tradeImg);
		
		req.getRequestDispatcher("/WEB-INF/views/trade/update.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		tradeService.update(req);
		
		resp.sendRedirect("/trade/list");
		
	}

}
