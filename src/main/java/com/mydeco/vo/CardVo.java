package com.mydeco.vo;

public class CardVo {

	private int cardNo;
	private int userNo;
	private String cardContent;
	private String cardContentFull;
	private String cardRegdate;
	private String cardAge;
	private String cardGender;
	private int cardImgNo;
	private String cardImgSrc;
	private int replyCardNo;
	private String replyContent;
	private int replyRegdate;
	private String targetAge;
	private String targetGender;
	private String sendYN;
	private int count;

	public CardVo() {
	}

	public CardVo(int cardNo, int userNo, String cardContent, String cardContentFull, String cardRegdate,
			String cardAge, String cardGender, int cardImgNo, String cardImgSrc, int replyCardNo, String replyContent,
			int replyRegdate, String targetAge, String targetGender, String sendYN, int count) {
		this.cardNo = cardNo;
		this.userNo = userNo;
		this.cardContent = cardContent;
		this.cardContentFull = cardContentFull;
		this.cardRegdate = cardRegdate;
		this.cardAge = cardAge;
		this.cardGender = cardGender;
		this.cardImgNo = cardImgNo;
		this.cardImgSrc = cardImgSrc;
		this.replyCardNo = replyCardNo;
		this.replyContent = replyContent;
		this.replyRegdate = replyRegdate;
		this.targetAge = targetAge;
		this.targetGender = targetGender;
		this.sendYN = sendYN;
		this.count = count;
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

	public String getCardContentFull() {
		return cardContentFull;
	}

	public void setCardContentFull(String cardContentFull) {
		this.cardContentFull = cardContentFull;
	}

	public String getCardRegdate() {
		return cardRegdate;
	}

	public void setCardRegdate(String cardRegdate) {
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

	public String getCardImgSrc() {
		return cardImgSrc;
	}

	public void setCardImgSrc(String cardImgSrc) {
		this.cardImgSrc = cardImgSrc;
	}

	public int getReplyCardNo() {
		return replyCardNo;
	}

	public void setReplyCardNo(int replyCardNo) {
		this.replyCardNo = replyCardNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getReplyRegdate() {
		return replyRegdate;
	}

	public void setReplyRegdate(int replyRegdate) {
		this.replyRegdate = replyRegdate;
	}

	public String getTargetAge() {
		return targetAge;
	}

	public void setTargetAge(String targetAge) {
		this.targetAge = targetAge;
	}

	public String getTargetGender() {
		return targetGender;
	}

	public void setTargetGender(String targetGender) {
		this.targetGender = targetGender;
	}

	public String getSendYN() {
		return sendYN;
	}

	public void setSendYN(String sendYN) {
		this.sendYN = sendYN;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "CardVo [cardNo=" + cardNo + ", userNo=" + userNo + ", cardContent=" + cardContent + ", cardContentFull="
				+ cardContentFull + ", cardRegdate=" + cardRegdate + ", cardAge=" + cardAge + ", cardGender="
				+ cardGender + ", cardImgNo=" + cardImgNo + ", cardImgSrc=" + cardImgSrc + ", replyCardNo="
				+ replyCardNo + ", replyContent=" + replyContent + ", replyRegdate=" + replyRegdate + ", targetAge="
				+ targetAge + ", targetGender=" + targetGender + ", sendYN=" + sendYN + ", count=" + count + "]";
	}

}
