package com.third.rent.admin_Company.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.common.SearchVO;
import com.third.rent.company.model.CompanyVO;

@Repository
public class Admin_CompanyDAOmyBatis extends SqlSessionDaoSupport
	implements Admin_CompanyDAO{
	
private String namespace="config.mybatis.mapper.oracle.admin_Company";
	
	public List<CompanyVO> selectAllCompany(SearchVO searchVo){
		List<CompanyVO> companyList
			=getSqlSession().selectList(namespace+".selectAllCompany", searchVo);

		return companyList;
	}
	
	public int selectTotalRecord(SearchVO searchVo){
		return getSqlSession().selectOne(namespace+".selectTotalRecord", searchVo);
	}
	
	public CompanyVO selectByComId(String comId){
		CompanyVO companyVo = getSqlSession().selectOne(namespace+".selectByComId", comId);
		
		return companyVo;
	}

	public int updateCompany(CompanyVO companyVo) {
		return getSqlSession().update(namespace+".updateCompany", companyVo);
	}

	public String selectPwd(String adminPwd) {
		return getSqlSession().selectOne(namespace+".selectPwd", adminPwd);
	}

	public int insertCompany(CompanyVO companyVo) {
		return getSqlSession().insert(namespace+".insertCompany", companyVo);
	}

}
