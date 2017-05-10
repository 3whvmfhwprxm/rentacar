package com.third.rent.admin_HighChart.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.highcharts.model.DateVO;

@Service
public class Admin_HighChartServiceImpl implements Admin_HighChartService {
	@Autowired
	private Admin_HighChartDAO adminHighChartDao;
	
	@Override
	public List<Map<String, Object>> totalPayByMonth(DateVO dateVo) {
		return adminHighChartDao.totalPayByMonth(dateVo);
	}
	
}
