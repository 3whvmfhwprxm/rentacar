package com.third.rent.payInfo.model;

import com.third.rent.common.SearchVO;

public class PayInfoVO extends SearchVO{
	private String payNo; /* 결제번호 */
	private String reservNum; /* 예약번호 */
	private String userTel1; /* 회원전화번호1 */
	private String userTel2; /* 회원전화번호2 */
	private String userTel3; /* 회원전화번호3 */
	private String payMethod; /* 결제방법 */
	private int payMoney; /* 결제금액 */
	private int payDiscount; /* 할인금액 */
	private String payRegdate; /* 결제일시 */
	private String payCondition; /* 진행상태 */
	
	public String getPayNo() {
		return payNo;
	}
	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}
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
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(int payMoney) {
		this.payMoney = payMoney;
	}
	public int getPayDiscount() {
		return payDiscount;
	}
	public void setPayDiscount(int payDiscount) {
		this.payDiscount = payDiscount;
	}
	public String getPayRegdate() {
		return payRegdate;
	}
	public void setPayRegdate(String payRegdate) {
		this.payRegdate = payRegdate;
	}
	public String getPayCondition() {
		return payCondition;
	}
	public void setPayCondition(String payCondition) {
		this.payCondition = payCondition;
	}
	
	@Override
	public String toString() {
		return "PayInfoVO [payNo=" + payNo + ", reservNum=" + reservNum + ", userTel1=" + userTel1 + ", userTel2="
				+ userTel2 + ", userTel3=" + userTel3 + ", payMethod=" + payMethod + ", payMoney=" + payMoney
				+ ", payDiscount=" + payDiscount + ", payRegdate=" + payRegdate + ", payCondition=" + payCondition
				+ ", toString()=" + super.toString() + "]";
	}
	
}
