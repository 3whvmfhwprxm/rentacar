package com.third.rent.reserv_search.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.ccaroption.model.CcarOptionVO;
import com.third.rent.reservUser.model.ReservUserVO;
import com.third.rent.reservation.model.ReservationVO;

@Service
public class ReservSearchServiceImpl implements ReservSearchService{

	@Autowired
	private ReservSearchDAO dao;
	
	@Override
	public List<CcarOptionVO> searchNormal(HashMap<String, Object> map) {
		return dao.searchNormal(map);
	}

	@Override
	public CcarOptionVO selectByCcarCarId(String ccarCarId) {
		return dao.selectByCcarCarId(ccarCarId);
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
