package com.third.rent.company.notice.model;

import java.util.List;

import com.third.rent.common.SearchVO;

public interface Company_noticeDAO {
	public List<CompanyNoticeVO> companyAnnouncement(SearchVO searchVo);

	/*public int companyIdChk(CompanyVO param);

	public int companyPwdChk(CompanyVO param);

	public CompanyVO selectByComAdmin(CompanyVO companyVo);*/
	
	public CompanyNoticeVO selectByNo(int cnoticeNo);
	
	public int insertComNotice(CompanyNoticeVO cvo);
	
	public int updateComNotice(CompanyNoticeVO cvo);
	
	public int updateComNoticeDelFlag(int cnoticeNo);
	
	public int updateComNoticeVisibleYes(int cnoticeNo);
	
	public int updateComNoticeVisibleNo(int cnoticeNo);
}
