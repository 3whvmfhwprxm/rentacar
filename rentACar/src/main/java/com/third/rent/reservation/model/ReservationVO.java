package com.third.rent.reservation.model;

import java.sql.Timestamp;
import java.util.Date;

public class ReservationVO {
	private String reservNum;/* 예약번호 */
	private String userTel1;/* 회원전화번호1 */
	private String userTel2;/* 회원전화번호2 */
	private String userTel3;/* 회원전화번호3 */
	private String reservStartDate;/* 대여시작일 */
	private String reservStartTime;/* 대여시작시간 */
	private String reservEndDate;/* 반납일 */
	private String reservEndTime;/* 반납시간 */
	private String ccarCarId;/* 업체보유차량 */
	private String reservInsurance;/* 보험여부 */
	private Timestamp reservDate;/* 예약일시 */
	private Timestamp reservCancel;/* 예약취소일시 */
	private String reservCancelWhy;/* 예약취소사유 */
	private String userId;/* 회원아이디 */
	
	public String getReservNum() {
		return reservNum;
	}
	public void setReservNum(String reservNum) {
		this.reservNum = reservNum;
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
	public String getReservStartDate() {
		return reservStartDate;
	}
	public void setReservStartDate(String reservStartDate) {
		this.reservStartDate = reservStartDate;
	}
	public String getReservStartTime() {
		return reservStartTime;
	}
	public void setReservStartTime(String reservStartTime) {
		this.reservStartTime = reservStartTime;
	}
	public String getReservEndDate() {
		return reservEndDate;
	}
	public void setReservEndDate(String reservEndDate) {
		this.reservEndDate = reservEndDate;
	}
	public String getReservEndTime() {
		return reservEndTime;
	}
	public void setReservEndTime(String reservEndTime) {
		this.reservEndTime = reservEndTime;
	}
	public String getCcarCarId() {
		return ccarCarId;
	}
	public void setCcarCarId(String ccarCarId) {
		this.ccarCarId = ccarCarId;
	}
	public String getReservInsurance() {
		return reservInsurance;
	}
	public void setReservInsurance(String reservInsurance) {
		this.reservInsurance = reservInsurance;
	}
	public Timestamp getReservDate() {
		return reservDate;
	}
	public void setReservDate(Timestamp reservDate) {
		this.reservDate = reservDate;
	}
	public Timestamp getReservCancel() {
		return reservCancel;
	}
	public void setReservCancel(Timestamp reservCancel) {
		this.reservCancel = reservCancel;
	}
	public String getReservCancelWhy() {
		return reservCancelWhy;
	}
	public void setReservCancelWhy(String reservCancelWhy) {
		this.reservCancelWhy = reservCancelWhy;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "ReservationVO [reservNum=" + reservNum + ", userTel1=" + userTel1 + ", userTel2=" + userTel2
				+ ", userTel3=" + userTel3 + ", reservStartDate=" + reservStartDate + ", reservStartTime="
				+ reservStartTime + ", reservEndDate=" + reservEndDate + ", reservEndTime=" + reservEndTime
				+ ", ccarCarId=" + ccarCarId + ", reservInsurance=" + reservInsurance + ", reservDate=" + reservDate
				+ ", reservCancel=" + reservCancel + ", reservCancelWhy=" + reservCancelWhy + ", userId=" + userId
				+ "]";
	}
	
	
}
