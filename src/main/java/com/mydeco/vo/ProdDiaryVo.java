package com.mydeco.vo;

public class ProdDiaryVo {

	private int prodDiaryNo;
	private int prodNo;
	private int diaryNo;
	private int count;

	public ProdDiaryVo() {
		super();
	}

	
	public ProdDiaryVo(int prodNo, int diaryNo) {
		super();
		this.prodNo = prodNo;
		this.diaryNo = diaryNo;
	}


	public ProdDiaryVo(int prodDiaryNo, int prodNo, int diaryNo, int count) {
		super();
		this.prodDiaryNo = prodDiaryNo;
		this.prodNo = prodNo;
		this.diaryNo = diaryNo;
		this.count = count;
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


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	@Override
	public String toString() {
		return "ProdDiaryVo [prodDiaryNo=" + prodDiaryNo + ", prodNo=" + prodNo + ", diaryNo=" + diaryNo + ", count="
				+ count + "]";
	}


}
