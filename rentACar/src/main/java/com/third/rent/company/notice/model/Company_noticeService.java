package com.third.rent.company.notice.model;

import java.util.List;

import com.third.rent.common.SearchVO;

public interface Company_noticeService {
	public List<CompanyNoticeVO> companyAnnouncement(SearchVO searchVo);
}
