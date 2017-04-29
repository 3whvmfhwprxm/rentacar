package com.third.rent.payInfo.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class PayInfoDAOmyBatis extends SqlSessionDaoSupport implements PayInfoDAO{

	private String nameSpace="config.mybatis.mapper.oracle.payInfo";
	
	@Override
	public List<PayInfoVO> selectPayInfo(PayInfoVO pInfo) {
		return getSqlSession().selectList(nameSpace+".selectPayInfo", pInfo);
	}

	@Override
	public int selectTotalRecordPayInfo(PayInfoVO pInfo) {
		return getSqlSession().selectOne(nameSpace+".selectTotalRecordfromPayInfo", pInfo);
	}
	
}
