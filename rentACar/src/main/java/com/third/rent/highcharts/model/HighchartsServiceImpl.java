package com.third.rent.highcharts.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HighchartsServiceImpl implements HighchartsService{
	@Autowired
	private HighchartsDAO highchartsDao;

	@Override
	public List<Map<String, Object>> selectSalesByDay(DateVO dateVo) {
		return highchartsDao.selectSalesByDay(dateVo);
	}

	@Override
	public List<Map<String, Object>> selectSalesByMonth(DateVO dateVo) {
		return highchartsDao.selectSalesByMonth(dateVo);
	}
	
	

}
