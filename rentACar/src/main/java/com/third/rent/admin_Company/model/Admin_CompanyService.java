package com.third.rent.admin_Company.model;

import java.util.List;
import java.util.Map;

import com.third.rent.common.SearchVO;
import com.third.rent.company.model.CompanyVO;

public interface Admin_CompanyService {
	public static final int EXIST_ID=1;
	public static final int NONE_EXIST_ID=2;
	
	public static final int LOGIN_OK=1;
	public static final int ID_NONE=2;
	public static final int PWD_DISAGREE=3;
	
	public List<CompanyVO> selectAllCompany(SearchVO searchVo);
	
	public int selectTotalRecord(SearchVO searchVo);
	
	public CompanyVO selectByComId(String comId);
	
	public int updateCompany(CompanyVO companyVo);
	
	public int insertCompany(CompanyVO companyVo);
	
	public int duplicateCompanyId(String comId);
	
	public int withdrawCompany(String comId);
	
	public int loginCheck(String adminId, String adminPwd);
	
	public List<CompanyVO> selectOutompany(SearchVO searchVo);
	
	public List<Map<String, Object>> selectAllComCar(String comId);
}
