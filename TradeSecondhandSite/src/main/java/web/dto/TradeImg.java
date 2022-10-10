package web.dto;

public class TradeImg {
	
	private int imgno;
	private String storedName;
	private String originName;
	private int imgsize;
	private int tradeno;
	
	public TradeImg() {}

	public TradeImg(int imgno, String storedName, String originName, int imgsize, int tradeno) {
		super();
		this.imgno = imgno;
		this.storedName = storedName;
		this.originName = originName;
		this.imgsize = imgsize;
		this.tradeno = tradeno;
	}

	@Override
	public String toString() {
		return "TradeImg [imgno=" + imgno + ", storedName=" + storedName + ", originName=" + originName + ", imgsize="
				+ imgsize + ", tradeno=" + tradeno + "]";
	}

	public int getImgno() {
		return imgno;
	}

	public void setImgno(int imgno) {
		this.imgno = imgno;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public int getImgsize() {
		return imgsize;
	}

	public void setImgsize(int imgsize) {
		this.imgsize = imgsize;
	}

	public int getTradeno() {
		return tradeno;
	}

	public void setTradeno(int tradeno) {
		this.tradeno = tradeno;
	}

	
	
	
	
	
	

}
