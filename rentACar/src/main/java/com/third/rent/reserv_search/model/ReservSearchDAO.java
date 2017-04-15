package com.third.rent.reserv_search.model;

import java.util.HashMap;
import java.util.List;

import com.third.rent.ccaroption.model.CcarOptionVO;

public interface ReservSearchDAO {
	public List<CcarOptionVO> searchNormal(HashMap<String, Object> map);
}
