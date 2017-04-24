package com.third.rent.ccaroption.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.third.rent.common.SearchVO;

public interface CcarOptionDAO {
	
	public int insertCcarOption(CcarOptionVO vo);
	public List<CcarOptionVO> selectAllCcar();
	public List<Map<String, Object>> selectAllComCar(SearchVO searchVo);
	public HashMap<String, Object> selectByCcarId(String ccarid);
	public int selectTotalRecord(SearchVO searchVo);
	public int updateCarOption(CcarOptionVO vo);
	public int deleteCarOption(CcarOptionVO vo);
	public int checkCarId(String ccarCarId);
}
