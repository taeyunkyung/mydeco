package com.mydeco.vo;

public class ShoppingCmtVo {

	private String cmtNo;
	private int prodNo;
	private int userNo;
	private String cmtContent;
	private String regDate;
	private int groupNo;
	private int cmtSeq;
	private int depth;
	private String name;

	public ShoppingCmtVo() {

	}

	public ShoppingCmtVo(String cmtNo, int prodNo, int userNo, String cmtContent, String regDate, int groupNo,
			int cmtSeq, int depth, String name) {

		this.cmtNo = cmtNo;
		this.prodNo = prodNo;
		this.userNo = userNo;
		this.cmtContent = cmtContent;
		this.regDate = regDate;
		this.groupNo = groupNo;
		this.cmtSeq = cmtSeq;
		this.depth = depth;
		this.name = name;
	}

	public String getCmtNo() {
		return cmtNo;
	}

	public void setCmtNo(String cmtNo) {
		this.cmtNo = cmtNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getCmtContent() {
		return cmtContent;
	}

	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getCmtSeq() {
		return cmtSeq;
	}

	public void setCmtSeq(int cmtSeq) {
		this.cmtSeq = cmtSeq;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "ShoppingCmtVo [cmtNo=" + cmtNo + ", prodNo=" + prodNo + ", userNo=" + userNo + ", cmtContent="
				+ cmtContent + ", regDate=" + regDate + ", groupNo=" + groupNo + ", cmtSeq=" + cmtSeq + ", depth="
				+ depth + ", name=" + name + "]";
	}

}
