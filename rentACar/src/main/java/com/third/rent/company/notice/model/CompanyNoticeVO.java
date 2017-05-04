package com.third.rent.company.notice.model;

import java.sql.Timestamp;

public class CompanyNoticeVO {
	private int cnoticeNo;
	private String cnoticeTitle;
	private String cnoticeContent;
	private String adminId;
	private Timestamp cnoticeRegdate;
	private String cnoticeVisible;
	private int cnoticeReadcount;
	private Timestamp cnoticeDeldate;
	
	public int getCnoticeNo() {
		return cnoticeNo;
	}
	
	public void setCnoticeNo(int cnoticeNo) {
		this.cnoticeNo = cnoticeNo;
	}
	
	public String getCnoticeTitle() {
		return cnoticeTitle;
	}
	
	public void setCnoticeTitle(String cnoticeTitle) {
		this.cnoticeTitle = cnoticeTitle;
	}
	
	public String getCnoticeContent() {
		return cnoticeContent;
	}
	
	public void setCnoticeContent(String cnoticeContent) {
		this.cnoticeContent = cnoticeContent;
	}
	
	public String getAdminId() {
		return adminId;
	}
	
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	public Timestamp getCnoticeRegdate() {
		return cnoticeRegdate;
	}
	
	public void setCnoticeRegdate(Timestamp cnoticeRegdate) {
		this.cnoticeRegdate = cnoticeRegdate;
	}
	
	public String getCnoticeVisible() {
		return cnoticeVisible;
	}
	
	public void setCnoticeVisible(String cnoticeVisible) {
		this.cnoticeVisible = cnoticeVisible;
	}
	
	public int getCnoticeReadcount() {
		return cnoticeReadcount;
	}
	
	public void setCnoticeReadcount(int cnoticeReadcount) {
		this.cnoticeReadcount = cnoticeReadcount;
	}
	
	public Timestamp getCnoticeDeldate() {
		return cnoticeDeldate;
	}
	
	public void setCnoticeDeldate(Timestamp cnoticeDeldate) {
		this.cnoticeDeldate = cnoticeDeldate;
	}

	public String toString() {
		return "CompanyNoticeVO [cnoticeNo=" + cnoticeNo + ", cnoticeTitle=" + cnoticeTitle + ", cnoticeContent="
				+ cnoticeContent + ", adminId=" + adminId + ", cnoticeRegdate=" + cnoticeRegdate + ", cnoticeVisible="
				+ cnoticeVisible + ", cnoticeReadcount=" + cnoticeReadcount + ", cnoticeDeldate=" + cnoticeDeldate
				+ "]";
	}
}
