package com.mydeco.vo;

public class UserVo {

	private int userNo;
	private String id;
	private String password;
	private String name;
	private String personalNo;
	private String hp;
	private String gender;
	private String mbti;
	private String joinDate;
	private String sellerYN;

	public UserVo() {
	}

	public UserVo(int userNo, String id, String password, String name, String personalNo, String hp, String gender,
			String mbti, String joinDate, String sellerYN) {
		this.userNo = userNo;
		this.id = id;
		this.password = password;
		this.name = name;
		this.personalNo = personalNo;
		this.hp = hp;
		this.gender = gender;
		this.mbti = mbti;
		this.joinDate = joinDate;
		this.sellerYN = sellerYN;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPersonalNo() {
		return personalNo;
	}

	public void setPersonalNo(String personalNo) {
		this.personalNo = personalNo;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMbti() {
		return mbti;
	}

	public void setMbti(String mbti) {
		this.mbti = mbti;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getSellerYN() {
		return sellerYN;
	}

	public void setSellerYN(String sellerYN) {
		this.sellerYN = sellerYN;
	}

	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", id=" + id + ", password=" + password + ", name=" + name + ", personalNo="
				+ personalNo + ", hp=" + hp + ", gender=" + gender + ", mbti=" + mbti + ", joinDate=" + joinDate
				+ ", sellerYN=" + sellerYN + "]";
	}
}
