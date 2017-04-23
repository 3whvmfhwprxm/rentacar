package com.third.rent.company.notice.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.common.SearchVO;
import com.third.rent.company.model.CompanyVO;

@Repository
public class Company_noticeDAOMyBatis extends SqlSessionDaoSupport implements Company_noticeDAO{
	
	private String nameSpace="config.mybatis.mapper.oracle.company_announcement.";

	@Override
	public List<CompanyNoticeVO> companyAnnouncement(SearchVO searchVo) {
		return getSqlSession().selectList(nameSpace+"selectCNotice",searchVo);
	}

	/*@Override
	public int companyIdChk(CompanyVO param) {
		return getSqlSession().selectOne(nameSpace+"companyIdChk", param);
	}

	@Override
	public int companyPwdChk(CompanyVO param) {
		return getSqlSession().selectOne(nameSpace+"companyPwdChk", param);
	}

	@Override
	public CompanyVO selectByComAdmin(CompanyVO companyVo) {
		return getSqlSession().selectOne(nameSpace+"selectByComAdmin", companyVo);
	}*/
}
