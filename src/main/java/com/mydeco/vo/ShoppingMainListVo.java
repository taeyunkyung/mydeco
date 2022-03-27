package com.mydeco.vo;

public class ShoppingMainListVo {

	private int prodNo;
	private int userNo;
	private String prodName;
	private String emotion;
	private int price;
	private String delivery;
	private String prodinfo;
	private String regDate;
	private int prodImgNo;
	private String prodImgSrc;
	private String prodImgName;
	private int cmtCnt;
	private int diaryCnt;
	private int pickCnt;
	private int pickNo;

	public ShoppingMainListVo() {

	}

	public ShoppingMainListVo(int prodNo, int userNo, String prodName, String emotion, int price, String delivery,
			String prodinfo, String regDate, int prodImgNo, String prodImgSrc, String prodImgName, int cmtCnt,
			int diaryCnt, int pickCnt, int pickNo) {

		this.prodNo = prodNo;
		this.userNo = userNo;
		this.prodName = prodName;
		this.emotion = emotion;
		this.price = price;
		this.delivery = delivery;
		this.prodinfo = prodinfo;
		this.regDate = regDate;
		this.prodImgNo = prodImgNo;
		this.prodImgSrc = prodImgSrc;
		this.prodImgName = prodImgName;
		this.cmtCnt = cmtCnt;
		this.diaryCnt = diaryCnt;
		this.pickCnt = pickCnt;
		this.pickNo = pickNo;
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

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getEmotion() {
		return emotion;
	}

	public void setEmotion(String emotion) {
		this.emotion = emotion;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getProdinfo() {
		return prodinfo;
	}

	public void setProdinfo(String prodinfo) {
		this.prodinfo = prodinfo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getProdImgNo() {
		return prodImgNo;
	}

	public void setProdImgNo(int prodImgNo) {
		this.prodImgNo = prodImgNo;
	}

	public String getProdImgSrc() {
		return prodImgSrc;
	}

	public void setProdImgSrc(String prodImgSrc) {
		this.prodImgSrc = prodImgSrc;
	}

	public String getProdImgName() {
		return prodImgName;
	}

	public void setProdImgName(String prodImgName) {
		this.prodImgName = prodImgName;
	}

	public int getCmtCnt() {
		return cmtCnt;
	}

	public void setCmtCnt(int cmtCnt) {
		this.cmtCnt = cmtCnt;
	}

	public int getDiaryCnt() {
		return diaryCnt;
	}

	public void setDiaryCnt(int diaryCnt) {
		this.diaryCnt = diaryCnt;
	}

	public int getPickCnt() {
		return pickCnt;
	}

	public void setPickCnt(int pickCnt) {
		this.pickCnt = pickCnt;
	}

	public int getPickNo() {
		return pickNo;
	}

	public void setPickNo(int pickNo) {
		this.pickNo = pickNo;
	}

	@Override
	public String toString() {
		return "ShoppingMainListVo [prodNo=" + prodNo + ", userNo=" + userNo + ", prodName=" + prodName + ", emotion="
				+ emotion + ", price=" + price + ", delivery=" + delivery + ", prodinfo=" + prodinfo + ", regDate="
				+ regDate + ", prodImgNo=" + prodImgNo + ", prodImgSrc=" + prodImgSrc + ", prodImgName=" + prodImgName
				+ ", cmtCnt=" + cmtCnt + ", diaryCnt=" + diaryCnt + ", pickCnt=" + pickCnt + ", pickNo=" + pickNo + "]";
	}

}
