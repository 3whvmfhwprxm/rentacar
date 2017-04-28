package com.third.rent.admin_Company.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.admin_LogState.model.admin_LogService;
import com.third.rent.common.SearchVO;
import com.third.rent.company.model.CompanyVO;

@Service
public class Admin_CompanyServiceImpl implements Admin_CompanyService {

	@Autowired
	private Admin_CompanyDAO adminCompanyDao;
	
	public List<CompanyVO> selectAllCompany(SearchVO searchVo) {
		return adminCompanyDao.selectAllCompany(searchVo);
	}

	public int selectTotalRecord(SearchVO searchVo) {
		return adminCompanyDao.selectTotalRecord(searchVo);
	}

	public CompanyVO selectByComId(String comId) {
		return adminCompanyDao.selectByComId(comId);
	}

	public int updateCompany(CompanyVO companyVo) {
		return adminCompanyDao.updateCompany(companyVo);
	}

	public int insertCompany(CompanyVO companyVo) {
		return adminCompanyDao.insertCompany(companyVo);
	}

	public int duplicateCompanyId(String comId) {
		int cnt = adminCompanyDao.duplicateCompanyId(comId);
		
		int result=0;
		if(cnt>0){
			result = Admin_CompanyService.EXIST_ID;
		}else{
			result = Admin_CompanyService.NONE_EXIST_ID;
		}
		return result;
	}

	public int withdrawCompany(String comId) {
		return adminCompanyDao.withdrawCompany(comId);
	}

	public int loginCheck(String adminId, String pwd) {
		int result=0;
		String dbPwd = adminCompanyDao.selectPwdByAdminId(adminId);
		
		if(dbPwd==null || dbPwd.isEmpty()){
			result = admin_LogService.ID_NONE;
		}else{		
			if(dbPwd.equals(pwd)){
				result = admin_LogService.LOGIN_OK;
			}else{
				result = admin_LogService.PWD_DISAGREE;
			}
		}		
		return result;
	}

	public List<CompanyVO> selectOutompany(SearchVO searchVo) {
		return adminCompanyDao.selectOutompany(searchVo);
	}
	
	public List<Map<String, Object>> selectAllComCar(SearchVO searchVo) {
		return adminCompanyDao.selectAllComCar(searchVo);
	}
}
