package com.third.rent.admin_Mng.Model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.admin.model.AdminVO;
import com.third.rent.common.SearchVO;

@Service
public class AdminMngServiceImple implements AdminMngService{

	@Autowired
	private AdminMngDAO dao;
	
	@Override
	public int insertAdmin(AdminVO avo) {
		return dao.insertAdmin(avo);
	}

	@Override
	public int updateAdmin(AdminVO avo) {
		return dao.updateAdmin(avo);
	}

	@Override
	public int updateAdminOutdate(String adminId) {
		return dao.updateAdminOutdate(adminId);
	}

	@Override
	public List<AdminVO> selectAdmins(SearchVO svo) {
		return dao.selectAdmins(svo);
	}

	@Override
	public int countAdmin(SearchVO svo) {
		return dao.countAdmin(svo);
	}

	@Override
	public AdminVO selectOneAdmin(String adminId) {
		return dao.selectOneAdmin(adminId);
	}

	@Override
	public int duplicateAdminId(String adminId) {
		int cnt=dao.duplicateAdminId(adminId);
		int result=0;
		
		if(cnt>0){
			result=AdminMngService.EXIST_ID;
		}else{
			result=AdminMngService.NONE_EXIST_ID;
		}
		
		return result;
	}
	
	

}
