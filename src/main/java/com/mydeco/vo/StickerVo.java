package com.mydeco.vo;

public class StickerVo {
	
	private int cateNo;
	private int stickerNo;
	private String stickerPath;
	private String stickerName;
	
	public StickerVo() {
	}


	public StickerVo(int cateNo, int stickerNo, String stickerPath, String stickerName) {
		this.cateNo = cateNo;
		this.stickerNo = stickerNo;
		this.stickerPath = stickerPath;
		this.stickerName = stickerName;
	}


	public int getCateNo() {
		return cateNo;
	}


	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}


	public int getStickerNo() {
		return stickerNo;
	}


	public void setStickerNo(int stickerNo) {
		this.stickerNo = stickerNo;
	}


	public String getStickerPath() {
		return stickerPath;
	}


	public void setStickerPath(String stickerPath) {
		this.stickerPath = stickerPath;
	}


	public String getStickerName() {
		return stickerName;
	}


	public void setStickerName(String stickerName) {
		this.stickerName = stickerName;
	}


	@Override
	public String toString() {
		return "StickerVo [cateNo=" + cateNo + ", stickerNo=" + stickerNo + ", stickerPath=" + stickerPath
				+ ", stickerName=" + stickerName + "]";
	}
	
}
