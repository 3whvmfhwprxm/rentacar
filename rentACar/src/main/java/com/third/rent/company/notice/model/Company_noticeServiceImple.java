package com.third.rent.company.notice.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.third.rent.common.SearchVO;
import com.third.rent.payInfo.model.PayInfoVO;

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
		return cnoticeDao.insertComNotice(cvo);
	}

	@Override
	public int updateComNotice(CompanyNoticeVO cvo) {
		return cnoticeDao.updateComNotice(cvo);
	}

	@Override
	public int updateComNoticeDelFlag(int cnoticeNo) {
		return cnoticeDao.updateComNoticeDelFlag(cnoticeNo);
	}

	@Override
	public int updateComNoticeVisibleYes(int cnoticeNo) {
		return cnoticeDao.updateComNoticeVisibleYes(cnoticeNo);
	}

	@Override
	public int updateComNoticeVisibleNo(int cnoticeNo) {
		return cnoticeDao.updateComNoticeVisibleNo(cnoticeNo);
	}

	@Override
	@Transactional
	public int updateComNoticeMultiVisibleNo(List<CompanyNoticeVO> cnlist) {
		int cnt=0;
		try{
			for(CompanyNoticeVO cvo : cnlist){
				if(cvo.getCnoticeNo()>0){
					cnt=cnoticeDao.updateComNoticeVisibleNo(cvo.getCnoticeNo());
				}
			}			
		}catch(RuntimeException e){
			e.printStackTrace();
			cnt=-1;
		}
		return cnt;
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
