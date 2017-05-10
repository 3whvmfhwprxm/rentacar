package com.third.rent.company.notice.model;

import java.util.List;

public class CompanyNoticeVOList {
	private List<CompanyNoticeVO> cvolist;

	public List<CompanyNoticeVO> getCvolist() {
		return cvolist;
	}

	public void setCvolist(List<CompanyNoticeVO> cvolist) {
		this.cvolist = cvolist;
	}

	@Override
	public String toString() {
		return "CompanyNoticeVOList [cvolist=" + cvolist + "]";
	}
	
}
