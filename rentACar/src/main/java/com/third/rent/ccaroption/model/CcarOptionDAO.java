package com.third.rent.ccaroption.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CcarOptionDAO {
	
	public int insertCcarOption(CcarOptionVO vo);
	public List<CcarOptionVO> selectAllCcar();
	public List<Map<String, Object>> selectAllComCar();
	public HashMap<String, Object> selectByCcarId(String ccarid);
}
