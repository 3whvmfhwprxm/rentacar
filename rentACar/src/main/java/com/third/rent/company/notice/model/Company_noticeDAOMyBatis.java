package com.third.rent.company.notice.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.common.SearchVO;

@Repository
public class Company_noticeDAOMyBatis extends SqlSessionDaoSupport implements Company_noticeDAO{
	
	private String nameSpace="config.mybatis.mapper.oracle.company_announcement";

	@Override
	public List<CompanyNoticeVO> companyAnnouncement(SearchVO searchVo) {
		return getSqlSession().selectList(nameSpace+".selectCNotice",searchVo);
	}

	
	
		
	
}
