package com.mydeco.vo;

public class LetterItemVo {

	//필드
	private int letterStickerNo;
	private int letterNo;
	private int stickerNo;
	private String stickerSrc;
	private String top;
	private String left;
	private String letterPointX;
	private String letterPointY;
	private String angle;
	private String text ="";
	
	
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
	public LetterItemVo() {
		
	}
	

	public LetterItemVo(int letterStickerNo, int letterNo, int stickerNo, String stickerSrc, String top, String left,
			String letterPointX, String letterPointY, String angle, String text, double lineblX, double lineblY,
			double linebrX, double linebrY, double linetlX, double linetlY, double linetrX, double linetrY,
			double cacheHeight, double cacheTranslationX, double cacheTranslationY, double cacheWidth, double width,
			double height) {
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


	public String getStickerSrc() {
		return stickerSrc;
	}


	public void setStickerSrc(String stickerSrc) {
		this.stickerSrc = stickerSrc;
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
		return "LetterItemVo [letterStickerNo=" + letterStickerNo + ", letterNo=" + letterNo + ", stickerNo="
				+ stickerNo + ", stickerSrc=" + stickerSrc + ", top=" + top + ", left=" + left + ", letterPointX="
				+ letterPointX + ", letterPointY=" + letterPointY + ", angle=" + angle + ", text=" + text + ", lineblX="
				+ lineblX + ", lineblY=" + lineblY + ", linebrX=" + linebrX + ", linebrY=" + linebrY + ", linetlX="
				+ linetlX + ", linetlY=" + linetlY + ", linetrX=" + linetrX + ", linetrY=" + linetrY + ", cacheHeight="
				+ cacheHeight + ", cacheTranslationX=" + cacheTranslationX + ", cacheTranslationY=" + cacheTranslationY
				+ ", cacheWidth=" + cacheWidth + ", width=" + width + ", height=" + height + "]";
	}


	
}
