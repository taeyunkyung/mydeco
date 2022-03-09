package com.mydeco.vo;

public class ProdImgVo {

	private int prodImgNo;
	private String prodImgSrc;
	private String prodImgName;
	private int prodNo;

	public ProdImgVo() {
	}

	public ProdImgVo(String prodImgSrc, String prodImgName, int prodNo) {		
		this.prodImgSrc = prodImgSrc;
		this.prodImgName = prodImgName;
		this.prodNo = prodNo;
	}

	public int getProdImgNo() {
		return prodImgNo;
	}

	public void setProdImgNo(int prodImgNo) {
		this.prodImgNo = prodImgNo;
	}

	public String getProdImgSrc() {
		return prodImgSrc;
	}

	public void setProdImgSrc(String prodImgSrc) {
		this.prodImgSrc = prodImgSrc;
	}

	public String getProdImgName() {
		return prodImgName;
	}

	public void setProdImgName(String prodImgName) {
		this.prodImgName = prodImgName;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	@Override
	public String toString() {
		return "ProdImgVo [prodImgNo=" + prodImgNo + ", prodImgSrc=" + prodImgSrc + ", prodImgName=" + prodImgName
				+ ", prodNo=" + prodNo + "]";
	}

}
