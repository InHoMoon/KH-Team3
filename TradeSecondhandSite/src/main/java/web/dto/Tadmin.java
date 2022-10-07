package web.dto;

public class Tadmin {

	private String adminid;
	private String adminpw;
	private String adminname;
	
	public Tadmin() {	}

	public Tadmin(String adminid, String adminpw, String adminname) {
		super();
		this.adminid = adminid;
		this.adminpw = adminpw;
		this.adminname = adminname;
	}

	@Override
	public String toString() {
		return "Tadmin [adminid=" + adminid + ", adminpw=" + adminpw + ", adminname=" + adminname + "]";
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdminpw() {
		return adminpw;
	}

	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
	}

	public String getAdminname() {
		return adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	
	
	
	
}
