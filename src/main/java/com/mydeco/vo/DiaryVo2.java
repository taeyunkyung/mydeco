package com.mydeco.vo;

public class DiaryVo2 {

	private int diaryNo;
	private int userNo;
	private String diaryDate;
	private String weather;
	private String protect;
	private String title;
	private String diaryBgmSrc;
	private String contentJSON;

	public DiaryVo2() {
	}

	public DiaryVo2(int diaryNo, int userNo, String diaryDate, String weather, String protect, String title,
			String diaryBgmSrc, String contentJSON) {
		this.diaryNo = diaryNo;
		this.userNo = userNo;
		this.diaryDate = diaryDate;
		this.weather = weather;
		this.protect = protect;
		this.title = title;
		this.diaryBgmSrc = diaryBgmSrc;
		this.contentJSON = contentJSON;
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

	public String getContentJSON() {
		return contentJSON;
	}

	public void setContentJSON(String contentJSON) {
		this.contentJSON = contentJSON;
	}

	@Override
	public String toString() {
		return "DiaryVo [diaryNo=" + diaryNo + ", userNo=" + userNo + ", diaryDate=" + diaryDate + ", weather="
				+ weather + ", protect=" + protect + ", title=" + title + ", diaryBgmSrc=" + diaryBgmSrc
				+ ", contentJSON=" + contentJSON + "]";
	}

}
