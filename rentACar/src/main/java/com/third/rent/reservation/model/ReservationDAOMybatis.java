package com.third.rent.reservation.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.user.model.UserVO;

@Repository
public class ReservationDAOMybatis extends SqlSessionDaoSupport implements ReservationDAO{
	private String namespace="config.mybatis.mapper.oracle.reservation";

	@Override
	public ReservationVO selectByUserid(String userId) {
		return getSqlSession().selectOne(namespace+".selectByUserid", userId);
	}
}
