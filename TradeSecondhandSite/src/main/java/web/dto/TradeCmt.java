package web.dto;

import java.util.Date;

public class TradeCmt {
	
	private int cmtno;
	private int userno;
	private int tradeno;
	private int cmtDepth;
	private int cmtGroup;
	private Date cmtDate;
	private String cmtContent;
	
	public TradeCmt() {}

	public TradeCmt(int cmtno, int userno, int tradeno, int cmtDepth, int cmtGroup, Date cmtDate, String cmtContent) {
		super();
		this.cmtno = cmtno;
		this.userno = userno;
		this.tradeno = tradeno;
		this.cmtDepth = cmtDepth;
		this.cmtGroup = cmtGroup;
		this.cmtDate = cmtDate;
		this.cmtContent = cmtContent;
	}

	@Override
	public String toString() {
		return "TradeCmt [cmtno=" + cmtno + ", userno=" + userno + ", tradeno=" + tradeno + ", cmtDepth=" + cmtDepth
				+ ", cmtGroup=" + cmtGroup + ", cmtDate=" + cmtDate + ", cmtContent=" + cmtContent + "]";
	}

	public int getCmtno() {
		return cmtno;
	}

	public void setCmtno(int cmtno) {
		this.cmtno = cmtno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getTradeno() {
		return tradeno;
	}

	public void setTradeno(int tradeno) {
		this.tradeno = tradeno;
	}

	public int getCmtDepth() {
		return cmtDepth;
	}

	public void setCmtDepth(int cmtDepth) {
		this.cmtDepth = cmtDepth;
	}

	public int getCmtGroup() {
		return cmtGroup;
	}

	public void setCmtGroup(int cmtGroup) {
		this.cmtGroup = cmtGroup;
	}

	public Date getCmtDate() {
		return cmtDate;
	}

	public void setCmtDate(Date cmtDate) {
		this.cmtDate = cmtDate;
	}

	public String getCmtContent() {
		return cmtContent;
	}

	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	
	
	
	
	

}
