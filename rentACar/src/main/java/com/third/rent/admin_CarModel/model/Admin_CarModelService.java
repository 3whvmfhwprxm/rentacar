package com.third.rent.admin_CarModel.model;

import java.util.List;

import com.third.rent.car.model.CarVO;
import com.third.rent.ccaroption.model.CcarOptionVO;
import com.third.rent.common.SearchVO;

public interface Admin_CarModelService {
	public int insertCarModel(CarVO vo);
	
	public List<CarVO> selectAll(SearchVO searchVo);
	
	public CarVO selectByCarCode(String CarCode);
	
	public int updateCarModel(CarVO vo);
	
	public int deleteCarModel(String CarCode);
	
	public int selectTotalRecord(SearchVO searchVo);
	
	public List<CcarOptionVO> selectByComId(String comId);
}
