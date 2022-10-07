package web.dto;

import java.util.Date;

public class Boardcate {
	private String boardcateid;
	private String boardcatename;
	private Date boardcatedate;
	
	
	public Boardcate() {	}


	public Boardcate(String boardcateid, String boardcatename, Date boardcatedate) {
		super();
		this.boardcateid = boardcateid;
		this.boardcatename = boardcatename;
		this.boardcatedate = boardcatedate;
	}


	@Override
	public String toString() {
		return "Boardcate [boardcateid=" + boardcateid + ", boardcatename=" + boardcatename + ", boardcatedate="
				+ boardcatedate + "]";
	}


	public String getBoardcateid() {
		return boardcateid;
	}


	public void setBoardcateid(String boardcateid) {
		this.boardcateid = boardcateid;
	}


	public String getBoardcatename() {
		return boardcatename;
	}


	public void setBoardcatename(String boardcatename) {
		this.boardcatename = boardcatename;
	}


	public Date getBoardcatedate() {
		return boardcatedate;
	}


	public void setBoardcatedate(Date boardcatedate) {
		this.boardcatedate = boardcatedate;
	}
	
	
	
}
