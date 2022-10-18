package web.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dto.User;
import web.dto.addWishList;
import web.service.face.mypage.WishListService;
import web.service.impl.mypage.WishListServiceImpl;

@WebServlet("/wish")
public class WishListRestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	WishListService wishListService = new WishListServiceImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		addWishList wishList = new addWishList();
		
		HttpSession session = req.getSession();

		User member = (User)session.getAttribute("login");
		wishList.setUserid(member.getUserid());
		
		wishListService.addWishList(req, wishList);
		
		
//		req.getParameter("tradeno");
//		System.out.println(req.getParameter("tradeno"));
		
//		String text = new String(req.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
//		System.out.println(text);
		
		
		
		
//		System.out.println("test");
//
//
//
//		
//		System.out.println(text);
//		System.out.println("test");
		
	}
}
