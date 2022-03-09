package com.mydeco.vo;

public class ProductVo {

	private int prodNo;
	private int userNo;
	private String prodName;
	private String emotion;
	private int price;
	private String delivery;
	private String prodInfo;
	private String regDate;
	private String diaryLink;

	public ProductVo() {
	}

	public ProductVo(int prodNo, int userNo, String prodName, String emotion, int price, String delivery,
			String prodInfo, String regDate, String diaryLink) {
		this.prodNo = prodNo;
		this.userNo = userNo;
		this.prodName = prodName;
		this.emotion = emotion;
		this.price = price;
		this.delivery = delivery;
		this.prodInfo = prodInfo;
		this.regDate = regDate;
		this.diaryLink = diaryLink;
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

	public String getProdInfo() {
		return prodInfo;
	}

	public void setProdInfo(String prodInfo) {
		this.prodInfo = prodInfo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getDiaryLink() {
		return diaryLink;
	}

	public void setDiaryLink(String diaryLink) {
		this.diaryLink = diaryLink;
	}

	@Override
	public String toString() {
		return "ProductVo [prodNo=" + prodNo + ", userNo=" + userNo + ", prodName=" + prodName + ", emotion=" + emotion
				+ ", price=" + price + ", delivery=" + delivery + ", prodInfo=" + prodInfo + ", regDate=" + regDate
				+ ", diaryLink=" + diaryLink + "]";
	}

}
