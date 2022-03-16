package com.mydeco.vo;

public class CardVo {

	private int cardNo;
	private int userNo;
	private int replyNo;
	private int cardImgNo;
	private String cardContent;
	private String cardRegdate;
	private String cardGender;
	private String cardAge;
	private int receivecardNo;
	private String receiveContent;
	private String receiveRegdate;
	private String replyContent;
	private String cardImgName;
	private String cardImgSrc; 
	
	
	public CardVo() {}


	public CardVo(int cardNo, int userNo, int replyNo, int cardImgNo, String cardContent, String cardRegdate,
			String cardGender, String cardAge, int receivecardNo, String receiveContent, String receiveRegdate,
			String replyContent, String cardImgName, String cardImgSrc) {
		this.cardNo = cardNo;
		this.userNo = userNo;
		this.replyNo = replyNo;
		this.cardImgNo = cardImgNo;
		this.cardContent = cardContent;
		this.cardRegdate = cardRegdate;
		this.cardGender = cardGender;
		this.cardAge = cardAge;
		this.receivecardNo = receivecardNo;
		this.receiveContent = receiveContent;
		this.receiveRegdate = receiveRegdate;
		this.replyContent = replyContent;
		this.cardImgName = cardImgName;
		this.cardImgSrc = cardImgSrc;
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


	public int getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}


	public int getCardImgNo() {
		return cardImgNo;
	}


	public void setCardImgNo(int cardImgNo) {
		this.cardImgNo = cardImgNo;
	}


	public String getCardContent() {
		return cardContent;
	}


	public void setCardContent(String cardContent) {
		this.cardContent = cardContent;
	}


	public String getCardRegdate() {
		return cardRegdate;
	}


	public void setCardRegdate(String cardRegdate) {
		this.cardRegdate = cardRegdate;
	}


	public String getCardGender() {
		return cardGender;
	}


	public void setCardGender(String cardGender) {
		this.cardGender = cardGender;
	}


	public String getCardAge() {
		return cardAge;
	}


	public void setCardAge(String cardAge) {
		this.cardAge = cardAge;
	}


	public int getReceivecardNo() {
		return receivecardNo;
	}


	public void setReceivecardNo(int receivecardNo) {
		this.receivecardNo = receivecardNo;
	}


	public String getReceiveContent() {
		return receiveContent;
	}


	public void setReceiveContent(String receiveContent) {
		this.receiveContent = receiveContent;
	}


	public String getReceiveRegdate() {
		return receiveRegdate;
	}


	public void setReceiveRegdate(String receiveRegdate) {
		this.receiveRegdate = receiveRegdate;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
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


	@Override
	public String toString() {
		return "CardVo [cardNo=" + cardNo + ", userNo=" + userNo + ", replyNo=" + replyNo + ", cardImgNo=" + cardImgNo
				+ ", cardContent=" + cardContent + ", cardRegdate=" + cardRegdate + ", cardGender=" + cardGender
				+ ", cardAge=" + cardAge + ", receivecardNo=" + receivecardNo + ", receiveContent=" + receiveContent
				+ ", receiveRegdate=" + receiveRegdate + ", replyContent=" + replyContent + ", cardImgName="
				+ cardImgName + ", cardImgSrc=" + cardImgSrc + "]";
	}


	
}	
	