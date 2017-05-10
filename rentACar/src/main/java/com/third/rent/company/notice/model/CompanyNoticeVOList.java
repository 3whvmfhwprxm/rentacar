package com.third.rent.company.notice.model;

import java.util.List;

import com.third.rent.company.model.CompanyVO;

public class CompanyNoticeVOList {
	private List<CompanyVO> cvolist;

	public List<CompanyVO> getCvolist() {
		return cvolist;
	}

	public void setCvolist(List<CompanyVO> cvolist) {
		this.cvolist = cvolist;
	}

	@Override
	public String toString() {
		return "CompanyNoticeVOList [cvolist=" + cvolist + "]";
	}
	
}
