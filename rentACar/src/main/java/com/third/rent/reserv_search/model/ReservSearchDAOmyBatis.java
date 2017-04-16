package com.third.rent.reserv_search.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.ccaroption.model.CcarOptionVO;
import com.third.rent.reservUser.model.ReservUserVO;
import com.third.rent.reservation.model.ReservationVO;

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

	@Override
	public int insertReservUser(ReservUserVO reservVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReservation(ReservationVO reserVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
