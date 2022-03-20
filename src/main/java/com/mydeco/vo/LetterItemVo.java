package com.mydeco.vo;

public class LetterItemVo {

	// 필드
	private int letterStickerNo;
	private int letterNo;
	private int stickerNo;
	private String stickerSrc = "";
	private double top;
	private double left;
	private double letterPointX;
	private double letterPointY;
	private double angle;
	private String text = "";

	private int stickerCateNo;

	// 생성자
	public LetterItemVo() {
	}

	public LetterItemVo(int letterStickerNo, int letterNo, int stickerNo, String stickerSrc, double top, double left,
			double letterPointX, double letterPointY, double angle, String text, int stickerCateNo) {
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

	public double getTop() {
		return top;
	}

	public void setTop(double top) {
		this.top = top;
	}

	public double getLeft() {
		return left;
	}

	public void setLeft(double left) {
		this.left = left;
	}

	public double getLetterPointX() {
		return letterPointX;
	}

	public void setLetterPointX(double letterPointX) {
		this.letterPointX = letterPointX;
	}

	public double getLetterPointY() {
		return letterPointY;
	}

	public void setLetterPointY(double letterPointY) {
		this.letterPointY = letterPointY;
	}

	public double getAngle() {
		return angle;
	}

	public void setAngle(double angle) {
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
