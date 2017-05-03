package com.third.rent.admin.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMybatis extends SqlSessionDaoSupport
	implements AdminDAO{
	private String namespace="config.mybatis.mapper.oracle.admin_Main";

	@Override
	public int selectCountUser() {
		return getSqlSession().selectOne(namespace+".selectCountUser");
	}

	@Override
	public int selectCountCompany() {
		return getSqlSession().selectOne(namespace+".selectCountCompany");
	}

	@Override
	public int selectCountReservation() {
		return getSqlSession().selectOne(namespace+".selectCountReservation");
	}

	@Override
	public int selectCountPayinfo() {
		return getSqlSession().selectOne(namespace+".selectCountPayinfo");
	}

	@Override
	public List<Map<String, Object>> selectSumTotalPay() {
		return getSqlSession().selectList(namespace+".selectSumTotalPay");
	}
	
	
}
