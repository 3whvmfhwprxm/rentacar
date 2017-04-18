package com.third.rent.ccaroption.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CcarOptionService {
	public int insertCcarOption(CcarOptionVO vo);
	public List<Map<String, Object>> selectAllComCar();
	public HashMap<String, Object> selectByCcarId(String ccarid);
}
