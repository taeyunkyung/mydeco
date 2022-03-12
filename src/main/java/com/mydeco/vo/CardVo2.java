package com.mydeco.vo;

public class CardVo2 {

	private int replyNo;
	private int cardNo;
	private int userNo;
	private String replyContent;
	private int replyRegdate;
	private int cardImgNo;
	
	public CardVo2() {
		
	}
	
	public CardVo2(int replyNo, int cardNo, int userNo, String replyContent, int replyRegdate, int cardImgNo) {
		super();
		this.replyNo = replyNo;
		this.cardNo = cardNo;
		this.userNo = userNo;
		this.replyContent = replyContent;
		this.replyRegdate = replyRegdate;
		this.cardImgNo = cardImgNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
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

	public int getCardImgNo() {
		return cardImgNo;
	}

	public void setCardImgNo(int cardImgNo) {
		this.cardImgNo = cardImgNo;
	}

	@Override
	public String toString() {
		return "CardVo2 [replyNo=" + replyNo + ", cardNo=" + cardNo + ", userNo=" + userNo + ", replyContent="
				+ replyContent + ", replyRegdate=" + replyRegdate + ", cardImgNo=" + cardImgNo + "]";
	}
	
	
}
