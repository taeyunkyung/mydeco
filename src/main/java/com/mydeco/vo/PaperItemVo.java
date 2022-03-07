package com.mydeco.vo;

public class PaperItemVo {

	private int itemNo;
	private double top;
	private double left;
	private double scaleX;
	private double scaleY;
	private double angle;
	private int stickerNo;
	private String stickerPath;
	private String text;
	
	
	public PaperItemVo() {
	}


	public PaperItemVo(int itemNo, double top, double left, double scaleX, double scaleY, double angle, int stickerNo,
			String stickerPath, String text) {
		super();
		this.itemNo = itemNo;
		this.top = top;
		this.left = left;
		this.scaleX = scaleX;
		this.scaleY = scaleY;
		this.angle = angle;
		this.stickerNo = stickerNo;
		this.stickerPath = stickerPath;
		this.text = text;
	}


	public int getItemNo() {
		return itemNo;
	}


	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
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


	public double getScaleX() {
		return scaleX;
	}


	public void setScaleX(double scaleX) {
		this.scaleX = scaleX;
	}


	public double getScaleY() {
		return scaleY;
	}


	public void setScaleY(double scaleY) {
		this.scaleY = scaleY;
	}


	public double getAngle() {
		return angle;
	}


	public void setAngle(double angle) {
		this.angle = angle;
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


	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}


	@Override
	public String toString() {
		return "PaperItemVo [itemNo=" + itemNo + ", top=" + top + ", left=" + left + ", scaleX=" + scaleX + ", scaleY="
				+ scaleY + ", angle=" + angle + ", stickerNo=" + stickerNo + ", stickerPath=" + stickerPath + ", text="
				+ text + "]";
	}

}
