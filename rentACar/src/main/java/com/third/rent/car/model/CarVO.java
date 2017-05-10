package com.third.rent.car.model;

import java.sql.Timestamp;

public class CarVO {
	private String carCode;
	private String carName;
	private String carInc;
	private int carSize;
	private String carTrans;
	private Timestamp carRegdate;
	private String carType;
	private String carImg;
	private String carImg2;
	private String carImg3;

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

	public int getCarSize() {
		return carSize;
	}

	public void setCarSize(int carSize) {
		this.carSize = carSize;
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

	public String getCarImg() {
		return carImg;
	}

	public void setCarImg(String carImg) {
		this.carImg = carImg;
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
		return "CarVO [carCode=" + carCode + ", carName=" + carName + ", carInc=" + carInc + ", carSize=" + carSize
				+ ", carTrans=" + carTrans + ", carRegdate=" + carRegdate + ", carType=" + carType + ", carImg="
				+ carImg + ", carImg2=" + carImg2 + ", carImg3=" + carImg3 + "]";
	}

}
