package com.third.rent.company.model;

import java.sql.Timestamp;

public class CompanyVO {
	private String comId;
	private String comName;
	private String comPwd;
	private String comNum;
	private String comAccNum;
	private String comTel1;
	private String comTel2;
	private String comTel3;
	private String comMobile1;
	private String comMobile2;
	private String comMobile3;
	private String comFax1;
	private String comFax2;
	private String comFax3;
	private String comAddress;
	private String comReturnPlace;	//차량 인수/반납 주소
	private String comCeo;
	private String comEmail;
	private int comRate;
	private String comLogo;
	private Timestamp comRegdate;
	private Timestamp comOutdate;
	
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getComPwd() {
		return comPwd;
	}
	public void setComPwd(String comPwd) {
		this.comPwd = comPwd;
	}
	public String getComNum() {
		return comNum;
	}
	public void setComNum(String comNum) {
		this.comNum = comNum;
	}
	public String getComAccNum() {
		return comAccNum;
	}
	public void setComAccNum(String comAccNum) {
		this.comAccNum = comAccNum;
	}
	public String getComTel1() {
		return comTel1;
	}
	public void setComTel1(String comTel1) {
		this.comTel1 = comTel1;
	}
	public String getComTel2() {
		return comTel2;
	}
	public void setComTel2(String comTel2) {
		this.comTel2 = comTel2;
	}
	public String getComTel3() {
		return comTel3;
	}
	public void setComTel3(String comTel3) {
		this.comTel3 = comTel3;
	}
	public String getComMobile1() {
		return comMobile1;
	}
	public void setComMobile1(String comMobile1) {
		this.comMobile1 = comMobile1;
	}
	public String getComMobile2() {
		return comMobile2;
	}
	public void setComMobile2(String comMobile2) {
		this.comMobile2 = comMobile2;
	}
	public String getComMobile3() {
		return comMobile3;
	}
	public void setComMobile3(String comMobile3) {
		this.comMobile3 = comMobile3;
	}
	public String getComFax1() {
		return comFax1;
	}
	public void setComFax1(String comFax1) {
		this.comFax1 = comFax1;
	}
	public String getComFax2() {
		return comFax2;
	}
	public void setComFax2(String comFax2) {
		this.comFax2 = comFax2;
	}
	public String getComFax3() {
		return comFax3;
	}
	public void setComFax3(String comFax3) {
		this.comFax3 = comFax3;
	}
	public String getComAddress() {
		return comAddress;
	}
	public void setComAddress(String comAddress) {
		this.comAddress = comAddress;
	}
	public String getComReturnPlace() {
		return comReturnPlace;
	}
	public void setComReturnPlace(String comReturnPlace) {
		this.comReturnPlace = comReturnPlace;
	}
	public String getComCeo() {
		return comCeo;
	}
	public void setComCeo(String comCeo) {
		this.comCeo = comCeo;
	}
	public String getComEmail() {
		return comEmail;
	}
	public void setComEmail(String comEmail) {
		this.comEmail = comEmail;
	}
	public int getComRate() {
		return comRate;
	}
	public void setComRate(int comRate) {
		this.comRate = comRate;
	}
	public String getComLogo() {
		return comLogo;
	}
	public void setComLogo(String comLogo) {
		this.comLogo = comLogo;
	}
	public Timestamp getComRegdate() {
		return comRegdate;
	}
	public void setComRegdate(Timestamp comRegdate) {
		this.comRegdate = comRegdate;
	}
	public Timestamp getComOutdate() {
		return comOutdate;
	}
	public void setComOutdate(Timestamp comOutdate) {
		this.comOutdate = comOutdate;
	}
	
	@Override
	public String toString() {
		return "CompanyVO [comId=" + comId + ", comName=" + comName + ", comPwd=" + comPwd + ", comNum=" + comNum
				+ ", comAccNum=" + comAccNum + ", comTel1=" + comTel1 + ", comTel2=" + comTel2 + ", comTel3=" + comTel3
				+ ", comMobile1=" + comMobile1 + ", comMobile2=" + comMobile2 + ", comMobile3=" + comMobile3
				+ ", comFax1=" + comFax1 + ", comFax2=" + comFax2 + ", comFax3=" + comFax3 + ", comAddress="
				+ comAddress + ", comReturnPlace=" + comReturnPlace + ", comCeo=" + comCeo + ", comEmail=" + comEmail
				+ ", comRate=" + comRate + ", comLogo=" + comLogo + ", comRegdate=" + comRegdate + ", comOutdate="
				+ comOutdate + "]";
	}

}