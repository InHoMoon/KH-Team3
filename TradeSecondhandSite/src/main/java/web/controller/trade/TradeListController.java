package web.controller.trade;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Paging;
import web.dto.Trade;
import web.service.face.trade.TradeService;
import web.service.impl.trade.TradeServiceImpl;




@WebServlet("/trade/list")
public class TradeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TradeService tradeService = new TradeServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//페이징 객체 생성
		Paging paging = tradeService.getPaging(req);
		
		//페이징 된 게시글 목록 조회
		List<Trade> tradeList = tradeService.getList(paging);
		
		//게시글 목록 조회 결과 전달
		req.setAttribute("tradeList", tradeList);
		
		//페이징 객체 전달
		req.setAttribute("paging", paging);
		
		req.getRequestDispatcher("/WEB-INF/views/trade/list.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//입력받은 검색 dto객체에 저장
		Trade search = tradeService.getSearch(req);
		
		//페이징 객체 생성
		Paging paging = tradeService.getPaging(req);
		
		List<Trade> searchList = tradeService.searchList(search, paging);
		
		//게시글 목록 조회 결과 전달
		req.setAttribute("searchList", searchList);
		
		//페이징 객체 전달
		req.setAttribute("paging", paging);
		
		req.getRequestDispatcher("/WEB-INF/views/trade/searchList.jsp").forward(req, resp);
	}

}
