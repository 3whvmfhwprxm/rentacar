package com.third.rent.ccaroption.model;

import java.util.List;
import java.util.Map;

import com.third.rent.car.model.CarVO;

//예약 가능 차량 검색 결과에서 사용
public class CarAllVO {
	private CarVO carVo;	//1:1 관계 처리	
	private List<Map<String, Object>> companyCarList;
	
	public CarVO getCarVo() {
		return carVo;
	}
	public void setCarVo(CarVO carVo) {
		this.carVo = carVo;
	}
	public List<Map<String, Object>> getCompanyCarList() {
		return companyCarList;
	}
	public void setCompanyCarList(List<Map<String, Object>> companyCarList) {
		this.companyCarList = companyCarList;
	}
	
	@Override
	public String toString() {
		return "CarAllVO [carVo=" + carVo + ", companyCarList=" + companyCarList + "]";
	}
}
