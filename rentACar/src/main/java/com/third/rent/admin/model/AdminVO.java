package com.third.rent.admin.model;

import java.sql.Timestamp;

public class AdminVO {
	private String adminId;
	private String adminPwd;
	private String adminName;
	private String adminTel1;
	private String adminTel2;
	private String adminTel3;
	private String adminEmail;
	private Timestamp adminRegdate;
	private String adminAuthcode;
	private Timestamp adminOutdate;
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPwd() {
		return adminPwd;
	}
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminTel1() {
		return adminTel1;
	}
	public void setAdminTel1(String adminTel1) {
		this.adminTel1 = adminTel1;
	}
	public String getAdminTel2() {
		return adminTel2;
	}
	public void setAdminTel2(String adminTel2) {
		this.adminTel2 = adminTel2;
	}
	public String getAdminTel3() {
		return adminTel3;
	}
	public void setAdminTel3(String adminTel3) {
		this.adminTel3 = adminTel3;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public Timestamp getAdminRegdate() {
		return adminRegdate;
	}
	public void setAdminRegdate(Timestamp adminRegdate) {
		this.adminRegdate = adminRegdate;
	}
	public String getAdminAuthcode() {
		return adminAuthcode;
	}
	public void setAdminAuthcode(String adminAuthcode) {
		this.adminAuthcode = adminAuthcode;
	}
	public Timestamp getAdminOutdate() {
		return adminOutdate;
	}
	public void setAdminOutdate(Timestamp adminOutdate) {
		this.adminOutdate = adminOutdate;
	}
	@Override
	public String toString() {
		return "AdminVO [adminId=" + adminId + ", adminPwd=" + adminPwd + ", adminName=" + adminName + ", adminTel1="
				+ adminTel1 + ", adminTel2=" + adminTel2 + ", adminTel3=" + adminTel3 + ", adminEmail=" + adminEmail
				+ ", adminRegdate=" + adminRegdate + ", adminAuthcode=" + adminAuthcode + ", adminOutdate="
				+ adminOutdate + "]";
	}
	
	
	
	
}
