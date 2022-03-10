package com.mydeco.vo;

public class PaperVo {
	private int paperNo;
	private String paperName;
	private String paperSrc;
	
	public PaperVo() {
		
	}
	
	
	
	public PaperVo(String paperName, String paperSrc) {
		super();
		this.paperName = paperName;
		this.paperSrc = paperSrc;
	}



	public PaperVo(int paperNo, String paperName, String paperSrc) {
		super();
		this.paperNo = paperNo;
		this.paperName = paperName;
		this.paperSrc = paperSrc;
	}


	
	public int getPaperNo() {
		return paperNo;
	}


	public void setPaperNo(int paperNo) {
		this.paperNo = paperNo;
	}


	public String getPaperName() {
		return paperName;
	}


	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}


	public String getPaperSrc() {
		return paperSrc;
	}


	public void setPaperSrc(String paperSrc) {
		this.paperSrc = paperSrc;
	}
	
	
	
}
