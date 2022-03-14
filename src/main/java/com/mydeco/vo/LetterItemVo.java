package com.mydeco.vo;

public class LetterItemVo {

	//필드
	private int letterStickerNo;
	private int letterNo;
	private int stickerNo;
	private String top;
	private String left;
	private String letterPointX;
	private String letterPointY;
	private String angle;
	private String text ="";
	
	
	//생성자
	public LetterItemVo() {
		
	}
	
	
	public LetterItemVo(int letterStickerNo, int letterNo, int stickerNo, String top, String left, String letterPointX,
			String letterPointY, String angle, String text) {
		this.letterStickerNo = letterStickerNo;
		this.letterNo = letterNo;
		this.stickerNo = stickerNo;
		this.top = top;
		this.left = left;
		this.letterPointX = letterPointX;
		this.letterPointY = letterPointY;
		this.angle = angle;
		this.text = text;
	}

	

	//getter setter
	public int getLetterStickerNo() {
		return letterStickerNo;
	}


	public void setLetterStickerNo(int letterStickerNo) {
		this.letterStickerNo = letterStickerNo;
	}


	public int getLetterNo() {
		return letterNo;
	}


	public void setLetterNo(int letterNo) {
		this.letterNo = letterNo;
	}


	public int getStickerNo() {
		return stickerNo;
	}


	public void setStickerNo(int stickerNo) {
		this.stickerNo = stickerNo;
	}


	public String getTop() {
		return top;
	}


	public void setTop(String top) {
		this.top = top;
	}


	public String getLeft() {
		return left;
	}


	public void setLeft(String left) {
		this.left = left;
	}


	public String getLetterPointX() {
		return letterPointX;
	}


	public void setLetterPointX(String letterPointX) {
		this.letterPointX = letterPointX;
	}


	public String getLetterPointY() {
		return letterPointY;
	}


	public void setLetterPointY(String letterPointY) {
		this.letterPointY = letterPointY;
	}


	public String getAngle() {
		return angle;
	}


	public void setAngle(String angle) {
		this.angle = angle;
	}


	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}


	@Override
	public String toString() {
		return "LetterItemVo [letterStickerNo=" + letterStickerNo + ", letterNo=" + letterNo + ", stickerNo="
				+ stickerNo + ", top=" + top + ", left=" + left + ", letterPointX=" + letterPointX + ", letterPointY="
				+ letterPointY + ", angle=" + angle + ", text=" + text + "]";
	}
	
	
	
}
