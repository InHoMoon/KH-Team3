package web.dto;

import java.util.Date;

public class Ufile {
	
	private int ufileno;
	private int userno;
	private String ufileoriginname;
	private String ufilestoredname;
	private int ufilesize;
	private Date ufilewritedate;
	
	public Ufile() {}

	public Ufile(int ufileno, int userno, String ufileoriginname, String ufilestoredname, int ufilesize,
			Date ufilewritedate) {
		super();
		this.ufileno = ufileno;
		this.userno = userno;
		this.ufileoriginname = ufileoriginname;
		this.ufilestoredname = ufilestoredname;
		this.ufilesize = ufilesize;
		this.ufilewritedate = ufilewritedate;
	}

	@Override
	public String toString() {
		return "Ufile [ufileno=" + ufileno + ", userno=" + userno + ", ufileoriginname=" + ufileoriginname
				+ ", ufilestoredname=" + ufilestoredname + ", ufilesize=" + ufilesize + ", ufilewritedate="
				+ ufilewritedate + "]";
	}

	public int getUfileno() {
		return ufileno;
	}

	public void setUfileno(int ufileno) {
		this.ufileno = ufileno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getUfileoriginname() {
		return ufileoriginname;
	}

	public void setUfileoriginname(String ufileoriginname) {
		this.ufileoriginname = ufileoriginname;
	}

	public String getUfilestoredname() {
		return ufilestoredname;
	}

	public void setUfilestoredname(String ufilestoredname) {
		this.ufilestoredname = ufilestoredname;
	}

	public int getUfilesize() {
		return ufilesize;
	}

	public void setUfilesize(int ufilesize) {
		this.ufilesize = ufilesize;
	}

	public Date getUfilewritedate() {
		return ufilewritedate;
	}

	public void setUfilewritedate(Date ufilewritedate) {
		this.ufilewritedate = ufilewritedate;
	}
	
}
