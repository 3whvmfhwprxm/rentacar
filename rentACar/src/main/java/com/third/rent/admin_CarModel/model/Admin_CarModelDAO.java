package com.third.rent.admin_CarModel.model;


import java.util.List;

import com.third.rent.car.model.CarVO;
import com.third.rent.common.SearchVO;

public interface Admin_CarModelDAO {
	public int insertCarModel(CarVO carVo);
	
	public List<CarVO> selectAll(SearchVO searchVo);
	
	public CarVO selectByCarCode(String carCode);
	
	public int updateCarModel(CarVO vo);
	
	public int deleteCarModel(String carCode);
	
	public int selectTotalRecord(SearchVO searchVo);
	
}
