package com.third.rent.admin_HighChart.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.highcharts.model.DateVO;

@Repository
public class Admin_HighChartDAOmyBatis extends SqlSessionDaoSupport
	implements Admin_HighChartDAO {
	
	private String namespace = "config.mybatis.mapper.oracle.admin_HighChart";

	@Override
	public List<Map<String, Object>> totalPayByMonth(DateVO dateVo) {
		return getSqlSession().selectList(namespace+".totalPayByMonth", dateVo);
	}
		
}
