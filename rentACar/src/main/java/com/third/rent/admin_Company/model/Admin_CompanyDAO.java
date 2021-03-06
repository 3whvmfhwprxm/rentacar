package com.third.rent.admin_Company.model;

import java.util.List;
import java.util.Map;

import com.third.rent.common.SearchVO;
import com.third.rent.company.model.CompanyVO;

public interface Admin_CompanyDAO {
	public List<CompanyVO> selectAllCompany(SearchVO searchVo);
	
	public int selectTotalRecord(SearchVO searchVo);
	
	public int selectCarTotalRecord(SearchVO searchVo);
	
	public CompanyVO selectByComId(String comId);
	
	public int updateCompany(CompanyVO companyVo);
	
	public int insertCompany(CompanyVO companyVo);
	
	public int duplicateCompanyId(String comId);
	
	public int withdrawCompany(String comId);
	
	public String selectPwdByAdminId(String adminId);
	
	public List<CompanyVO> selectInCompany(SearchVO searchVo);
	
	public List<CompanyVO> selectOutCompany(SearchVO searchVo);
	
	public List<Map<String, Object>> selectAllComCar(SearchVO searchVo);
	
	public List<CompanyVO> selectAllCompanyID();
	
	public int reRegisterCompany(String comId);
}