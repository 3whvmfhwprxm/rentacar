package com.third.rent.admin_Board.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.common.SearchVO;
import com.third.rent.company.notice.model.CompanyNoticeVO;
import com.third.rent.service.notice.model.ServiceCenterNoticeVO;
import com.third.rent.user.notice.model.UserNoticeVO;

@Repository
public class Admin_BoardDAOmyBatis extends SqlSessionDaoSupport implements Admin_BoardDAO{

	private String nameSpace="config.mybatis.mapper.oracle.admin_board";
	
	@Override
	public List<ServiceCenterNoticeVO> selectSN(SearchVO searchVo) {
		return getSqlSession().selectList(nameSpace+".selectSCNotice", searchVo);
	}

	@Override
	public List<CompanyNoticeVO> selectCN(SearchVO searchVo) {
		return getSqlSession().selectList(nameSpace+".selectCNotice", searchVo);
	}

	@Override
	public List<UserNoticeVO> selectUN(SearchVO searchVo) {
		return getSqlSession().selectList(nameSpace+".selectUNotice", searchVo);
	}

	@Override
	public int selectTotalRecordU(SearchVO searchVo) {	
		return getSqlSession().selectOne(nameSpace+".selectTotalRecordfromUN", searchVo);
	}
	
	@Override
	public int selectTotalRecordC(SearchVO searchVo) {	
		return getSqlSession().selectOne(nameSpace+".selectTotalRecordfromCN", searchVo);
	}
	
	@Override
	public int selectTotalRecordSC(SearchVO searchVo) {	
		return getSqlSession().selectOne(nameSpace+".selectTotalRecordfromSN", searchVo);
	}
	
}
