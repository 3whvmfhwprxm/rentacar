package com.third.rent.admin_CarModel.model;

import java.util.List;

import com.third.rent.car.model.CarVO;
import com.third.rent.common.SearchVO;

public interface Admin_CarModelService {
	public static final int EXIST_ID=1;
	public static final int NONE_EXIST_ID=2;
	
	public static final int LOGIN_OK=1;
	public static final int ID_NONE=2;
	public static final int PWD_DISAGREE=3;
	
	public int insertCarModel(CarVO carVo);
	
	public List<CarVO> selectAll(SearchVO searchVo);
	
	public CarVO selectByCarCode(String carCode);
	
	public int updateCarModel(CarVO vo);
	
	public int deleteCarModel(String carCode);
	
	public int selectTotalRecord(SearchVO searchVo);
}
