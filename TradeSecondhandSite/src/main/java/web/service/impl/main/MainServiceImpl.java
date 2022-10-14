package web.service.impl.main;

import java.util.List;

import common.JDBCTemplate;
import web.dao.face.main.MainDao;
import web.dao.impl.main.MainDaoImpl;
import web.dto.Trade;
import web.service.face.main.MainService;

public class MainServiceImpl implements MainService {

	//DAO 객체
	private MainDao mainDao = new MainDaoImpl();
	
	@Override
	public List<Trade> getNewList() {
		//최신글 8개 조회 결과 처리
		return mainDao.selectNewPost(JDBCTemplate.getConnection());
	}

	
	@Override
	public int getNewPostCnt() {
		
		return mainDao.countNewPost(JDBCTemplate.getConnection());
	}

}
