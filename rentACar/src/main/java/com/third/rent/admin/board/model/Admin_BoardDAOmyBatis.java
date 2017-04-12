package com.third.rent.admin.board.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.company.notice.model.CompanyNoticeVO;
import com.third.rent.service.notice.model.ServiceCenterNoticeVO;
import com.third.rent.user.notice.model.UserNoticeVO;

@Repository
public class Admin_BoardDAOmyBatis extends SqlSessionDaoSupport implements Admin_BoardDAO{

	private String nameSpace="config.mybatis.mapper.oracle.admin_board";
	
	@Override
	public List<ServiceCenterNoticeVO> selectSN() {
		return getSqlSession().selectList(nameSpace+".selectSCNotice");
	}

	@Override
	public List<CompanyNoticeVO> selectCN() {
		return getSqlSession().selectList(nameSpace+".selectCNotice");
	}

	@Override
	public List<UserNoticeVO> selectUN() {
		return getSqlSession().selectList(nameSpace+".selectUNotice");
	}
	
	
}
