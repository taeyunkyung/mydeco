package com.mydeco.vo;

import java.util.List;

public class LetterVo {

	// 필드
	private int letterNo;
	private int userNo;
	private String regDate;
	private String openDay;
	private String bgmSrc = ""; // 추후 추가 예정, null이 들어가지 않도록 디폴트값 지정
	private String readYN = "NO";
	private String saveYN;
	private List<LetterItemVo> itemList;
	
	private String text;

	// 생성자
	public LetterVo() {

	}

	public LetterVo(int letterNo, int userNo, String regDate, String openDay, String bgmSrc, String readYN,
			String saveYN) {
		this.letterNo = letterNo;
		this.userNo = userNo;
		this.regDate = regDate;
		this.openDay = openDay;
		this.bgmSrc = bgmSrc;
		this.readYN = readYN;
		this.saveYN = saveYN;
	}

	public LetterVo(int letterNo, int userNo, String regDate, String openDay, String bgmSrc, String readYN,
			String saveYN, List<LetterItemVo> itemList, String text) {
		this.letterNo = letterNo;
		this.userNo = userNo;
		this.regDate = regDate;
		this.openDay = openDay;
		this.bgmSrc = bgmSrc;
		this.readYN = readYN;
		this.saveYN = saveYN;
		this.itemList = itemList;
		this.text = text;
	}
	

	// getter setter
	public int getLetterNo() {
		return letterNo;
	}

	public void setLetterNo(int letterNo) {
		this.letterNo = letterNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getOpenDay() {
		return openDay;
	}

	public void setOpenDay(String openDay) {
		this.openDay = openDay;
	}

	public String getBgmSrc() {
		return bgmSrc;
	}

	public void setBgmSrc(String bgmSrc) {
		this.bgmSrc = bgmSrc;
	}

	public String getReadYN() {
		return readYN;
	}

	public void setReadYN(String readYN) {
		this.readYN = readYN;
	}

	public String getSaveYN() {
		return saveYN;
	}

	public void setSaveYN(String saveYN) {
		this.saveYN = saveYN;
	}

	public List<LetterItemVo> getItemList() {
		return itemList;
	}

	public void setItemList(List<LetterItemVo> itemList) {
		this.itemList = itemList;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return "LetterVo [letterNo=" + letterNo + ", userNo=" + userNo + ", regDate=" + regDate + ", openDay=" + openDay
				+ ", bgmSrc=" + bgmSrc + ", readYN=" + readYN + ", saveYN=" + saveYN + ", itemList=" + itemList
				+ ", text=" + text + "]";
	}

	

}
