package web.dto;

import java.util.Date;

public class WishList {
	
	private int wishlistno;
	private int userno;
	private int tradeno;
	private int imgno;
	private String userid;
	
	private Date addDate;
	private String title;
	private int price;
	private String saleState;
	
	public WishList() { }

	public WishList(int wishlistno, int userno, int tradeno, int imgno, String userid, Date addDate, String title,
			int price, String saleState) {
		super();
		this.wishlistno = wishlistno;
		this.userno = userno;
		this.tradeno = tradeno;
		this.imgno = imgno;
		this.userid = userid;
		this.addDate = addDate;
		this.title = title;
		this.price = price;
		this.saleState = saleState;
	}

	@Override
	public String toString() {
		return "WishList [wishlistno=" + wishlistno + ", userno=" + userno + ", tradeno=" + tradeno + ", imgno=" + imgno
				+ ", userid=" + userid + ", addDate=" + addDate + ", title=" + title + ", price=" + price
				+ ", saleState=" + saleState + "]";
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

	public int getTradeno() {
		return tradeno;
	}

	public void setTradeno(int tradeno) {
		this.tradeno = tradeno;
	}

	public int getImgno() {
		return imgno;
	}

	public void setImgno(int imgno) {
		this.imgno = imgno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSaleState() {
		return saleState;
	}

	public void setSaleState(String saleState) {
		this.saleState = saleState;
	}
	
	
}
