package com.third.rent.company.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDAOMybatis extends SqlSessionDaoSupport 
 implements CompanyDAO{
	
	private String namespace="config.mybatis.mapper.oracle.company";

	@Override
	public int duplicateUserid(String comId) {
		return getSqlSession().selectOne(namespace+".duplicateComId",comId);
	}

	@Override
	public String selectPwd(String comId) {
		return getSqlSession().selectOne(namespace+".selectPwdByComId",comId);
	}

	@Override
	public CompanyVO selectBycomId(String comId) {
		return getSqlSession().selectOne(namespace+".selectByComId",comId);
	}

	@Override
	public int updateCompany(CompanyVO vo) {
		return getSqlSession().update(namespace+".updateCompany",vo);
				
	}

	

}
