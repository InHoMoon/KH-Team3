package web.dto;

import java.util.Date;

public class Trade {
	
	private int tradeno;
	private String title;
	private String userid;
	private String content;
	private int hit;
	private Date insertDate;
	private int price;
	private String productState;
	private String saleState;
	private String category;
	private String userphone;
	private int wishCheck;
	private String storedName;
	
	public Trade() {}

	public Trade(int tradeno, String title, String userid, String content, int hit, Date insertDate, int price,
			String productState, String saleState, String category, String userphone, int wishCheck,
			String storedName) {
		super();
		this.tradeno = tradeno;
		this.title = title;
		this.userid = userid;
		this.content = content;
		this.hit = hit;
		this.insertDate = insertDate;
		this.price = price;
		this.productState = productState;
		this.saleState = saleState;
		this.category = category;
		this.userphone = userphone;
		this.wishCheck = wishCheck;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "Trade [tradeno=" + tradeno + ", title=" + title + ", userid=" + userid + ", content=" + content
				+ ", hit=" + hit + ", insertDate=" + insertDate + ", price=" + price + ", productState=" + productState
				+ ", saleState=" + saleState + ", category=" + category + ", userphone=" + userphone + ", wishCheck="
				+ wishCheck + ", storedName=" + storedName + "]";
	}

	public int getTradeno() {
		return tradeno;
	}

	public void setTradeno(int tradeno) {
		this.tradeno = tradeno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProductState() {
		return productState;
	}

	public void setProductState(String productState) {
		this.productState = productState;
	}

	public String getSaleState() {
		return saleState;
	}

	public void setSaleState(String saleState) {
		this.saleState = saleState;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public int getWishCheck() {
		return wishCheck;
	}

	public void setWishCheck(int wishCheck) {
		this.wishCheck = wishCheck;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	
	
	
}