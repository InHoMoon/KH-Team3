package web.dto;

import java.util.Date;

public class Ncomment {

	private int ncmtid;
	private int nno;
	private String ncmtcontent;
	private Date ncmtwritedate;
	private Date ncmtupdatetime;
	private String userid;
	
	public Ncomment() {	}

	public Ncomment(int ncmtid, int nno, String ncmtcontent, Date ncmtwritedate, Date ncmtupdatetime, String userid) {
		super();
		this.ncmtid = ncmtid;
		this.nno = nno;
		this.ncmtcontent = ncmtcontent;
		this.ncmtwritedate = ncmtwritedate;
		this.ncmtupdatetime = ncmtupdatetime;
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Ncomment [ncmtid=" + ncmtid + ", nno=" + nno + ", ncmtcontent=" + ncmtcontent + ", ncmtwritedate="
				+ ncmtwritedate + ", ncmtupdatetime=" + ncmtupdatetime + ", userid=" + userid + "]";
	}

	public int getNcmtid() {
		return ncmtid;
	}

	public void setNcmtid(int ncmtid) {
		this.ncmtid = ncmtid;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getNcmtcontent() {
		return ncmtcontent;
	}

	public void setNcmtcontent(String ncmtcontent) {
		this.ncmtcontent = ncmtcontent;
	}

	public Date getNcmtwritedate() {
		return ncmtwritedate;
	}

	public void setNcmtwritedate(Date ncmtwritedate) {
		this.ncmtwritedate = ncmtwritedate;
	}

	public Date getNcmtupdatetime() {
		return ncmtupdatetime;
	}

	public void setNcmtupdatetime(Date ncmtupdatetime) {
		this.ncmtupdatetime = ncmtupdatetime;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	
	

	
	
	
	
}
