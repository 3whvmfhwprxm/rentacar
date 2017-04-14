package com.third.rent.admin_LogState.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.admin.model.AdminVO;

@Repository
public class admin_LogDAOMybatis extends SqlSessionDaoSupport
	implements admin_LogDAO{

	private String namespace="config.mybatis.mapper.oracle.admin_LogState";

	public int insertAdmin(AdminVO vo) {
		return getSqlSession().insert(namespace+".insertAdmin", vo);
	}

	public int duplicateUserid(String adminid) {
		return getSqlSession().selectOne(namespace+".duplicateAdminId", adminid);
	}

	public String selectPwd(String adminid) {
		return getSqlSession().selectOne(namespace+".selectPwdByAdminId", adminid);
	}

	public AdminVO selectByAdminId(String adminid) {
		return getSqlSession().selectOne(namespace+".selectByAdminId", adminid);
	}

	public int updateAdmin(AdminVO vo) {
		return getSqlSession().update(namespace+".updateAdmin", vo);
	}

	public int withdrawAdmin(String adminid) {
		return getSqlSession().update(namespace+".withdrawAdmin", adminid);
	}
	
}











