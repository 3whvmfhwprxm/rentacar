package com.third.rent.admin_Sales.model;

import java.util.List;
import java.util.Map;

import com.third.rent.common.DateSearchVO2;

public interface SalesService {
	public List<Map<String, Object>> selectSalesByDate(DateSearchVO2 dateSearchVO);
	public List<Map<String, Object>> selectSalesByMonth(DateSearchVO2 dateSearchVO);
	public List<Map<String, Object>> selectSalesByTerm(DateSearchVO2 dateSearchVO);
}
