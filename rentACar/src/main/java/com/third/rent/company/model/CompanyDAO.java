package com.third.rent.company.model;

public interface CompanyDAO {
	
	public int duplicateUserid(String comId);
	
	public String selectPwd(String comId);
	
	public CompanyVO selectBycomId(String comId);
	
	public int updateCompany(CompanyVO vo);
}
