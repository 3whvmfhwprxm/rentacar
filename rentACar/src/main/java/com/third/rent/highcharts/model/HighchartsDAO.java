package com.third.rent.highcharts.model;

import java.util.List;
import java.util.Map;

public interface HighchartsDAO {
	public List<Map<String, Object>> selectSalesByDay(DateVO dateVo);
	
	public List<Map<String, Object>> selectSalesByMonth(DateVO dateVo);
	
	public List<Map<String, Object>> selectSumTotalPay();
}
