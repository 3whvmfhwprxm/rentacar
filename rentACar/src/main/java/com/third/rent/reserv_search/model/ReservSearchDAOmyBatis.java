package com.third.rent.reserv_search.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.ccaroption.model.CcarOptionVO;

@Repository
public class ReservSearchDAOmyBatis extends SqlSessionDaoSupport implements ReservSearchDAO{

	private String nameSpace="config.mybatis.mapper.oracle.reserv_car";
	
	@Override
	public List<CcarOptionVO> searchNormal(HashMap<String, Object> map) {
		return getSqlSession().selectList(nameSpace+".searchCar", map);
	}

	@Override
	public CcarOptionVO selectByCcarCarId(String ccarCarId) {
		return getSqlSession().selectOne(nameSpace+".selectByccarCarId", ccarCarId);
	}

	
}
