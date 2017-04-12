package com.third.rent.user.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOMybatis extends SqlSessionDaoSupport implements UserDAO{
	private String namespace="config.mybatis.mapper.oracle.user";
	
	public int insertUser(UserVO vo){
		return getSqlSession().insert(namespace+".insertUser", vo);
	}

	public int duplicateUserid(String userId) {
		return getSqlSession().selectOne(namespace+".duplicateUserid", userId);
	}
	
	public UserVO selectByUserid(String userId){
		return getSqlSession().selectOne(namespace+".selectByUserid", userId);
	}
	
	public String selectPwd(String userId) {
		return getSqlSession().selectOne(namespace+".selectPwdByUserid", userId);
	}
	
}
