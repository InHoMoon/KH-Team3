package web.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dto.Trade;
import web.dto.TradeImg;
import web.service.face.mypage.WishListService;
import web.service.face.trade.TradeService;
import web.service.impl.mypage.WishListServiceImpl;
import web.service.impl.trade.TradeServiceImpl;

@WebServlet("/mypage/wishlist")
public class WishListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//서비스 객체 생성
	private WishListService wishListService = new WishListServiceImpl();
	private TradeService tradeService = new TradeServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//세션 정보 객체
		HttpSession session = req.getSession();

		//---------------------------------------------------------
		
		String url = null;

		if( session.getAttribute("userid") == null ) {
			
			//비로그인 상태 전달할 URL
			url = "/WEB-INF/views/mypage/accessFailure.jsp";
		} else {
			
			String userid = (String) session.getAttribute("userid");
			
			//위시리스트 목록 조회
			List<Trade> wishList = wishListService.getWishList(userid);

			//조회결과 MODEL값 전달
			req.setAttribute("wishList", wishList);	
			
			//로그인 상태 전달할 URL
			url = "/WEB-INF/views/mypage/wishlist.jsp";
		}

		// 포워드
		req.getRequestDispatcher(url).forward(req, resp);
		
		//----------------------------------------------------------
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
