package com.third.rent.car.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CarServiceImpl implements CarService{

	@Autowired
	private CarDAO carDao;
	
	@Override
	public List<CarVO> selectAllCar() {
		return carDao.selectAllCar();
	}
}
