package com.third.rent.admin_LogState.model;

import com.third.rent.admin.model.AdminVO;

public interface admin_LogDAO {
	public int insertAdmin(AdminVO vo);
	
	public int duplicateUserid(String adminid);
	
	public String selectPwd(String adminid);
	
	public AdminVO selectByAdminId(String adminid);
	
	public int updateAdmin(AdminVO vo);
	
	public int withdrawAdmin(String adminid);
}
