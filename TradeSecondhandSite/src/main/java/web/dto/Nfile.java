package web.dto;

import java.util.Date;

public class Nfile {

	private int nfileno;
	private int nno;
	private String nfileoriginname;
	private String nfilestoredname;
	private int nfilesize;
	private Date nfilewritedate;
	
	public Nfile() {	}

	public Nfile(int nfileno, int nno, String nfileoriginname, String nfilestoredname, int nfilesize,
			Date nfilewritedate) {
		super();
		this.nfileno = nfileno;
		this.nno = nno;
		this.nfileoriginname = nfileoriginname;
		this.nfilestoredname = nfilestoredname;
		this.nfilesize = nfilesize;
		this.nfilewritedate = nfilewritedate;
	}

	@Override
	public String toString() {
		return "Nfile [nfileno=" + nfileno + ", nno=" + nno + ", nfileoriginname=" + nfileoriginname
				+ ", nfilestoredname=" + nfilestoredname + ", nfilesize=" + nfilesize + ", nfilewritedate="
				+ nfilewritedate + "]";
	}

	public int getNfileno() {
		return nfileno;
	}

	public void setNfileno(int nfileno) {
		this.nfileno = nfileno;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
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

	public int getNfilesize() {
		return nfilesize;
	}

	public void setNfilesize(int nfilesize) {
		this.nfilesize = nfilesize;
	}

	public Date getNfilewritedate() {
		return nfilewritedate;
	}

	public void setNfilewritedate(Date nfilewritedate) {
		this.nfilewritedate = nfilewritedate;
	}
	
	
	
}
