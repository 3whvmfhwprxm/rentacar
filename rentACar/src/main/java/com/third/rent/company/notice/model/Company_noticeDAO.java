package com.third.rent.company.notice.model;

import java.util.List;

import com.third.rent.common.SearchVO;
import com.third.rent.company.model.CompanyVO;

public interface Company_noticeDAO {
	public List<CompanyNoticeVO> companyAnnouncement(SearchVO searchVo);

	/*public int companyIdChk(CompanyVO param);

	public int companyPwdChk(CompanyVO param);

	public CompanyVO selectByComAdmin(CompanyVO companyVo);*/
	
	public CompanyNoticeVO selectByNo(int cnoticeNo);
}
