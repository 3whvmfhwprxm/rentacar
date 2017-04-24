package com.third.rent.admin_CarModel.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.car.model.CarVO;
import com.third.rent.common.SearchVO;

@Service
public class Admin_CarModelServiceImpl implements Admin_CarModelService {

	@Autowired
	private Admin_CarModelDAO adminCarModelDao; 
	
	public int insertCarModel(CarVO carVo) {
		return adminCarModelDao.insertCarModel(carVo);
	}

	public List<CarVO> selectAll(SearchVO searchVo) {
		return adminCarModelDao.selectAll(searchVo);
	}

	public CarVO selectByCarCode(String carCode) {
		return adminCarModelDao.selectByCarCode(carCode);
	}

	public int updateCarModel(CarVO vo) {
		return adminCarModelDao.updateCarModel(vo);
	}

	public int deleteCarModel(String carCode) {
		return adminCarModelDao.deleteCarModel(carCode);
	}

	public int selectTotalRecord(SearchVO searchVo) {
		return adminCarModelDao.selectTotalRecord(searchVo);
	}
}
