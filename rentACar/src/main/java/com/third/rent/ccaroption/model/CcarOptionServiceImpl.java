package com.third.rent.ccaroption.model;

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

}
