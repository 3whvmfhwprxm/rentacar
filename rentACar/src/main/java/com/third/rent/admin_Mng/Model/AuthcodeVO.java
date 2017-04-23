package com.third.rent.admin_Mng.Model;

public class AuthcodeVO {
	private int authCode;
	private String authName;
	public int getAuthCode() {
		return authCode;
	}
	public void setAuthCode(int authCode) {
		this.authCode = authCode;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
	@Override
	public String toString() {
		return "AuthcodeVO [authCode=" + authCode + ", authName=" + authName + "]";
	}	
}
