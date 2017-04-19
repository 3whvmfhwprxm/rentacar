package com.third.rent.admin_Mng.Model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.admin.model.AdminVO;
import com.third.rent.common.SearchVO;

@Repository
public class AdminMngDAOmyBatis extends SqlSessionDaoSupport implements AdminMngDAO{

	private String namespace="config.mybatis.mapper.oracle.admin_mng";
	
	@Override
	public int insertAdmin(AdminVO avo) {
		return getSqlSession().insert(namespace+".insertAdmin", avo);
	}

	@Override
	public int updateAdmin(AdminVO avo) {
		return getSqlSession().update(namespace+".updateAdmin", avo);
	}

	@Override
	public int updateAdminOutdate(String adminId) {
		return getSqlSession().update(namespace+".updateOutdate", adminId);
	}

	@Override
	public List<AdminVO> selectAdmins(SearchVO svo) {
		return getSqlSession().selectList(namespace+".selectAdmin", svo);
	}

	@Override
	public int countAdmin(SearchVO svo) {
		return getSqlSession().selectOne(namespace+".selectAdminCount", svo);
	}

	@Override
	public AdminVO selectOneAdmin(String adminId) {
		return getSqlSession().selectOne(namespace+".selectOneAdmin", adminId);
	}	
}
