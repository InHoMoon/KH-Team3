package web.controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Ncomment;
import web.dto.Nfile;
import web.dto.Notice;
import web.service.face.notice.NcmtService;
import web.service.face.notice.NoticeService;
import web.service.impl.notice.NcmtServiceImpl;
import web.service.impl.notice.NoticeServiceImpl;


@WebServlet("/notice/view")
public class NoticeViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//서비스 객체
	private NoticeService noticeService = new NoticeServiceImpl();
	private NcmtService ncmtService = new NcmtServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//전달파라미터 저장 객체 얻기
		Notice nno = noticeService.getNoticeno(req);
		System.out.println("NoticeViewController doGet() - 전달파라미터 객체 : " + nno);

		
		//상세보기 결과 조회
		Notice viewNotice = noticeService.view( nno );
		System.out.println("NoticeViewController doGet() - 상세보기 객체 : " + viewNotice);
		
		//조회 결과 MODEL값을 JSP코드에 전달
		req.setAttribute("viewNotice", viewNotice);
		
		
		//첨부파일 정보 조회
		Nfile nFile = noticeService.viewFile(viewNotice);
		
		//첨부파일 정보를 MODEL값 전달
		req.setAttribute("nFile", nFile);
				
		
		//댓글 리스트 조회
		List<Ncomment> ncmtList = ncmtService.getCmtList( nno.getNno() );		
		
		//댓글 리스트 정보를 전달
		req.setAttribute("ncmtList", ncmtList);
		
		//VIEW 지정 및 응답
		req.getRequestDispatcher("/WEB-INF/views/notice/noticeView.jsp").forward(req, resp);
		
	}
	
}
