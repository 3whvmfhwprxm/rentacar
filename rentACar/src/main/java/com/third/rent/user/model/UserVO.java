package com.third.rent.user.model;

import java.sql.Timestamp;

public class UserVO {
	private String userId;
	private String userPwd;
	private String userName;
	private String userEmail1;
	private String userEmail2;
	private String userTel1;
	private String userTel2;
	private String userTel3;
	private String userBirth;
	private String userAddress;
	private String userGender;
	private String userLicense;
	private Timestamp userRegdate;
	private Timestamp userOutdate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail1() {
		return userEmail1;
	}
	public void setUserEmail1(String userEmail1) {
		this.userEmail1 = userEmail1;
	}
	public String getUserEmail2() {
		return userEmail2;
	}
	public void setUserEmail2(String userEmail2) {
		this.userEmail2 = userEmail2;
	}
	public String getUserTel1() {
		return userTel1;
	}
	public void setUserTel1(String userTel1) {
		this.userTel1 = userTel1;
	}
	public String getUserTel2() {
		return userTel2;
	}
	public void setUserTel2(String userTel2) {
		this.userTel2 = userTel2;
	}
	public String getUserTel3() {
		return userTel3;
	}
	public void setUserTel3(String userTel3) {
		this.userTel3 = userTel3;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserLicense() {
		return userLicense;
	}
	public void setUserLicense(String userLicense) {
		this.userLicense = userLicense;
	}
	public Timestamp getUserRegdate() {
		return userRegdate;
	}
	public void setUserRegdate(Timestamp userRegdate) {
		this.userRegdate = userRegdate;
	}
	public Timestamp getUserOutdate() {
		return userOutdate;
	}
	public void setUserOutdate(Timestamp userOutdate) {
		this.userOutdate = userOutdate;
	}
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", userEmail1="
				+ userEmail1 + ", userEmail2=" + userEmail2 + ", userTel1=" + userTel1 + ", userTel2=" + userTel2
				+ ", userTel3=" + userTel3 + ", userBirth=" + userBirth + ", userAddress=" + userAddress
				+ ", userGender=" + userGender + ", userLicense=" + userLicense + ", userRegdate=" + userRegdate
				+ ", userOutdate=" + userOutdate + "]";
	}
	
	
}
