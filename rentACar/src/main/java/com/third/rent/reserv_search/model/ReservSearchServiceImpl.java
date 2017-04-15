package com.third.rent.reserv_search.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.ccaroption.model.CcarOptionVO;

@Service
public class ReservSearchServiceImpl implements ReservSearchService{

	@Autowired
	private ReservSearchDAO dao;
	
	@Override
	public List<CcarOptionVO> searchNormal(HashMap<String, Object> map) {
		return dao.searchNormal(map);
	}

}
