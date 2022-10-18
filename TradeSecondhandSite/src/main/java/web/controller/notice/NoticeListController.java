package web.controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Paging;
import web.dto.Notice;
import web.dto.NoticeImage;
import web.service.face.notice.NoticeService;
import web.service.impl.notice.NoticeServiceImpl;


@WebServlet("/notice/list")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	//Service 객체 생성
	private NoticeService noticeService = new NoticeServiceImpl();
		
	
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			// 전달파라미터에서 현재 페이징 객체 계산하기
			Paging paging = noticeService.getPaging(req);
			System.out.println(paging);
			
			List<NoticeImage> list = null;	//이미지포함 게시글
				
			//게시글 페이징 목록 조회
			list = noticeService.getNoticeImageList( paging );
				
			
			//조회된 결과(MODEL값)를 "noticeList"라는 이름으로 JSP코드에 list객체를 전달한다
			req.setAttribute("noticeList", list);
			
			//페이징 객체 MODEL값 전달
			req.setAttribute("paging", paging);
			
			//View 지정 및 응답
			req.getRequestDispatcher("/WEB-INF/views/notice/noticeList.jsp").forward(req, resp);
			
		}
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			//요청데이터의 한글 인코딩 방식 지정하기 : UTF-8
			req.setCharacterEncoding("UTF-8");
			
			String keyWord = req.getParameter("keyWord");
			String searchWord = req.getParameter("searchWord");
			System.out.println( "키워드 : " + keyWord + ", 검색어 : " + searchWord );
			
			
			//페이징 없이 전달
			List<NoticeImage> searchlist = noticeService.getImgSearch(keyWord, searchWord);
			
			
			//검색(페이징 있)
		
			// 전달파라미터에서 현재 페이징 객체 계산하기
			//Paging paging = noticeService.getSearchPaging(req, keyWord, searchWord );
			//System.out.println(paging);
					
				
			//게시글 페이징 목록 조회
			//List<NoticeImage> searchlist = noticeService.getNoticeSearchList( paging, keyWord, searchWord );
				
			
			
			//조회된 결과(MODEL값)를 "noticeList"라는 이름으로 JSP코드에 list객체를 전달한다
			req.setAttribute("noticeList", searchlist);
			
			//키워드랑 검색어를 JSP에 전달
			req.setAttribute("keyWord", keyWord);
			req.setAttribute("searchWord", searchWord);
			
			//페이징 객체 MODEL값 전달
			//req.setAttribute("paging", paging);
			
			//View 지정 및 응답
			req.getRequestDispatcher("/WEB-INF/views/notice/noticeList.jsp").forward(req, resp);
		}
		
}	
