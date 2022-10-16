package web.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Paging;
import web.dto.Trade;
import web.service.face.mypage.MypostService;
import web.service.face.mypage.WishListService;
import web.service.impl.mypage.MypostServiceImpl;
import web.service.impl.mypage.WishListServiceImpl;

@WebServlet("/mypage")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MypostService mypostService = new MypostServiceImpl();
	private WishListService wishListService = new WishListServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//세션 정보 객체
		HttpSession session = req.getSession();
		
		String url = null;

		if( session.getAttribute("userno") == null ) {

			url = "/WEB-INF/views/mypage/accessFailure.jsp";
		} else {

			int userno = (int) session.getAttribute("userno");
			String userid = (String) session.getAttribute("userid");

			//전달파라미터에서 현재 페이징 객체 계산하기
			Paging paging = mypostService.getPaging(req, userno);

			//게시글 페이징 목록 조회
			List<Trade> mypostList = mypostService.getList(paging, userno);
			
			//관심상품 목록 조회
			List<Trade> wishList = wishListService.getWishList(userid);
			
			//조회결과 MODEL값 전달
			req.setAttribute("mypostList", mypostList);
			req.setAttribute("wishList", wishList);

			//페이징 객체 MODEL값 전달
			req.setAttribute("paging", paging);
			
			url = "/WEB-INF/views/mypage/mypage.jsp";
		}

		// 포워드
		req.getRequestDispatcher(url).forward(req, resp);
	}
}
