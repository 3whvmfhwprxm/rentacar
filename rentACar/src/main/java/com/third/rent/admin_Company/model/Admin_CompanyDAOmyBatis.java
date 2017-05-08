package com.third.rent.admin_Company.model;

import java.util.List;
import java.util.Map;

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
	
	public int selectCarTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectCarTotalRecord", searchVo);
	}
	
	public CompanyVO selectByComId(String comId){
		CompanyVO companyVo = getSqlSession().selectOne(namespace+".selectByComId", comId);
		
		return companyVo;
	}

	public int updateCompany(CompanyVO companyVo) {
		return getSqlSession().update(namespace+".updateCompany", companyVo);
	}

	public int insertCompany(CompanyVO companyVo) {
		return getSqlSession().insert(namespace+".insertCompany", companyVo);
	}

	public int duplicateCompanyId(String comId) {
		return getSqlSession().selectOne(namespace+".duplicateCompanyId", comId);
	}

	public int withdrawCompany(String comId) {
		return getSqlSession().update(namespace+".withdrawCompany", comId);
	}

	public String selectPwdByAdminId(String adminId) {
		return getSqlSession().selectOne(namespace+".selectPwdByAdminId", adminId);
	}

	public List<CompanyVO> selectInCompany(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectInCompany", searchVo);
	}
	
	public List<CompanyVO> selectOutCompany(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectOutCompany", searchVo);
	}

	public List<Map<String, Object>> selectAllComCar(SearchVO searchVo){
		return getSqlSession().selectList(namespace+".selectAllCcar", searchVo);
	}

	public List<CompanyVO> selectAllCompanyID() {
		return getSqlSession().selectList(namespace+".selectAllcompanyID");
	}

	@Override
	public int reRegisterCompany(String comId) {
		return getSqlSession().update(namespace+".reRegisterCompany", comId);
	}

	
}