package com.third.rent.user.notice.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

@Repository
public class UserNoticeMybatis extends SqlSessionDaoSupport implements UserNoticeDAO{
	private String namespace="config.mybatis.mapper.oracle.usernotice";
	
	@Override
	public List<UserNoticeVO> selectUN(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectUNotice", searchVo);
	}

	@Override
	public UserNoticeVO selectByNo(int no) {
		return getSqlSession().selectOne(namespace+".selectByNo", no);
	}

	
}
