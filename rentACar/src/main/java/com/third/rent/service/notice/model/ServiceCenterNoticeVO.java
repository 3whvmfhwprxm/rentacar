package com.third.rent.service.notice.model;

import java.sql.Timestamp;

public class ServiceCenterNoticeVO {
	private int scnoticeNo;
	private String scnoticeTitle;
	private String scnoticeContent;
	private String adminId;
	private Timestamp scnoticeRegdate;
	private Character scnoticeVisible;
	private int scnoticeReadcount;
	private Timestamp scnoticeDeldate;
	
	public int getScnoticeNo() {
		return scnoticeNo;
	}
	
	public void setScnoticeNo(int scnoticeNo) {
		this.scnoticeNo = scnoticeNo;
	}
	
	public String getScnoticeTitle() {
		return scnoticeTitle;
	}
	
	public void setScnoticeTitle(String scnoticeTitle) {
		this.scnoticeTitle = scnoticeTitle;
	}
	
	public String getScnoticeContent() {
		return scnoticeContent;
	}
	
	public void setScnoticeContent(String scnoticeContent) {
		this.scnoticeContent = scnoticeContent;
	}
	
	public String getAdminId() {
		return adminId;
	}
	
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	public Timestamp getScnoticeRegdate() {
		return scnoticeRegdate;
	}
	
	public void setScnoticeRegdate(Timestamp scnoticeRegdate) {
		this.scnoticeRegdate = scnoticeRegdate;
	}
	
	public Character getScnoticeVisible() {
		return scnoticeVisible;
	}
	
	public void setScnoticeVisible(Character scnoticeVisible) {
		this.scnoticeVisible = scnoticeVisible;
	}
	
	public int getScnoticeReadcount() {
		return scnoticeReadcount;
	}
	
	public void setScnoticeReadcount(int scnoticeReadcount) {
		this.scnoticeReadcount = scnoticeReadcount;
	}
	
	public Timestamp getScnoticeDeldate() {
		return scnoticeDeldate;
	}
	
	public void setScnoticeDeldate(Timestamp scnoticeDeldate) {
		this.scnoticeDeldate = scnoticeDeldate;
	}

	public String toString() {
		return "ServiceCenterNoticeVO [scnoticeNo=" + scnoticeNo + ", scnoticeTitle=" + scnoticeTitle
				+ ", scnoticeContent=" + scnoticeContent + ", adminId=" + adminId + ", scnoticeRegdate="
				+ scnoticeRegdate + ", scnoticeVisible=" + scnoticeVisible + ", scnoticeReadcount=" + scnoticeReadcount
				+ ", scnoticeDeldate=" + scnoticeDeldate + "]";
	}
}
