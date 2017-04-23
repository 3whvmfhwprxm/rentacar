package com.third.rent.car.model;

public class CarCategoryVO {
	private int carCategoryNum;
	private String carCategoryName;
	
	public int getCarCategoryNum() {
		return carCategoryNum;
	}
	public void setCarCategoryNum(int carCategoryNum) {
		this.carCategoryNum = carCategoryNum;
	}
	public String getCarCategoryName() {
		return carCategoryName;
	}
	public void setCarCategoryName(String carCategoryName) {
		this.carCategoryName = carCategoryName;
	}
	
	@Override
	public String toString() {
		return "CarCategoryVO [carCategoryNum=" + carCategoryNum + ", carCategoryName=" + carCategoryName + "]";
	}
	
}
