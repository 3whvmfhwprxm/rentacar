package com.third.rent.company.model;

import java.util.List;
import java.util.Map;

public interface CompanyDAO {
	
	public int duplicateUserid(String comId);
	
	public String selectPwd(String comId);
	
	public CompanyVO selectBycomId(String comId);
	
	public int updateCompany(CompanyVO vo);
	
	
	
}
