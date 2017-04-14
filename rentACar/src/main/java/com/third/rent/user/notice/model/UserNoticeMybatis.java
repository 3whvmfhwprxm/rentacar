package com.third.rent.user.notice.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class UserNoticeMybatis extends SqlSessionDaoSupport implements UserNoticeDAO{
	private String namespace="config.mybatis.mapper.oracle.usernotice";
}
