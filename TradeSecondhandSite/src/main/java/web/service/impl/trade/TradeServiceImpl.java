package web.service.impl.trade;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import util.Paging;
import web.dao.face.trade.TradeDao;
import web.dao.impl.trade.TradeDaoImpl;
import web.dto.Trade;
import web.service.face.trade.TradeService;


public class TradeServiceImpl implements TradeService {
	
	private TradeDao tradeDao = new TradeDaoImpl();

	@Override
	public Paging getPaging(HttpServletRequest req) {
		
		String param = req.getParameter("curPage");
		int curPage = 0;
		
		//현재 페이지 확인
		if( param != null && !"".equals(param) ) {
			curPage= Integer.parseInt(param);
		} else {
			System.out.println("curPage가 null이거나 비어있음");
		}
		
		//전체 게시물 수 조회
		int totalCont = tradeDao.selectCnt(JDBCTemplate.getConnection());
		
		//페이징 객체 생성
		Paging paging = new Paging(totalCont, curPage, 8, 5); //게시글 수 8 페이징 수 5
		
		//페이징 객체 반환
		return paging;
	}

	@Override
	public List<Trade> getList(Paging paging) {
		//게시글 전체 조회
		return tradeDao.selectAll(JDBCTemplate.getConnection(), paging);
	}

	@Override
	public Trade getSearch(HttpServletRequest req) {
		
		Trade serch = new Trade();
		
		//select 옵션에 따라 값 저장
		if(req.getParameter("searchField").equals("title")) {
			serch.setTitle(req.getParameter("searchText"));
		} else if(req.getParameter("searchField").equals("userid")){
			serch.setUserid(req.getParameter("searchText"));
		}
		
		return serch;
	}
	
	@Override
	public List<Trade> searchList(Trade search, Paging paging) {
		
		
		return tradeDao.selectAll(JDBCTemplate.getConnection(), search, paging);
	}
	
	@Override
	public Trade getTradeno(HttpServletRequest req) {
		
		Trade tradeno = new Trade();
		
		tradeno.setTradeno(Integer.parseInt(req.getParameter("tradeno")));
		
		return tradeno;
	}

	@Override
	public Trade view(Trade tradeno) {
		
		//db연결 객체
		Connection conn = JDBCTemplate.getConnection();
		
		//조회수 증가
		if(tradeDao.updateHit(conn, tradeno)>0) {
			JDBCTemplate.commit(null);
		}else {
			JDBCTemplate.rollback(null);
		}
		
		//게시글 번호 게시글 조회결과 반환
		return tradeDao.selectTradeByTradeNo(conn, tradeno);
	}



}
