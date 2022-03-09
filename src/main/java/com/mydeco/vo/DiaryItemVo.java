package com.mydeco.vo;

public class DiaryItemVo {
	
	//필드
	private int diaryItemNo;
	private int diaryNo;
	private int stickerNo;
	private String stickerSrc;
	private double top;
	private double left;
	private double scaleX;
	private double scaleY;
	private double angle;
	private String text;
	
	
	//생성자
	public DiaryItemVo() {
		
	}
	
	
	public DiaryItemVo(int stickerNo, double top, double left, double scaleX, double scaleY, double angle,
			String text) {
		super();
		this.stickerNo = stickerNo;
		this.top = top;
		this.left = left;
		this.scaleX = scaleX;
		this.scaleY = scaleY;
		this.angle = angle;
		this.text = text;
	}



	public DiaryItemVo(int diaryItemNo, int diaryNo, int stickerNo, String stickerSrc, double top, double left,
			double scaleX, double scaleY, double angle, String text) {
		this.diaryItemNo = diaryItemNo;
		this.diaryNo = diaryNo;
		this.stickerNo = stickerNo;
		this.stickerSrc = stickerSrc;
		this.top = top;
		this.left = left;
		this.scaleX = scaleX;
		this.scaleY = scaleY;
		this.angle = angle;
		this.text = text;
	}

	
	//메소드 g/s
	public int getDiaryItemNo() {
		return diaryItemNo;
	}

	public void setDiaryItemNo(int diaryItemNo) {
		this.diaryItemNo = diaryItemNo;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
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

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	
	//메소드 일반
	@Override
	public String toString() {
		return "DiaryItemVo [diaryItemNo=" + diaryItemNo + ", diaryNo=" + diaryNo + ", stickerNo=" + stickerNo
				+ ", stickerSrc=" + stickerSrc + ", top=" + top + ", left=" + left + ", scaleX=" + scaleX + ", scaleY="
				+ scaleY + ", angle=" + angle + ", text=" + text + "]";
	}
	

}
