package com.mydeco.vo;

public class LetterItemVo {

	// 필드
	private int letterStickerNo;
	private int letterNo;
	private int stickerNo;
	private String stickerSrc = "";
	private int top;
	private int left;
	private String letterPointX;
	private String letterPointY;
	private String angle;
	private String text = "";

	private int stickerCateNo;

	// 생성자
	public LetterItemVo() {
	}

	public LetterItemVo(int letterStickerNo, int letterNo, int stickerNo, String stickerSrc, int top, int left,
			String letterPointX, String letterPointY, String angle, String text, int stickerCateNo) {
		super();
		this.letterStickerNo = letterStickerNo;
		this.letterNo = letterNo;
		this.stickerNo = stickerNo;
		this.stickerSrc = stickerSrc;
		this.top = top;
		this.left = left;
		this.letterPointX = letterPointX;
		this.letterPointY = letterPointY;
		this.angle = angle;
		this.text = text;
		this.stickerCateNo = stickerCateNo;
	}

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

	public String getStickerSrc() {
		return stickerSrc;
	}

	public void setStickerSrc(String stickerSrc) {
		this.stickerSrc = stickerSrc;
	}

	public int getTop() {
		return top;
	}

	public void setTop(int top) {
		this.top = top;
	}

	public int getLeft() {
		return left;
	}

	public void setLeft(int left) {
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

	public int getStickerCateNo() {
		return stickerCateNo;
	}

	public void setStickerCateNo(int stickerCateNo) {
		this.stickerCateNo = stickerCateNo;
	}

	@Override
	public String toString() {
		return "LetterItemVo [letterStickerNo=" + letterStickerNo + ", letterNo=" + letterNo + ", stickerNo="
				+ stickerNo + ", stickerSrc=" + stickerSrc + ", top=" + top + ", left=" + left + ", letterPointX="
				+ letterPointX + ", letterPointY=" + letterPointY + ", angle=" + angle + ", text=" + text
				+ ", stickerCateNo=" + stickerCateNo + "]";
	}

}
