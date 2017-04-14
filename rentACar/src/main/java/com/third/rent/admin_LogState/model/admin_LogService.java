package com.third.rent.admin_LogState.model;

import com.third.rent.admin.model.AdminVO;

public interface admin_LogService {
	
	public static final int EXIST_ID = 1;
	public static final int NONE_EXIST_ID = 2;

	public static final int LOGIN_OK = 1;
	public static final int ID_NONE = 2;
	public static final int PWD_DISAGREE = 3;

	public int insertAdmin(AdminVO vo);
	
	public int duplicateUserid(String adminid);
	
	public int loginCheck(String userid, String pwd);
	
	public AdminVO selectByAdminId(String adminid);
	
	public int updateAdmin(AdminVO vo);
	
	public int withdrawAdmin(String adminid);
}
