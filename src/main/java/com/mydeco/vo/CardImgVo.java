package com.mydeco.vo;

public class CardImgVo {

	private int cardImgNo;
	private String cardImgName;
	private String cardImgSrc;
	private String cardImgInfo;
	
	public CardImgVo() {
		
	}
	
	public CardImgVo(String cardImgName, String cardImgSrc) {
		super();
		this.cardImgName = cardImgName;
		this.cardImgSrc = cardImgSrc;
	}

	
	public CardImgVo(int cardImgNo, String cardImgName, String cardImgSrc, String cardImgInfo) {
		super();
		this.cardImgNo = cardImgNo;
		this.cardImgName = cardImgName;
		this.cardImgSrc = cardImgSrc;
		this.cardImgInfo = cardImgInfo;
	}

	public int getCardImgNo() {
		return cardImgNo;
	}

	public void setCardImgNo(int cardImgNo) {
		this.cardImgNo = cardImgNo;
	}

	public String getCardImgName() {
		return cardImgName;
	}

	public void setCardImgName(String cardImgName) {
		this.cardImgName = cardImgName;
	}

	public String getCardImgSrc() {
		return cardImgSrc;
	}

	public void setCardImgSrc(String cardImgSrc) {
		this.cardImgSrc = cardImgSrc;
	}

	public String getCardImgInfo() {
		return cardImgInfo;
	}

	public void setCardImgInfo(String cardImgInfo) {
		this.cardImgInfo = cardImgInfo;
	}

	@Override
	public String toString() {
		return "CardImgVo [cardImgNo=" + cardImgNo + ", cardImgName=" + cardImgName + ", cardImgSrc=" + cardImgSrc
				+ ", cardImgInfo=" + cardImgInfo + "]";
	}
	
	
	
}
