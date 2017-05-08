package com.third.rent.company.model;

import java.util.List;

import com.third.rent.company.model.CompanyVO;

public class companyListVO {
	private List<CompanyVO> companyItems;

	public List<CompanyVO> getCompanyItems() {
		return companyItems;
	}

	public void setCompanyItems(List<CompanyVO> companyItems) {
		this.companyItems = companyItems;
	}

	@Override
	public String toString() {
		return "Admin_CompanyListVO [companyItems=" + companyItems + "]";
	}
}
