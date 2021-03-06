package com.third.rent.counselor.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CounselDAOBatis extends SqlSessionDaoSupport implements CounselDAO{
	
	private String namespace = "config.mybatis.mapper.oracle.counsel";

	@Override
	public CounselVO counselInsert(int counselId) {
		return getSqlSession().selectOne(namespace+".counselSelect",counselId);
	}
		

}


