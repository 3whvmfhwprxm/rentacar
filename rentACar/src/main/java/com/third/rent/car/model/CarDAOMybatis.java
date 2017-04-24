package com.third.rent.car.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CarDAOMybatis extends SqlSessionDaoSupport implements CarDAO{

	private String namespace="config.mybatis.mapper.oracle.car";

	public List<CarVO> selectAllCar() {
		return getSqlSession().selectList(namespace+".selectAllCar");
	}
}
