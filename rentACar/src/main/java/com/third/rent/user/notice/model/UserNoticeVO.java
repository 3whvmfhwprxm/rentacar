package com.third.rent.user.notice.model;

import java.sql.Timestamp;

public class UserNoticeVO {
	private int unoticeNo;
	private String unoticeTitle;
	private String unoticeContent;
	private String adminId;
	private Timestamp unoticeRegdate;
	private Character unoticeVisible;
	private int unoticeReadcount;
	private Timestamp unoticeDeldate;
	
	public int getUnoticeNo() {
		return unoticeNo;
	}
	
	public void setUnoticeNo(int unoticeNo) {
		this.unoticeNo = unoticeNo;
	}
	
	public String getUnoticeTitle() {
		return unoticeTitle;
	}
	
	public void setUnoticeTitle(String unoticeTitle) {
		this.unoticeTitle = unoticeTitle;
	}
	
	public String getUnoticeContent() {
		return unoticeContent;
	}
	
	public void setUnoticeContent(String unoticeContent) {
		this.unoticeContent = unoticeContent;
	}
	
	public String getAdminId() {
		return adminId;
	}
	
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	public Timestamp getUnoticeRegdate() {
		return unoticeRegdate;
	}
	
	public void setUnoticeRegdate(Timestamp unoticeRegdate) {
		this.unoticeRegdate = unoticeRegdate;
	}
	
	public Character getUnoticeVisible() {
		return unoticeVisible;
	}
	
	public void setUnoticeVisible(Character unoticeVisible) {
		this.unoticeVisible = unoticeVisible;
	}
	
	public int getUnoticeReadcount() {
		return unoticeReadcount;
	}
	
	public void setUnoticeReadcount(int unoticeReadcount) {
		this.unoticeReadcount = unoticeReadcount;
	}
	
	public Timestamp getUnoticeDeldate() {
		return unoticeDeldate;
	}
	
	public void setUnoticeDeldate(Timestamp unoticeDeldate) {
		this.unoticeDeldate = unoticeDeldate;
	}

	public String toString() {
		return "UserNoticeVO [unoticeNo=" + unoticeNo + ", unoticeTitle=" + unoticeTitle + ", unoticeContent="
				+ unoticeContent + ", adminId=" + adminId + ", unoticeRegdate=" + unoticeRegdate + ", unoticeVisible="
				+ unoticeVisible + ", unoticeReadcount=" + unoticeReadcount + ", unoticeDeldate=" + unoticeDeldate
				+ "]";
	}
}
