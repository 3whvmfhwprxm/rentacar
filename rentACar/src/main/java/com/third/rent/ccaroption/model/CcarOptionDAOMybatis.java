package com.third.rent.ccaroption.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.jdbc.core.metadata.GenericTableMetaDataProvider;
import org.springframework.stereotype.Repository;

@Repository
public class CcarOptionDAOMybatis extends SqlSessionDaoSupport
	implements CcarOptionDAO{

	private String namespace="config.mybatis.mapper.oracle.company";
	
	@Override
	public int insertCcarOption(CcarOptionVO vo){ 
		return getSqlSession().insert(namespace+".insertCcarOption", vo);
	}

	@Override
	public List<CcarOptionVO> selectAllCcar() {
		return getSqlSession().selectList(namespace+".selectCompanyCO");
	}
	
	
}
