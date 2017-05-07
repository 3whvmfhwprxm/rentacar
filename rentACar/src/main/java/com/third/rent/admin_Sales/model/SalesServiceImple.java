package com.third.rent.admin_Sales.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.common.DateSearchVO2;

@Service
public class SalesServiceImple implements SalesService{

	@Autowired
	private SalesDAO sdao;
	
	@Override
	public List<Map<String, Object>> selectSalesByDate(DateSearchVO2 dateSearchVO) {
		return sdao.selectSalesByDate(dateSearchVO);
	}

	@Override
	public List<Map<String, Object>> selectSalesByMonth(DateSearchVO2 dateSearchVO) {
		return sdao.selectSalesByMonth(dateSearchVO);
	}

	@Override
	public List<Map<String, Object>> selectSalesByTerm(DateSearchVO2 dateSearchVO) {
		return sdao.selectSalesByTerm(dateSearchVO);
	}
	
	
}
