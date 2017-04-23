package com.third.rent.admin_Mng.Model;

import java.util.List;

import com.third.rent.admin.model.AdminVO;
import com.third.rent.common.SearchVO;

public interface AdminMngService {
	//아이디 중복확인에서 사용하는 상수
	public static final int EXIST_ID=1;  //이미 해당 아이디가 존재함
	public static final int NONE_EXIST_ID=2; //아이디가 존재하지 않음
	
	public int insertAdmin(AdminVO avo);
	public int updateAdmin(AdminVO avo);
	public int updateAdminOutdate(String adminId);
	public List<AdminVO> selectAdmins(SearchVO svo);
	public int countAdmin(SearchVO svo);
	public AdminVO selectOneAdmin(String adminId);
	public int duplicateAdminId(String adminId);
	public List<AuthcodeVO> selectAuthCode();
}
