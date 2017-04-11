package com.third.rent.car.model;

import java.sql.Timestamp;

public class CarVO {
	private String carCode; 		 /* 모델코드 */
	private String carName; 		 /* 모델명 */
	private String carInc; 			 /* 제조사 */
	private String carFuel; 		 /* 연료 */
	private int carSize; 			 /* 승차인원 */
	private Timestamp carYear;  	 /* 출시년도 */
	private String carTrans;		 /* 변속기 */
	private Timestamp carRegdate;  	 /* 등록일 */
	private String carType; 		 /* 차량유형 */
	private String carImg1; 		 /* 이미지1 */
	private String carImg2; 		 /* 이미지2 */
	private String carImg3;			 /* 이미지3 */
	public String getCarCode() {
		return carCode;
	}
	public void setCarCode(String carCode) {
		this.carCode = carCode;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarInc() {
		return carInc;
	}
	public void setCarInc(String carInc) {
		this.carInc = carInc;
	}
	public String getCarFuel() {
		return carFuel;
	}
	public void setCarFuel(String carFuel) {
		this.carFuel = carFuel;
	}
	public int getCarSize() {
		return carSize;
	}
	public void setCarSize(int carSize) {
		this.carSize = carSize;
	}
	public Timestamp getCarYear() {
		return carYear;
	}
	public void setCarYear(Timestamp carYear) {
		this.carYear = carYear;
	}
	public String getCarTrans() {
		return carTrans;
	}
	public void setCarTrans(String carTrans) {
		this.carTrans = carTrans;
	}
	public Timestamp getCarRegdate() {
		return carRegdate;
	}
	public void setCarRegdate(Timestamp carRegdate) {
		this.carRegdate = carRegdate;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public String getCarImg1() {
		return carImg1;
	}
	public void setCarImg1(String carImg1) {
		this.carImg1 = carImg1;
	}
	public String getCarImg2() {
		return carImg2;
	}
	public void setCarImg2(String carImg2) {
		this.carImg2 = carImg2;
	}
	public String getCarImg3() {
		return carImg3;
	}
	public void setCarImg3(String carImg3) {
		this.carImg3 = carImg3;
	}
	
	@Override
	public String toString() {
		return "CarVO [carCode=" + carCode + ", carName=" + carName + ", carInc=" + carInc + ", carFuel=" + carFuel
				+ ", carSize=" + carSize + ", carYear=" + carYear + ", carTrans=" + carTrans + ", carRegdate="
				+ carRegdate + ", carType=" + carType + ", carImg1=" + carImg1 + ", carImg2=" + carImg2 + ", carImg3="
				+ carImg3 + "]";
	}
	
	
}
