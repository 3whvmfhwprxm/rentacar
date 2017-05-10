package com.third.rent.company.notice.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.common.SearchVO;

@Repository
public class Company_noticeDAOMyBatis extends SqlSessionDaoSupport implements Company_noticeDAO{
	
	private String nameSpace="config.mybatis.mapper.oracle.company";
	
	@Override
	public List<CompanyNoticeVO> companyAnnouncement(SearchVO searchVo) {
		return getSqlSession().selectList(nameSpace+".selectCNotice",searchVo);
	}

	@Override
	public CompanyNoticeVO selectByNo(int cnoticeNo) {
		return getSqlSession().selectOne(nameSpace+".selectByNo",cnoticeNo);
	}

	@Override
	public int insertComNotice(CompanyNoticeVO cvo) {
		return getSqlSession().insert(nameSpace+".insertComNotice", cvo);
	}

	@Override
	public int updateComNotice(CompanyNoticeVO cvo) {
		return getSqlSession().update(nameSpace+".updateComNotice", cvo);
	}

	@Override
	public int updateComNoticeDelFlag(int cnoticeNo) {
		return getSqlSession().update(nameSpace+".updateComNoticeDelFlag", cnoticeNo);
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
