package web.dto;

import java.util.Date;

public class NoticeImage {

	private int nno;
	private String ncategory;
	private String ntitle;
	private Date nwritedate;
	private Date nupdatetime;
	private int ntop;
	private int nhit;
	private int nfileno;
	private String nfileoriginname;
	private String nfilestoredname;
	
	
	public NoticeImage() {	}


	public NoticeImage(int nno, String ncategory, String ntitle, Date nwritedate, Date nupdatetime, int ntop, int nhit,
			int nfileno, String nfileoriginname, String nfilestoredname) {
		super();
		this.nno = nno;
		this.ncategory = ncategory;
		this.ntitle = ntitle;
		this.nwritedate = nwritedate;
		this.nupdatetime = nupdatetime;
		this.ntop = ntop;
		this.nhit = nhit;
		this.nfileno = nfileno;
		this.nfileoriginname = nfileoriginname;
		this.nfilestoredname = nfilestoredname;
	}


	@Override
	public String toString() {
		return "NoticeImage [nno=" + nno + ", ncategory=" + ncategory + ", ntitle=" + ntitle + ", nwritedate="
				+ nwritedate + ", nupdatetime=" + nupdatetime + ", ntop=" + ntop + ", nhit=" + nhit + ", nfileno="
				+ nfileno + ", nfileoriginname=" + nfileoriginname + ", nfilestoredname=" + nfilestoredname + "]";
	}


	public int getNno() {
		return nno;
	}


	public void setNno(int nno) {
		this.nno = nno;
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


	public int getNfileno() {
		return nfileno;
	}


	public void setNfileno(int nfileno) {
		this.nfileno = nfileno;
	}


	public String getNfileoriginname() {
		return nfileoriginname;
	}


	public void setNfileoriginname(String nfileoriginname) {
		this.nfileoriginname = nfileoriginname;
	}


	public String getNfilestoredname() {
		return nfilestoredname;
	}


	public void setNfilestoredname(String nfilestoredname) {
		this.nfilestoredname = nfilestoredname;
	}
	
	
	
	
	
	
}
