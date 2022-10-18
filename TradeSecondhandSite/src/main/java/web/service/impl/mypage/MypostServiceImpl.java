package web.service.impl.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import util.Paging;
import web.dao.face.mypage.MypostDao;
import web.dao.impl.mypage.MypostDaoImpl;
import web.dto.Trade;
import web.service.face.mypage.MypostService;

public class MypostServiceImpl implements MypostService {

	private MypostDao mypostDao = new MypostDaoImpl();

	@Override
	public List<Trade> getList(Paging paging, int userno) {
		//게시글 전체 조회
		return mypostDao.selectAll(JDBCTemplate.getConnection(), paging, userno);
	}

	@Override
	public Paging getPaging(HttpServletRequest req, int userno) {

		String param = req.getParameter("curPage");
		int curPage = 0;

		//현재 페이지 확인
		if( param != null && !"".equals(param) ) {
			curPage= Integer.parseInt(param);
		} else {
			System.out.println("curPage가 null이거나 비어있음");
		}

		//전체 게시물 수 조회
		int totalCont = mypostDao.selectCnt(JDBCTemplate.getConnection(), userno);

		//페이징 객체 생성
		Paging paging = new Paging(totalCont, curPage); //게시글 수 8 페이징 수 5

		//페이징 객체 반환
		return paging;
	}
}
