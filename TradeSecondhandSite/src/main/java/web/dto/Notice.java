package web.dto;

import java.util.Date;

public class Notice {

	private int nno;
	private String boardcateid;
	private String ncategory;
	private String ntitle;
	private String ncontent;
	private Date nwritedate;
	private Date nupdatetime;
	private int ntop;
	private int nhit;
	
	public Notice() {	}

	public Notice(int nno, String boardcateid, String ncategory, String ntitle, String ncontent, Date nwritedate,
			Date nupdatetime, int ntop, int nhit) {
		super();
		this.nno = nno;
		this.boardcateid = boardcateid;
		this.ncategory = ncategory;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nwritedate = nwritedate;
		this.nupdatetime = nupdatetime;
		this.ntop = ntop;
		this.nhit = nhit;
	}

	@Override
	public String toString() {
		return "Notice [nno=" + nno + ", boardcateid=" + boardcateid + ", ncategory=" + ncategory + ", ntitle=" + ntitle
				+ ", ncontent=" + ncontent + ", nwritedate=" + nwritedate + ", nupdatetime=" + nupdatetime + ", ntop="
				+ ntop + ", nhit=" + nhit + "]";
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getBoardcateid() {
		return boardcateid;
	}

	public void setBoardcateid(String boardcateid) {
		this.boardcateid = boardcateid;
	}

	public String getNcategory() {
		return ncategory;
	}

	public void setNcategory(String ncategory) {
		this.ncategory = ncategory;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public Date getNwritedate() {
		return nwritedate;
	}

	public void setNwritedate(Date nwritedate) {
		this.nwritedate = nwritedate;
	}

	public Date getNupdatetime() {
		return nupdatetime;
	}

	public void setNupdatetime(Date nupdatetime) {
		this.nupdatetime = nupdatetime;
	}

	public int getNtop() {
		return ntop;
	}

	public void setNtop(int ntop) {
		this.ntop = ntop;
	}

	public int getNhit() {
		return nhit;
	}

	public void setNhit(int nhit) {
		this.nhit = nhit;
	}
	
	
	
}
