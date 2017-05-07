package com.third.rent.admin_Sales.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.common.DateSearchVO2;

@Repository
public class SalesDAOmyBatis extends SqlSessionDaoSupport implements SalesDAO{

	private String nameSpace="config.mybatis.mapper.oracle.sales";
	
	@Override
	public List<Map<String, Object>> selectSalesByDate(DateSearchVO2 dateSearchVO) {
		return getSqlSession().selectList(nameSpace+".selectSalesByDate", dateSearchVO);
	}

	@Override
	public List<Map<String, Object>> selectSalesByMonth(DateSearchVO2 dateSearchVO) {
		return getSqlSession().selectList(nameSpace+".selectSalesByMonth", dateSearchVO);
	}

	@Override
	public List<Map<String, Object>> selectSalesByTerm(DateSearchVO2 dateSearchVO) {
		return getSqlSession().selectList(nameSpace+".selectSalesByTerm", dateSearchVO);
	}	
	
	
}
