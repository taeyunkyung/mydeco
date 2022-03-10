package com.mydeco.vo;

public class MyCardVo {

	private int cardNo;
	private int userNo;
	private String cardContent;
	private int cardRegdate;
	private String cardAge;
	private String cardGender;
	private int cardImgNo;
	
	public MyCardVo() {
		
	}
	
	public MyCardVo(int cardNo, int userNo, String cardContent, int cardRegdate, String cardAge, String cardGender,
			int cardImgNo) {
		super();
		this.cardNo = cardNo;
		this.userNo = userNo;
		this.cardContent = cardContent;
		this.cardRegdate = cardRegdate;
		this.cardAge = cardAge;
		this.cardGender = cardGender;
		this.cardImgNo = cardImgNo;
	}

	public int getCardNo() {
		return cardNo;
	}

	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getCardContent() {
		return cardContent;
	}

	public void setCardContent(String cardContent) {
		this.cardContent = cardContent;
	}

	public int getCardRegdate() {
		return cardRegdate;
	}

	public void setCardRegdate(int cardRegdate) {
		this.cardRegdate = cardRegdate;
	}

	public String getCardAge() {
		return cardAge;
	}

	public void setCardAge(String cardAge) {
		this.cardAge = cardAge;
	}

	public String getCardGender() {
		return cardGender;
	}

	public void setCardGender(String cardGender) {
		this.cardGender = cardGender;
	}

	public int getCardImgNo() {
		return cardImgNo;
	}

	public void setCardImgNo(int cardImgNo) {
		this.cardImgNo = cardImgNo;
	}

	@Override
	public String toString() {
		return "MyCardVo [cardNo=" + cardNo + ", userNo=" + userNo + ", cardContent=" + cardContent + ", cardRegdate="
				+ cardRegdate + ", cardAge=" + cardAge + ", cardGender=" + cardGender + ", cardImgNo=" + cardImgNo
				+ "]";
	}
	
	
	
	
	
	
}
