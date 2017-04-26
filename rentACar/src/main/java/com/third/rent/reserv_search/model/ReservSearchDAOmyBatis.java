package com.third.rent.reserv_search.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.car.model.CarCategoryVO;
import com.third.rent.ccaroption.model.CcarOptionVO;
import com.third.rent.payInfo.model.PayInfoVO;
import com.third.rent.reservUser.model.ReservUserVO;
import com.third.rent.reservation.model.ReservationVO;

@Repository
public class ReservSearchDAOmyBatis extends SqlSessionDaoSupport implements ReservSearchDAO{

	private String nameSpace="config.mybatis.mapper.oracle.reserv_car";
	
	@Override
	public List<Map<String, Object>> searchNormal(HashMap<String, Object> map) {
		return getSqlSession().selectList(nameSpace+".searchCar", map);
	}

	@Override
	public CcarOptionVO selectByCcarCarId(String ccarCarId) {
		return getSqlSession().selectOne(nameSpace+".selectByccarCarId", ccarCarId);
	}

	@Override
	public String createReservationKey() {
		return getSqlSession().selectOne(nameSpace+".createReservationKey");
	}

	@Override
	public int insertReservUser(ReservUserVO reservWho) {
		return getSqlSession().insert(nameSpace+".insertReservUser", reservWho);
	}

	@Override
	public int insertReservation(ReservationVO reserVo) {
		return getSqlSession().insert(nameSpace+".insertReservation", reserVo);
	}

	@Override
	public ReservationVO selectByReservNum(String reservNum) {		
		return getSqlSession().selectOne(nameSpace+".selectByReservNum", reservNum);
	}

	@Override
	public List<CarCategoryVO> selectCategoryList() {
		return getSqlSession().selectList(nameSpace+".selectCarCategoryList");
	}

	@Override
	public int insertPayInfo(PayInfoVO payInfoVO) {
		return getSqlSession().insert(nameSpace+".insertPayInfo", payInfoVO);
	}	
	
	
}
