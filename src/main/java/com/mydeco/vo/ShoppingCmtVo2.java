package com.mydeco.vo;

public class ShoppingCmtVo2 {

	private int cmtNo;
	private int prodNo;
	private int userNo;
	private String id;
	private String cmtContent;
	private String regDate;
	private int groupNo;
	private int cmtSeq;
	private int depth;
	private String name;

	// 코멘트 합계
	private int cmtCnt;

	public ShoppingCmtVo2() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ShoppingCmtVo2(int cmtCnt, int prodNo) {
		this.prodNo = prodNo;
		this.cmtCnt = cmtCnt;
	}

	public ShoppingCmtVo2(int cmtNo, int prodNo, int userNo, String id, String cmtContent, String regDate, int groupNo,
			int cmtSeq, int depth, String name, int cmtCnt) {
		super();
		this.cmtNo = cmtNo;
		this.prodNo = prodNo;
		this.userNo = userNo;
		this.id = id;
		this.cmtContent = cmtContent;
		this.regDate = regDate;
		this.groupNo = groupNo;
		this.cmtSeq = cmtSeq;
		this.depth = depth;
		this.name = name;
		this.cmtCnt = cmtCnt;
	}

	public int getCmtNo() {
		return cmtNo;
	}

	public void setCmtNo(int cmtNo) {
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

	public int getCmtCnt() {
		return cmtCnt;
	}

	public void setCmtCnt(int cmtCnt) {
		this.cmtCnt = cmtCnt;
	}

	@Override
	public String toString() {
		return "ShoppingCmtVo [cmtNo=" + cmtNo + ", prodNo=" + prodNo + ", userNo=" + userNo + ", cmtContent="
				+ cmtContent + ", regDate=" + regDate + ", groupNo=" + groupNo + ", cmtSeq=" + cmtSeq + ", depth="
				+ depth + ", name=" + name + ", cmtCnt=" + cmtCnt + "]";
	}

}
