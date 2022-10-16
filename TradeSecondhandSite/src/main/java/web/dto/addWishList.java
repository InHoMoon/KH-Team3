package web.dto;

import java.util.Date;

public class addWishList {
	
	private int wishlistno;
	private int userno;
	private String userid;
	private int tradeno;
	private Date addDate;
	
	public addWishList() { }

	public addWishList(int wishlistno, int userno, String userid, int tradeno, Date addDate) {
		super();
		this.wishlistno = wishlistno;
		this.userno = userno;
		this.userid = userid;
		this.tradeno = tradeno;
		this.addDate = addDate;
	}

	@Override
	public String toString() {
		return "WishList [wishlistno=" + wishlistno + ", userno=" + userno + ", userid=" + userid + ", tradeno="
				+ tradeno + ", addDate=" + addDate + "]";
	}

	public int getWishlistno() {
		return wishlistno;
	}

	public void setWishlistno(int wishlistno) {
		this.wishlistno = wishlistno;
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

	public int getTradeno() {
		return tradeno;
	}

	public void setTradeno(int tradeno) {
		this.tradeno = tradeno;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
}
