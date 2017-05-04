package com.third.rent.highcharts.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class HighchartsMybatis extends SqlSessionDaoSupport
	implements HighchartsDAO{
	
	private String namespace="config.mybatis.mapper.oracle.admin_HighChartUser";

	@Override
	public List<Map<String, Object>> selectSalesByDay(DateVO dateVo) {
		return getSqlSession().selectList(namespace+".selectSalesByDay", dateVo);
	}

	@Override
	public List<Map<String, Object>> selectSalesByMonth(DateVO dateVo) {
		return getSqlSession().selectList(namespace+".selectSalesByMonth", dateVo);
	}
	
}
