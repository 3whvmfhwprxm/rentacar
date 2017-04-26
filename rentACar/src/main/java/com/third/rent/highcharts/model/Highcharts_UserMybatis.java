package com.third.rent.highcharts.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.user.model.UserVO;

@Repository
public class Highcharts_UserMybatis extends SqlSessionDaoSupport
	implements Highcharts_UserDAO{
	private String namespace="config.mybatis.mapper.oracle.admin_HighChartUser";

	public List<UserVO> selectAllUserByChart() {
		return getSqlSession().selectList(namespace+".selectAllUserByChart");
	}
	
}
