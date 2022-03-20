package com.mydeco.vo;

public class BgmVo {

	private int bgmNo;
	private String bgmTitle;
	private String bgmSrc;
	
	public BgmVo() {
		
	}
	
	public BgmVo(int bgmNo, String bgmTitle, String bgmSrc) {
		super();
		this.bgmNo = bgmNo;
		this.bgmTitle = bgmTitle;
		this.bgmSrc = bgmSrc;
	}

	public int getBgmNo() {
		return bgmNo;
	}

	public void setBgmNo(int bgmNo) {
		this.bgmNo = bgmNo;
	}

	public String getBgmTitle() {
		return bgmTitle;
	}

	public void setBgmTitle(String bgmTitle) {
		this.bgmTitle = bgmTitle;
	}

	public String getBgmSrc() {
		return bgmSrc;
	}

	public void setBgmSrc(String bgmSrc) {
		this.bgmSrc = bgmSrc;
	}

	@Override
	public String toString() {
		return "BgmVo [bgmNo=" + bgmNo + ", bgmTitle=" + bgmTitle + ", bgmSrc=" + bgmSrc + "]";
	}
	
	
	
	
}
