package com.third.rent.event.model;

import java.sql.Timestamp;

public class EventVO {
	private int eventNum; 					 /* 이벤트번호 */
	private String eventTitle; 				 /* 이벤트제목 */
	private String eventContent;			 /* 이벤트내용 */
	private String adminId;					 /* 관리자아이디 */
	private Timestamp eventRegdate;			 /* 작성시간 */
	private Timestamp eventStart_date; 	     /* 이벤트시작일 */
	private Timestamp eventEndDate; 		 /* 종료일 */
	private String eventTargetGrade; 	 	 /* 적용회원등급 */
	private String eventImage1; 			 /* 이벤트이미지1 */
	private String eventOriginalImage1; 	 /* 이미지1 오리진 */
	private String eventImage2; 			 /* 이벤트이미지2 */
	private String eventOriginalImage2; 	 /* 이미지2 오리진 */
	private String eventTargetCompany; 		 /* 적용업체 */
	
	public int getEventNum() {
		return eventNum;
	}
	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public Timestamp getEventRegdate() {
		return eventRegdate;
	}
	public void setEventRegdate(Timestamp eventRegdate) {
		this.eventRegdate = eventRegdate;
	}
	public Timestamp getEventStart_date() {
		return eventStart_date;
	}
	public void setEventStart_date(Timestamp eventStart_date) {
		this.eventStart_date = eventStart_date;
	}
	public Timestamp getEventEndDate() {
		return eventEndDate;
	}
	public void setEventEndDate(Timestamp eventEndDate) {
		this.eventEndDate = eventEndDate;
	}
	public String getEventTargetGrade() {
		return eventTargetGrade;
	}
	public void setEventTargetGrade(String eventTargetGrade) {
		this.eventTargetGrade = eventTargetGrade;
	}
	public String getEventImage1() {
		return eventImage1;
	}
	public void setEventImage1(String eventImage1) {
		this.eventImage1 = eventImage1;
	}
	public String getEventOriginalImage1() {
		return eventOriginalImage1;
	}
	public void setEventOriginalImage1(String eventOriginalImage1) {
		this.eventOriginalImage1 = eventOriginalImage1;
	}
	public String getEventImage2() {
		return eventImage2;
	}
	public void setEventImage2(String eventImage2) {
		this.eventImage2 = eventImage2;
	}
	public String getEventOriginalImage2() {
		return eventOriginalImage2;
	}
	public void setEventOriginalImage2(String eventOriginalImage2) {
		this.eventOriginalImage2 = eventOriginalImage2;
	}
	public String getEventTargetCompany() {
		return eventTargetCompany;
	}
	public void setEventTargetCompany(String eventTargetCompany) {
		this.eventTargetCompany = eventTargetCompany;
	}
	@Override
	public String toString() {
		return "EventVO [eventNum=" + eventNum + ", eventTitle=" + eventTitle + ", eventContent=" + eventContent
				+ ", adminId=" + adminId + ", eventRegdate=" + eventRegdate + ", eventStart_date=" + eventStart_date
				+ ", eventEndDate=" + eventEndDate + ", eventTargetGrade=" + eventTargetGrade + ", eventImage1="
				+ eventImage1 + ", eventOriginalImage1=" + eventOriginalImage1 + ", eventImage2=" + eventImage2
				+ ", eventOriginalImage2=" + eventOriginalImage2 + ", eventTargetCompany=" + eventTargetCompany + "]";
	}
	
}




