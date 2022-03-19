package com.mydeco.vo;

import java.util.List;

public class DiaryContentVo {

	private int diaryNo;
	private int userNo;
	private String diaryDate;
	private String weather;
	private String protect;
	private String title;
	private String diaryBgmSrc;
	private List<DiaryItemVo> itemList;

	// 상품 페이지에 쓰일거 선흠 조금 덧붙임//

	private int prodNo;

	public DiaryContentVo() {

	}

	public DiaryContentVo(int diaryNo, int userNo, String diaryDate, String weather, String protect, String title,
			String diaryBgmSrc, List<DiaryItemVo> itemList, int prodNo) {

		this.diaryNo = diaryNo;
		this.userNo = userNo;
		this.diaryDate = diaryDate;
		this.weather = weather;
		this.protect = protect;
		this.title = title;
		this.diaryBgmSrc = diaryBgmSrc;
		this.itemList = itemList;
		this.prodNo = prodNo;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getDiaryDate() {
		return diaryDate;
	}

	public void setDiaryDate(String diaryDate) {
		this.diaryDate = diaryDate;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public String getProtect() {
		return protect;
	}

	public void setProtect(String protect) {
		this.protect = protect;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDiaryBgmSrc() {
		return diaryBgmSrc;
	}

	public void setDiaryBgmSrc(String diaryBgmSrc) {
		this.diaryBgmSrc = diaryBgmSrc;
	}

	public List<DiaryItemVo> getItemList() {
		return itemList;
	}

	public void setItemList(List<DiaryItemVo> itemList) {
		this.itemList = itemList;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	@Override
	public String toString() {
		return "DiaryContentVo [diaryNo=" + diaryNo + ", userNo=" + userNo + ", diaryDate=" + diaryDate + ", weather="
				+ weather + ", protect=" + protect + ", title=" + title + ", diaryBgmSrc=" + diaryBgmSrc + ", itemList="
				+ itemList + ", prodNo=" + prodNo + "]";
	}

}
