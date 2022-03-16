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
	/*text관련 추가*/
	private double lineblX;
	private double lineblY;
	private double linebrX;
	private double linebrY;
	private double linetlX;
	private double linetlY;
	private double linetrX;
	private double linetrY;
	/*text관련 추가*/
	private double cacheHeight;
	private double cacheTranslationX;
	private double cacheTranslationY;
	private double cacheWidth;
	
	private double width;
	private double height;
	
	
	
	//생성자
	public DiaryItemVo() {
		
	}


	public DiaryItemVo(int stickerNo, String stickerSrc, double top, double left, double scaleX, double scaleY,
			double angle, String text, double lineblX, double lineblY, double linebrX, double linebrY, double linetlX,
			double linetlY, double linetrX, double linetrY, double cacheHeight, double cacheTranslationX,
			double cacheTranslationY, double cacheWidth, double width, double height) {
		super();
		this.stickerNo = stickerNo;
		this.stickerSrc = stickerSrc;
		this.top = top;
		this.left = left;
		this.scaleX = scaleX;
		this.scaleY = scaleY;
		this.angle = angle;
		this.text = text;
		this.lineblX = lineblX;
		this.lineblY = lineblY;
		this.linebrX = linebrX;
		this.linebrY = linebrY;
		this.linetlX = linetlX;
		this.linetlY = linetlY;
		this.linetrX = linetrX;
		this.linetrY = linetrY;
		this.cacheHeight = cacheHeight;
		this.cacheTranslationX = cacheTranslationX;
		this.cacheTranslationY = cacheTranslationY;
		this.cacheWidth = cacheWidth;
		this.width = width;
		this.height = height;
	}



	public DiaryItemVo(int diaryItemNo, int diaryNo, int stickerNo, String stickerSrc, double top, double left,
			double scaleX, double scaleY, double angle, String text, double lineblX, double lineblY, double linebrX,
			double linebrY, double linetlX, double linetlY, double linetrX, double linetrY, double cacheHeight,
			double cacheTranslationX, double cacheTranslationY, double cacheWidth, double width, double height) {
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
		this.lineblX = lineblX;
		this.lineblY = lineblY;
		this.linebrX = linebrX;
		this.linebrY = linebrY;
		this.linetlX = linetlX;
		this.linetlY = linetlY;
		this.linetrX = linetrX;
		this.linetrY = linetrY;
		this.cacheHeight = cacheHeight;
		this.cacheTranslationX = cacheTranslationX;
		this.cacheTranslationY = cacheTranslationY;
		this.cacheWidth = cacheWidth;
		this.width = width;
		this.height = height;
	}


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


	public double getLineblX() {
		return lineblX;
	}


	public void setLineblX(double lineblX) {
		this.lineblX = lineblX;
	}


	public double getLineblY() {
		return lineblY;
	}


	public void setLineblY(double lineblY) {
		this.lineblY = lineblY;
	}


	public double getLinebrX() {
		return linebrX;
	}


	public void setLinebrX(double linebrX) {
		this.linebrX = linebrX;
	}


	public double getLinebrY() {
		return linebrY;
	}


	public void setLinebrY(double linebrY) {
		this.linebrY = linebrY;
	}


	public double getLinetlX() {
		return linetlX;
	}


	public void setLinetlX(double linetlX) {
		this.linetlX = linetlX;
	}


	public double getLinetlY() {
		return linetlY;
	}


	public void setLinetlY(double linetlY) {
		this.linetlY = linetlY;
	}


	public double getLinetrX() {
		return linetrX;
	}


	public void setLinetrX(double linetrX) {
		this.linetrX = linetrX;
	}


	public double getLinetrY() {
		return linetrY;
	}


	public void setLinetrY(double linetrY) {
		this.linetrY = linetrY;
	}


	public double getCacheHeight() {
		return cacheHeight;
	}


	public void setCacheHeight(double cacheHeight) {
		this.cacheHeight = cacheHeight;
	}


	public double getCacheTranslationX() {
		return cacheTranslationX;
	}


	public void setCacheTranslationX(double cacheTranslationX) {
		this.cacheTranslationX = cacheTranslationX;
	}


	public double getCacheTranslationY() {
		return cacheTranslationY;
	}


	public void setCacheTranslationY(double cacheTranslationY) {
		this.cacheTranslationY = cacheTranslationY;
	}


	public double getCacheWidth() {
		return cacheWidth;
	}


	public void setCacheWidth(double cacheWidth) {
		this.cacheWidth = cacheWidth;
	}


	public double getWidth() {
		return width;
	}


	public void setWidth(double width) {
		this.width = width;
	}


	public double getHeight() {
		return height;
	}


	public void setHeight(double height) {
		this.height = height;
	}


	@Override
	public String toString() {
		return "DiaryItemVo [diaryItemNo=" + diaryItemNo + ", diaryNo=" + diaryNo + ", stickerNo=" + stickerNo
				+ ", stickerSrc=" + stickerSrc + ", top=" + top + ", left=" + left + ", scaleX=" + scaleX + ", scaleY="
				+ scaleY + ", angle=" + angle + ", text=" + text + ", lineblX=" + lineblX + ", lineblY=" + lineblY
				+ ", linebrX=" + linebrX + ", linebrY=" + linebrY + ", linetlX=" + linetlX + ", linetlY=" + linetlY
				+ ", linetrX=" + linetrX + ", linetrY=" + linetrY + ", cacheHeight=" + cacheHeight
				+ ", cacheTranslationX=" + cacheTranslationX + ", cacheTranslationY=" + cacheTranslationY
				+ ", cacheWidth=" + cacheWidth + ", width=" + width + ", height=" + height + "]";
	}



}
