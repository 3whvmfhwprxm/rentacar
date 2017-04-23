package com.third.rent.admin_Mng.Model;

import java.util.List;

import com.third.rent.admin.model.AdminVO;
import com.third.rent.common.SearchVO;

public interface AdminMngDAO {
	public int insertAdmin(AdminVO avo);
	public int updateAdmin(AdminVO avo);
	public int updateAdminOutdate(String adminId);
	public List<AdminVO> selectAdmins(SearchVO svo);
	public int countAdmin(SearchVO svo);
	public AdminVO selectOneAdmin(String adminId);
	public int duplicateAdminId(String adminId);
	public List<AuthcodeVO> selectAuthCode();
}
