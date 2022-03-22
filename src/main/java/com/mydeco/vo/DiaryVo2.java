package com.mydeco.vo;

import java.util.List;

public class DiaryVo2 {

	private int diaryNo;
	private int userNo;
	private String diaryDate;
	private String weather;
	private String protect;
	private String title;
	private String diaryBgmSrc;
	private String stickerSrc;
	private List<DiaryItemVo> itemList;

	public DiaryVo2() {
	}

	public DiaryVo2(int diaryNo, int userNo, String diaryDate, String weather, String protect, String title,
			String diaryBgmSrc, String stickerSrc) {
		super();
		this.diaryNo = diaryNo;
		this.userNo = userNo;
		this.diaryDate = diaryDate;
		this.weather = weather;
		this.protect = protect;
		this.title = title;
		this.diaryBgmSrc = diaryBgmSrc;
		this.stickerSrc = stickerSrc;
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

	public String getStickerSrc() {
		return stickerSrc;
	}

	public void setStickerSrc(String stickerSrc) {
		this.stickerSrc = stickerSrc;
	}

	public List<DiaryItemVo> getItemList() {
		return itemList;
	}

	public void setItemList(List<DiaryItemVo> itemList) {
		this.itemList = itemList;
	}

	@Override
	public String toString() {
		return "DiaryVo2 [diaryNo=" + diaryNo + ", userNo=" + userNo + ", diaryDate=" + diaryDate + ", weather="
				+ weather + ", protect=" + protect + ", title=" + title + ", diaryBgmSrc=" + diaryBgmSrc
				+ ", stickerSrc=" + stickerSrc + "]";
	}

}
