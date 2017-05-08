package com.third.rent.admin_balCalc.model;

public class BalCalcVO {
	private String balNum; /* 정산번호 */
	private String comId; /* 업체아이디 */
	private int balReservCnt; /* 예약건수 */
	private String balTargetDate; /* 정산대상년월 */
	private int balSales; /* 매출금액 */
	private int balCommission; /* 정산금액(수수료) */
	private String balDecisionDate; /* 정산일 */
	
	private String year;	//대상년
	private String month;	//대상월
	
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getBalNum() {
		return balNum;
	}
	public void setBalNum(String balNum) {
		this.balNum = balNum;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public int getBalReservCnt() {
		return balReservCnt;
	}
	public void setBalReservCnt(int balReservCnt) {
		this.balReservCnt = balReservCnt;
	}
	public String getBalTargetDate() {
		return balTargetDate;
	}
	public void setBalTargetDate(String balTargetDate) {
		this.balTargetDate = balTargetDate;
	}
	public int getBalSales() {
		return balSales;
	}
	public void setBalSales(int balSales) {
		this.balSales = balSales;
	}
	public int getBalCommission() {
		return balCommission;
	}
	public void setBalCommission(int balCommission) {
		this.balCommission = balCommission;
	}
	public String getBalDecisionDate() {
		return balDecisionDate;
	}
	public void setBalDecisionDate(String balDecisionDate) {
		this.balDecisionDate = balDecisionDate;
	}
	
	@Override
	public String toString() {
		return "BalCalcVO [balNum=" + balNum + ", comId=" + comId + ", balReservCnt=" + balReservCnt
				+ ", balTargetDate=" + balTargetDate + ", balSales=" + balSales + ", balCommission=" + balCommission
				+ ", balDecisionDate=" + balDecisionDate + ", year=" + year + ", month=" + month + "]";
	}	
	
}
