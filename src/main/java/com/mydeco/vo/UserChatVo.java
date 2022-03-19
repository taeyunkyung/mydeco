package com.mydeco.vo;

public class UserChatVo {

	private int chatNo;
	private int prodNo;
	private String prodName;
	private int buyerNo;
	private int sellerNo;
	private int userNo;
	private String id;
	private String chatContent;
	private String regDate;
	private String align;

	public UserChatVo() {
	}

	public UserChatVo(int chatNo, int prodNo, String prodName, int buyerNo, int sellerNo, int userNo, String id,
			String chatContent, String regDate, String align) {
		this.chatNo = chatNo;
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.buyerNo = buyerNo;
		this.sellerNo = sellerNo;
		this.userNo = userNo;
		this.id = id;
		this.chatContent = chatContent;
		this.regDate = regDate;
		this.align = align;
	}

	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public int getBuyerNo() {
		return buyerNo;
	}

	public void setBuyerNo(int buyerNo) {
		this.buyerNo = buyerNo;
	}

	public int getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "UserChatVo [chatNo=" + chatNo + ", prodNo=" + prodNo + ", prodName=" + prodName + ", userNo=" + userNo
				+ ", id=" + id + ", chatContent=" + chatContent + ", regDate=" + regDate + "]";
	}

}
