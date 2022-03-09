package com.mydeco.vo;

public class StickerVo2 {

	private int stickerNo;
	private int stickerCateNo;
	private String stickerName;
	private String stickerSrc;
	
	public StickerVo2() {
		
	}

	
	public StickerVo2(String stickerName, String stickerSrc) {
		super();
		this.stickerName = stickerName;
		this.stickerSrc = stickerSrc;
	}



	public StickerVo2(int stickerNo, int stickerCateNo, String stickerName, String stickerSrc) {
		this.stickerNo = stickerNo;
		this.stickerCateNo = stickerCateNo;
		this.stickerName = stickerName;
		this.stickerSrc = stickerSrc;
	}

	//게터세터
	public int getStickerNo() {
		return stickerNo;
	}

	public void setStickerNo(int stickerNo) {
		this.stickerNo = stickerNo;
	}

	public int getStickerCateNo() {
		return stickerCateNo;
	}

	public void setStickerCateNo(int stickerCateNo) {
		this.stickerCateNo = stickerCateNo;
	}

	public String getStickerName() {
		return stickerName;
	}

	public void setStickerName(String stickerName) {
		this.stickerName = stickerName;
	}

	public String getStickerSrc() {
		return stickerSrc;
	}

	public void setStickerSrc(String stickerSrc) {
		this.stickerSrc = stickerSrc;
	}

	@Override
	public String toString() {
		return "StickerVo2 [stickerNo=" + stickerNo + ", stickerCateNo=" + stickerCateNo + ", stickerName="
				+ stickerName + ", stickerSrc=" + stickerSrc + "]";
	}
	
	
	
}
