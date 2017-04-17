package com.third.rent.ccaroption.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CcarOptionServiceImpl implements CcarOptionService {

	@Autowired
	private CcarOptionDAO ccarOptionDao;
	
	@Override
	public int insertCcarOption(CcarOptionVO vo) {
		return ccarOptionDao.insertCcarOption(vo);
	}

	@Override
	public List<Map<String, Object>> selectAllComCar() {
		return ccarOptionDao.selectAllComCar();
	}

	@Override
	public HashMap<String, Object> selectByCcarId(String ccarid) {
		return ccarOptionDao.selectByCcarId(ccarid);
	}

	
	

}
