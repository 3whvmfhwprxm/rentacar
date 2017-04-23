package com.third.rent.company.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyServiceImpl implements CompanyService{

	
	@Autowired
	private CompanyDAO companyDao;
	
	@Override
	public int loginCheck(String comId, String comPwd) {
		int result = 0;
		String dbPwd = companyDao.selectPwd(comId);
		if(dbPwd!=null && !dbPwd.isEmpty()){
			if(comPwd.equals(dbPwd)){
				result = LOGIN_OK;
			}else{
				result = PWD_DISAGREE;
			}
		}else{
			result = ID_NONE;
		}
		return result;
	}
	
	@Override
	public CompanyVO selectBycomId(String comId) {
		return companyDao.selectBycomId(comId);
	}
	@Override
	public int duplicateUserid(String comId) {
		int result = 0;
		int count = companyDao.duplicateUserid(comId);
				
		if(count==1){
			result = EXIST_ID;
		}else{
			result = NONE_EXIST_ID;
		}
		return result;
		
	}

	

}
