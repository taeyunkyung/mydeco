package com.mydeco.vo;

public class CardReplyVo {

	private int replyCardNo;
	private int userNo;
	private int cardNo;
	private String targetAge;
	private String targetGender;
	private String sendYN;
	private String replyContent;
	private String replyRegdate;
	private String cardImgSrc;

	public CardReplyVo() {
	}

	public CardReplyVo(int replyCardNo, int userNo, int cardNo, String targetAge, String targetGender, String sendYN,
			String replyContent, String replyRegdate, String cardImgSrc) {
		this.replyCardNo = replyCardNo;
		this.userNo = userNo;
		this.cardNo = cardNo;
		this.targetAge = targetAge;
		this.targetGender = targetGender;
		this.sendYN = sendYN;
		this.replyContent = replyContent;
		this.replyRegdate = replyRegdate;
		this.cardImgSrc = cardImgSrc;
	}

	public int getReplyCardNo() {
		return replyCardNo;
	}

	public void setReplyCardNo(int replyCardNo) {
		this.replyCardNo = replyCardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCardNo() {
		return cardNo;
	}

	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
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

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyRegdate() {
		return replyRegdate;
	}

	public void setReplyRegdate(String replyRegdate) {
		this.replyRegdate = replyRegdate;
	}

	public String getCardImgSrc() {
		return cardImgSrc;
	}

	public void setCardImgSrc(String cardImgSrc) {
		this.cardImgSrc = cardImgSrc;
	}

	@Override
	public String toString() {
		return "CardReplyVo [replyCardNo=" + replyCardNo + ", userNo=" + userNo + ", cardNo=" + cardNo + ", targetAge="
				+ targetAge + ", targetGender=" + targetGender + ", sendYN=" + sendYN + ", replyContent=" + replyContent
				+ ", replyRegdate=" + replyRegdate + ", cardImgSrc=" + cardImgSrc + "]";
	}

}
