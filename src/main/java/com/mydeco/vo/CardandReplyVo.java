package com.mydeco.vo;

public class CardandReplyVo {

	private int cardNo;
	private int userNo;
	private int count;
	private String cardContent;
	private String cardContentFull;
	private String cardRegdate;
	private String cardAge;
	private String cardGender;
	private String cardImgSrc;

	private int replycardno;
	private int reUserNo;
	private String targetAge;
	private String targetGender;
	private String sendyn;
	private String replyContent;
	private String replyContentFull;
	private String replyRegdate;
	private String recardImgSrc;

	public CardandReplyVo() {
	}

	public CardandReplyVo(int cardNo, int userNo, int count, String cardContent, String cardContentFull,
			String cardRegdate, String cardAge, String cardGender, String cardImgSrc, int replycardno, int reUserNo,
			String targetAge, String targetGender, String sendyn, String replyContent, String replyContentFull,
			String replyRegdate, String recardImgSrc) {
		super();
		this.cardNo = cardNo;
		this.userNo = userNo;
		this.count = count;
		this.cardContent = cardContent;
		this.cardContentFull = cardContentFull;
		this.cardRegdate = cardRegdate;
		this.cardAge = cardAge;
		this.cardGender = cardGender;
		this.cardImgSrc = cardImgSrc;
		this.replycardno = replycardno;
		this.reUserNo = reUserNo;
		this.targetAge = targetAge;
		this.targetGender = targetGender;
		this.sendyn = sendyn;
		this.replyContent = replyContent;
		this.replyContentFull = replyContentFull;
		this.replyRegdate = replyRegdate;
		this.recardImgSrc = recardImgSrc;
	}

	public int getCardNo() {
		return cardNo;
	}

	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCardContent() {
		return cardContent;
	}

	public void setCardContent(String cardContent) {
		this.cardContent = cardContent;
	}

	public String getCardContentFull() {
		return cardContentFull;
	}

	public void setCardContentFull(String cardContentFull) {
		this.cardContentFull = cardContentFull;
	}

	public String getCardRegdate() {
		return cardRegdate;
	}

	public void setCardRegdate(String cardRegdate) {
		this.cardRegdate = cardRegdate;
	}

	public String getCardAge() {
		return cardAge;
	}

	public void setCardAge(String cardAge) {
		this.cardAge = cardAge;
	}

	public String getCardGender() {
		return cardGender;
	}

	public void setCardGender(String cardGender) {
		this.cardGender = cardGender;
	}

	public String getCardImgSrc() {
		return cardImgSrc;
	}

	public void setCardImgSrc(String cardImgSrc) {
		this.cardImgSrc = cardImgSrc;
	}

	public int getReplycardno() {
		return replycardno;
	}

	public void setReplycardno(int replycardno) {
		this.replycardno = replycardno;
	}

	public int getReUserNo() {
		return reUserNo;
	}

	public void setReUserNo(int reUserNo) {
		this.reUserNo = reUserNo;
	}

	public String getTargetAge() {
		return targetAge;
	}

	public void setTargetAge(String targetAge) {
		this.targetAge = targetAge;
	}

	public String getTargetGender() {
		return targetGender;
	}

	public void setTargetGender(String targetGender) {
		this.targetGender = targetGender;
	}

	public String getSendyn() {
		return sendyn;
	}

	public void setSendyn(String sendyn) {
		this.sendyn = sendyn;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyContentFull() {
		return replyContentFull;
	}

	public void setReplyContentFull(String replyContentFull) {
		this.replyContentFull = replyContentFull;
	}

	public String getReplyRegdate() {
		return replyRegdate;
	}

	public void setReplyRegdate(String replyRegdate) {
		this.replyRegdate = replyRegdate;
	}

	public String getRecardImgSrc() {
		return recardImgSrc;
	}

	public void setRecardImgSrc(String recardImgSrc) {
		this.recardImgSrc = recardImgSrc;
	}

	@Override
	public String toString() {
		return "CardandReplyVo [cardNo=" + cardNo + ", userNo=" + userNo + ", count=" + count + ", cardContent="
				+ cardContent + ", cardContentFull=" + cardContentFull + ", cardRegdate=" + cardRegdate + ", cardAge="
				+ cardAge + ", cardGender=" + cardGender + ", cardImgSrc=" + cardImgSrc + ", replycardno=" + replycardno
				+ ", reUserNo=" + reUserNo + ", targetAge=" + targetAge + ", targetGender=" + targetGender + ", sendyn="
				+ sendyn + ", replyContent=" + replyContent + ", replyContentFull=" + replyContentFull
				+ ", replyRegdate=" + replyRegdate + ", recardImgSrc=" + recardImgSrc + "]";
	}

}
