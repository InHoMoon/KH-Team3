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
	private String state;
	private String category;
	
	public Trade() {}

	public Trade(int tradeno, String title, String userid, String content, int hit, Date insertDate, int price,
			String state, String category) {
		super();
		this.tradeno = tradeno;
		this.title = title;
		this.userid = userid;
		this.content = content;
		this.hit = hit;
		this.insertDate = insertDate;
		this.price = price;
		this.state = state;
		this.category = category;
	}

	@Override
	public String toString() {
		return "Trade [tradeno=" + tradeno + ", title=" + title + ", userid=" + userid + ", content=" + content
				+ ", hit=" + hit + ", insertDate=" + insertDate + ", price=" + price + ", state=" + state
				+ ", category=" + category + "]";
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	

}
