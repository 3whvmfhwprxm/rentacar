package com.third.rent.admin_LogState.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.admin.model.AdminVO;

@Service
public class admin_LogServiceImpl implements admin_LogService {
	
	@Autowired
	private admin_LogDAO adminLogDao;

	public int insertAdmin(AdminVO vo) {
		return adminLogDao.insertAdmin(vo);
	}

	public int duplicateUserid(String adminid) {
		int result = 0;
		int count = adminLogDao.duplicateUserid(adminid);
				
		if(count==1){
			result = EXIST_ID;
		}else{
			result = NONE_EXIST_ID;
		}
		return result;
	}
	
	public int loginCheck(String adminid, String pwd){
		int result = 0;
		String dbPwd = adminLogDao.selectPwd(adminid);
		if(dbPwd!=null && !dbPwd.isEmpty()){
			if(pwd.equals(dbPwd)){
				result = LOGIN_OK;
			}else{
				result = PWD_DISAGREE;
			}
		}else{
			result = ID_NONE;
		}
		return result;
	}
	
	public AdminVO selectByAdminId(String adminid) {
		return adminLogDao.selectByAdminId(adminid);
	}

	public int updateAdmin(AdminVO vo) {
		return adminLogDao.updateAdmin(vo);
	}

	public int withdrawAdmin(String adminid) {
		return adminLogDao.withdrawAdmin(adminid);
	}
}













