package com.third.rent.company.notice.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.common.SearchVO;

@Service
public class Com_noServiceImpl implements Company_noticeService {

	@Autowired
	private Company_noticeDAO CnoticeDao;
	
	@Override
	public List<CompanyNoticeVO> companyAnnouncement(SearchVO searchVo) {
		return CnoticeDao.companyAnnouncement(searchVo);
	}

}
