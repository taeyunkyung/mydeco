package com.mydeco.vo;

public class UserChatVo {

	private int chatNo;
	private int prodNo;
	private String prodName;
	private int userNo;
	private String id;
	private String chatContent;
	private String regDate;

	public UserChatVo() {
	}

	public UserChatVo(int chatNo, int prodNo, String prodName, int userNo, String id, String chatContent,
			String regDate) {
		this.chatNo = chatNo;
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.userNo = userNo;
		this.id = id;
		this.chatContent = chatContent;
		this.regDate = regDate;
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
