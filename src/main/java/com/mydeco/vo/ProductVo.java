package com.mydeco.vo;

import java.util.List;

public class ProductVo {

	private int prodNo;
	private int userNo;
	private String prodName;
	private String emotion;
	private int price;
	private String delivery;
	private String prodInfo;
	private String regDate;
	private List<ProdImgVo> prodImgList; // 추가
	private String userName;
	
	// 나의상품, 찜한상품 //
	private String prodImgSrc;
	private int diaryCnt;
	private int pickNo;
	private String id;
	private int pickCnt;

	public String getProdImgSrc() {
		return prodImgSrc;
	}

	public void setProdImgSrc(String prodImgSrc) {
		this.prodImgSrc = prodImgSrc;
	}

	public int getDiaryCnt() {
		return diaryCnt;
	}

	public void setDiaryCnt(int diaryCnt) {
		this.diaryCnt = diaryCnt;
	}

	public int getPickNo() {
		return pickNo;
	}

	public void setPickNo(int pickNo) {
		this.pickNo = pickNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPickCnt() {
		return pickCnt;
	}

	public void setPickCnt(int pickCnt) {
		this.pickCnt = pickCnt;
	}
	// 나의상품, 찜한상품 //

	public ProductVo() {
	}

	
	
	public ProductVo(int diaryCnt, int prodNo) {
		this.prodNo = prodNo;
		this.diaryCnt = diaryCnt;
	}

	
	public ProductVo(int prodNo, int userNo, String regDate, int pickNo) {
		this.prodNo = prodNo;
		this.userNo = userNo;
		this.regDate = regDate;
		this.pickNo = pickNo;
	}

	public ProductVo(int prodNo, int userNo, String prodName, String emotion, int price, String delivery,
			String prodInfo, String regDate) {
		this.prodNo = prodNo;
		this.userNo = userNo;
		this.prodName = prodName;
		this.emotion = emotion;
		this.price = price;
		this.delivery = delivery;
		this.prodInfo = prodInfo;
		this.regDate = regDate;
	}

	public ProductVo(int prodNo, int userNo, String prodName, String emotion, int price, String delivery,
			String prodInfo, String regDate, List<ProdImgVo> prodImgList, String userName) {
		super();
		this.prodNo = prodNo;
		this.userNo = userNo;
		this.prodName = prodName;
		this.emotion = emotion;
		this.price = price;
		this.delivery = delivery;
		this.prodInfo = prodInfo;
		this.regDate = regDate;
		this.prodImgList = prodImgList;
		this.userName = userName;
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

	public List<ProdImgVo> getProdImgList() {
		return prodImgList;
	}

	public void setProdImgList(List<ProdImgVo> prodImgList) {
		this.prodImgList = prodImgList;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "ProductVo [prodNo=" + prodNo + ", userNo=" + userNo + ", prodName=" + prodName + ", emotion=" + emotion
				+ ", price=" + price + ", delivery=" + delivery + ", prodInfo=" + prodInfo + ", regDate=" + regDate
				+ ", prodImgList=" + prodImgList + ", userName=" + userName + ", prodImgSrc=" + prodImgSrc
				+ ", diaryCnt=" + diaryCnt + ", pickNo=" + pickNo + ", id=" + id + ", pickCnt=" + pickCnt + "]";
	}


}
