package com.mydeco.vo;

public class ProdDiaryVo {

	private int prodDiaryNo;
	private int prodNo;
	private int diaryNo;

	public ProdDiaryVo() {
		super();
	}

	public ProdDiaryVo(int prodNo, int diaryNo) {		
		this.prodNo = prodNo;
		this.diaryNo = diaryNo;
	}

	public int getProdDiaryNo() {
		return prodDiaryNo;
	}

	public void setProdDiaryNo(int prodDiaryNo) {
		this.prodDiaryNo = prodDiaryNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	@Override
	public String toString() {
		return "ProdDiaryVo [prodDiaryNo=" + prodDiaryNo + ", prodNo=" + prodNo + ", diaryNo=" + diaryNo + "]";
	}

}
