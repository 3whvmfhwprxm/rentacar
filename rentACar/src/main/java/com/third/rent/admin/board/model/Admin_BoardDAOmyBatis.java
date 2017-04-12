package com.third.rent.admin.board.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.company.notice.model.CompanyNoticeVO;
import com.third.rent.service.notice.model.ServiceCenterNoticeVO;
import com.third.rent.user.notice.model.UserNoticeVO;

@Repository
public class Admin_BoardDAOmyBatis extends SqlSessionDaoSupport implements Admin_BoardDAO{

	@Override
	public List<ServiceCenterNoticeVO> selectSN() {
		return null;
	}

	@Override
	public List<CompanyNoticeVO> selectCN() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserNoticeVO> selectUN() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
