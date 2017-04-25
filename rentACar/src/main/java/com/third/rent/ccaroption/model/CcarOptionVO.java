package com.third.rent.ccaroption.model;

import java.sql.Timestamp;

public class CcarOptionVO {
	private String ccarCarId; 			/* 업체보유차량 변경--> 차량고유번호 */
	private String carCode;  			/* 모델코드 */
	private String comId;  				/* 업체아이디 */
	private String ccarUseYn;  			/* 차량사용가능여부 */
	private String carFuel;				/* 차량 연료 타입 */
	private String ccarBlackboxYn;  	/* 블랙박스유무 */
	private String ccarSmokeYn;  		/* 금연차량 */
	private String ccarRearCameraYn;	/* 후방카메라 */
	private String ccarRearSenceYn; 	/* 후방센서 */
	private String ccarNaviYn;  		/* 네비게이션 */
	private String ccarSunRoofYn;  		/* 썬루프 */
	private String ccarBluetoothYn; 	/* 블루투스 */
	private String ccarAuxYn;  			/* AUX */
	private String ccarSmartkeyYn;  	/* 스마트키 */
	private int ccarRentalcount; 		/* 차량대여횟수 */
	private int ccarNormalPrice;  		/* 평일예약가격 */
	private int ccarWeekendPrice; 		/* 주말예약가격 */
	private int ccarPeakPrice;  		/* 성수기예약가격 */
	private int ccarSPeakPrice; 		/* 극성수기예약가격 */
	private int ccarArrear; 			/* 연체료(표기용) */
	private Timestamp comcarRegdate;  	/* 차량등록일 */
	private Timestamp comcarOutdate;	/* 차량삭제일 */
	
	public String getCcarCarId() {
		return ccarCarId;
	}
	public void setCcarCarId(String ccarCarId) {
		this.ccarCarId = ccarCarId;
	}
	public String getCarCode() {
		return carCode;
	}
	public void setCarCode(String carCode) {
		this.carCode = carCode;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getCcarUseYn() {
		return ccarUseYn;
	}
	public void setCcarUseYn(String ccarUseYn) {
		this.ccarUseYn = ccarUseYn;
	}
	
	public String getCarFuel() {
		return carFuel;
	}
	public void setCarFuel(String carFuel) {
		this.carFuel = carFuel;
	}
	public String getCcarBlackboxYn() {
		return ccarBlackboxYn;
	}
	public void setCcarBlackboxYn(String ccarBlackboxYn) {
		this.ccarBlackboxYn = ccarBlackboxYn;
	}
	public String getCcarSmokeYn() {
		return ccarSmokeYn;
	}
	public void setCcarSmokeYn(String ccarSmokeYn) {
		this.ccarSmokeYn = ccarSmokeYn;
	}
	public String getCcarRearCameraYn() {
		return ccarRearCameraYn;
	}
	public void setCcarRearCameraYn(String ccarRearCameraYn) {
		this.ccarRearCameraYn = ccarRearCameraYn;
	}
	public String getCcarRearSenceYn() {
		return ccarRearSenceYn;
	}
	public void setCcarRearSenceYn(String ccarRearSenceYn) {
		this.ccarRearSenceYn = ccarRearSenceYn;
	}
	public String getCcarNaviYn() {
		return ccarNaviYn;
	}
	public void setCcarNaviYn(String ccarNaviYn) {
		this.ccarNaviYn = ccarNaviYn;
	}
	public String getCcarSunRoofYn() {
		return ccarSunRoofYn;
	}
	public void setCcarSunRoofYn(String ccarSunRoofYn) {
		this.ccarSunRoofYn = ccarSunRoofYn;
	}
	public String getCcarBluetoothYn() {
		return ccarBluetoothYn;
	}
	public void setCcarBluetoothYn(String ccarBluetoothYn) {
		this.ccarBluetoothYn = ccarBluetoothYn;
	}
	public String getCcarAuxYn() {
		return ccarAuxYn;
	}
	public void setCcarAuxYn(String ccarAuxYn) {
		this.ccarAuxYn = ccarAuxYn;
	}
	public String getCcarSmartkeyYn() {
		return ccarSmartkeyYn;
	}
	public void setCcarSmartkeyYn(String ccarSmartkeyYn) {
		this.ccarSmartkeyYn = ccarSmartkeyYn;
	}
	public int getCcarRentalcount() {
		return ccarRentalcount;
	}
	public void setCcarRentalcount(int ccarRentalcount) {
		this.ccarRentalcount = ccarRentalcount;
	}
	public int getCcarNormalPrice() {
		return ccarNormalPrice;
	}
	public void setCcarNormalPrice(int ccarNormalPrice) {
		this.ccarNormalPrice = ccarNormalPrice;
	}
	public int getCcarWeekendPrice() {
		return ccarWeekendPrice;
	}
	public void setCcarWeekendPrice(int ccarWeekendPrice) {
		this.ccarWeekendPrice = ccarWeekendPrice;
	}
	public int getCcarPeakPrice() {
		return ccarPeakPrice;
	}
	public void setCcarPeakPrice(int ccarPeakPrice) {
		this.ccarPeakPrice = ccarPeakPrice;
	}
	public int getCcarSPeakPrice() {
		return ccarSPeakPrice;
	}
	public void setCcarSPeakPrice(int ccarSPeakPrice) {
		this.ccarSPeakPrice = ccarSPeakPrice;
	}
	public int getCcarArrear() {
		return ccarArrear;
	}
	public void setCcarArrear(int ccarArrear) {
		this.ccarArrear = ccarArrear;
	}
	public Timestamp getComcarRegdate() {
		return comcarRegdate;
	}
	public void setComcarRegdate(Timestamp comcarRegdate) {
		this.comcarRegdate = comcarRegdate;
	}
	public Timestamp getComcarOutdate() {
		return comcarOutdate;
	}
	public void setComcarOutdate(Timestamp comcarOutdate) {
		this.comcarOutdate = comcarOutdate;
	}
	@Override
	public String toString() {
		return "CcarOptionVO [ccarCarId=" + ccarCarId + ", carCode=" + carCode + ", comId=" + comId + ", ccarUseYn="
				+ ccarUseYn + ", carFuel=" + carFuel + ", ccarBlackboxYn=" + ccarBlackboxYn + ", ccarSmokeYn="
				+ ccarSmokeYn + ", ccarRearCameraYn=" + ccarRearCameraYn + ", ccarRearSenceYn=" + ccarRearSenceYn
				+ ", ccarNaviYn=" + ccarNaviYn + ", ccarSunRoofYn=" + ccarSunRoofYn + ", ccarBluetoothYn="
				+ ccarBluetoothYn + ", ccarAuxYn=" + ccarAuxYn + ", ccarSmartkeyYn=" + ccarSmartkeyYn
				+ ", ccarRentalcount=" + ccarRentalcount + ", ccarNormalPrice=" + ccarNormalPrice
				+ ", ccarWeekendPrice=" + ccarWeekendPrice + ", ccarPeakPrice=" + ccarPeakPrice + ", ccarSPeakPrice="
				+ ccarSPeakPrice + ", ccarArrear=" + ccarArrear + ", comcarRegdate=" + comcarRegdate
				+ ", comcarOutdate=" + comcarOutdate + "]";
	}
	
	
	
	
}




