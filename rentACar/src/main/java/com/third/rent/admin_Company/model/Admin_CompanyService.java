package com.third.rent.admin_Company.model;

import java.util.List;

import com.third.rent.common.SearchVO;
import com.third.rent.company.model.CompanyVO;

public interface Admin_CompanyService {
	public List<CompanyVO> selectAllCompany(SearchVO searchVo);
	
	public int selectTotalRecord(SearchVO searchVo);
	
	public CompanyVO selectByComId(String comId);
	
	public int updateCompany(CompanyVO companyVo);
	
	public boolean checkPwd(String adminId, String adminPwd);
}
