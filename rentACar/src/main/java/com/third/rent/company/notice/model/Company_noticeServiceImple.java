package com.third.rent.company.notice.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.common.SearchVO;

@Service
public class Company_noticeServiceImple implements Company_noticeService {

	@Autowired
	private Company_noticeDAO cnoticeDao;
	
	@Override
	public List<CompanyNoticeVO> companyAnnouncement(SearchVO searchVo) {
		return cnoticeDao.companyAnnouncement(searchVo);
	}

	@Override
	public CompanyNoticeVO selectByNo(int cnoticeNo) {
		return cnoticeDao.selectByNo(cnoticeNo);
	}

	@Override
	public int insertComNotice(CompanyNoticeVO cvo) {
		return 0;
	}

	@Override
	public int updateComNotice(CompanyNoticeVO cvo) {
		return 0;
	}

	@Override
	public int updateComNoticeDelFlag(int cnoticeNo) {
		return 0;
	}

	/*@Override
	public int companyIdChk(CompanyVO param) {
		int chk = cnoticeDao.companyIdChk(param);
		if(chk > 0){
			chk = cnoticeDao.companyPwdChk(param);
		}
		return chk;
	}

	@Override
	public CompanyVO selectByComAdmin(CompanyVO companyVo) {
		return cnoticeDao.selectByComAdmin(companyVo);
	}*/

}