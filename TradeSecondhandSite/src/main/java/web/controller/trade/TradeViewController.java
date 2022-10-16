package web.controller.trade;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Trade;
import web.dto.TradeCmt;
import web.dto.TradeImg;
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
		
		//게시물 상세 조회	
		Trade viewTrade = tradeService.view(tradeno);
		
		req.setAttribute("viewTrade", viewTrade);
		
		
		//첨부파일 정보 조회
		TradeImg tradeImg = tradeService.viewImg(tradeno);
		req.setAttribute("tradeImg", tradeImg);
		
		//댓글 상세 조회
		List<TradeCmt> cmtList = tradeService.viewCmt(tradeno);
		req.setAttribute("cmtList", cmtList);
		
		//관련상품 상세조회
		List<Trade> relatedList = tradeService.viewRelated(tradeno);
		req.setAttribute("relatedList", relatedList);
		
		
		
//		System.out.println(cmtList);
		
		
		req.getRequestDispatcher("/WEB-INF/views/trade/view.jsp").forward(req, resp);
	}
}
