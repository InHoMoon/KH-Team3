package web.dto;

import java.util.Date;

public class User {
	
	private int userno;
	private String userid;
	private String userpw;
	private String username;
	private String useremail;
	private String userphone;
	private String useraddr1;
	private String useraddr2;
	private String useraddr3;
	private String usergender;
	private int userbirth;
	private String usernick;
	private String usergrade;
	private Date userjoindate;
	private Date userupdate;
	private int reportcount;
	
	public User() {}

	public User(int userno, String userid, String userpw, String username, String useremail, String userphone,
			String useraddr1, String useraddr2, String useraddr3, String usergender, int userbirth, String usernick,
			String usergrade, Date userjoindate, Date userupdate, int reportcount) {
		super();
		this.userno = userno;
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.useremail = useremail;
		this.userphone = userphone;
		this.useraddr1 = useraddr1;
		this.useraddr2 = useraddr2;
		this.useraddr3 = useraddr3;
		this.usergender = usergender;
		this.userbirth = userbirth;
		this.usernick = usernick;
		this.usergrade = usergrade;
		this.userjoindate = userjoindate;
		this.userupdate = userupdate;
		this.reportcount = reportcount;
	}

	@Override
	public String toString() {
		return "User [userno=" + userno + ", userid=" + userid + ", userpw=" + userpw + ", username=" + username
				+ ", useremail=" + useremail + ", userphone=" + userphone + ", useraddr1=" + useraddr1 + ", useraddr2="
				+ useraddr2 + ", useraddr3=" + useraddr3 + ", usergender=" + usergender + ", userbirth=" + userbirth
				+ ", usernick=" + usernick + ", usergrade=" + usergrade + ", userjoindate=" + userjoindate
				+ ", userupdate=" + userupdate + ", reportcount=" + reportcount + "]";
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getUseraddr1() {
		return useraddr1;
	}

	public void setUseraddr1(String useraddr1) {
		this.useraddr1 = useraddr1;
	}

	public String getUseraddr2() {
		return useraddr2;
	}

	public void setUseraddr2(String useraddr2) {
		this.useraddr2 = useraddr2;
	}

	public String getUseraddr3() {
		return useraddr3;
	}

	public void setUseraddr3(String useraddr3) {
		this.useraddr3 = useraddr3;
	}

	public String getUsergender() {
		return usergender;
	}

	public void setUsergender(String usergender) {
		this.usergender = usergender;
	}

	public int getUserbirth() {
		return userbirth;
	}

	public void setUserbirth(int userbirth) {
		this.userbirth = userbirth;
	}

	public String getUsernick() {
		return usernick;
	}

	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}

	public String getUsergrade() {
		return usergrade;
	}

	public void setUsergrade(String usergrade) {
		this.usergrade = usergrade;
	}

	public Date getUserjoindate() {
		return userjoindate;
	}

	public void setUserjoindate(Date userjoindate) {
		this.userjoindate = userjoindate;
	}

	public Date getUserupdate() {
		return userupdate;
	}

	public void setUserupdate(Date userupdate) {
		this.userupdate = userupdate;
	}

	public int getReportcount() {
		return reportcount;
	}

	public void setReportcount(int reportcount) {
		this.reportcount = reportcount;
	}
	
}
