package com.third.rent.admin_Company.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
