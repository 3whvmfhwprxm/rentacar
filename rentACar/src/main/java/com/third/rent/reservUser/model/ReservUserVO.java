package com.third.rent.reservUser.model;

/**
 * @author coope
 *
 */
public class ReservUserVO {
	
	//예약자 정보
	private String reservNum;
	private String resUName;
	private String resUTel1;
	private String resUTel2;
	private String resUTel3;
	private String resUMail;
	
	//운전자 정보
	private String resDrvName;
	private String resDrvTel1;
	private String resDrvTel2;
	private String resDrvTel3;
	private String resDrvBirth;
	private String resDrvCategory;
	public String getReservNum() {
		return reservNum;
	}
	public void setReservNum(String reservNum) {
		this.reservNum = reservNum;
	}
	public String getResUName() {
		return resUName;
	}
	public void setResUName(String resUName) {
		this.resUName = resUName;
	}
	public String getResUTel1() {
		return resUTel1;
	}
	public void setResUTel1(String resUTel1) {
		this.resUTel1 = resUTel1;
	}
	public String getResUTel2() {
		return resUTel2;
	}
	public void setResUTel2(String resUTel2) {
		this.resUTel2 = resUTel2;
	}
	public String getResUTel3() {
		return resUTel3;
	}
	public void setResUTel3(String resUTel3) {
		this.resUTel3 = resUTel3;
	}
	public String getResUMail() {
		return resUMail;
	}
	public void setResUMail(String resUMail) {
		this.resUMail = resUMail;
	}
	public String getResDrvName() {
		return resDrvName;
	}
	public void setResDrvName(String resDrvName) {
		this.resDrvName = resDrvName;
	}
	public String getResDrvTel1() {
		return resDrvTel1;
	}
	public void setResDrvTel1(String resDrvTel1) {
		this.resDrvTel1 = resDrvTel1;
	}
	public String getResDrvTel2() {
		return resDrvTel2;
	}
	public void setResDrvTel2(String resDrvTel2) {
		this.resDrvTel2 = resDrvTel2;
	}
	public String getResDrvTel3() {
		return resDrvTel3;
	}
	public void setResDrvTel3(String resDrvTel3) {
		this.resDrvTel3 = resDrvTel3;
	}
	public String getResDrvBirth() {
		return resDrvBirth;
	}
	public void setResDrvBirth(String resDrvBirth) {
		this.resDrvBirth = resDrvBirth;
	}
	public String getResDrvCategory() {
		return resDrvCategory;
	}
	public void setResDrvCategory(String resDrvCategory) {
		this.resDrvCategory = resDrvCategory;
	}
	@Override
	public String toString() {
		return "ReservUserVO [reservNum=" + reservNum + ", resUName=" + resUName + ", resUTel1=" + resUTel1
				+ ", resUTel2=" + resUTel2 + ", resUTel3=" + resUTel3 + ", resUMail=" + resUMail + ", resDrvName="
				+ resDrvName + ", resDrvTel1=" + resDrvTel1 + ", resDrvTel2=" + resDrvTel2 + ", resDrvTel3="
				+ resDrvTel3 + ", resDrvBirth=" + resDrvBirth + ", resDrvCategory=" + resDrvCategory + "]";
	}	
	
		
}
