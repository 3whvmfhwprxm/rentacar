package com.third.rent.company.model;

import java.util.List;
import java.util.Map;

import com.third.rent.user.model.UserVO;

public interface CompanyDAO {
	
	public int duplicateUserid(String comId);
	
	public String selectPwd(String comId);
	
	public CompanyVO selectBycomId(String comId);
	
	public int updateCompany(CompanyVO vo);
	
	public String selectSearchid(CompanyVO vo);
	
	public String selectSearchpwd(CompanyVO vo);
	
	public int updateReadCount(int no);
	
	
	
}
