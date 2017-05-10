package com.third.rent.admin_HighChart.model;

import java.util.List;
import java.util.Map;

import com.third.rent.highcharts.model.DateVO;

public interface Admin_HighChartDAO {
	public List<Map<String, Object>> totalPayByMonth(DateVO dateVo);
}
