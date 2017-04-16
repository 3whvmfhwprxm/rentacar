package com.third.rent.reserv_search.model;

import java.util.HashMap;
import java.util.List;

import com.third.rent.ccaroption.model.CcarOptionVO;
import com.third.rent.reservUser.model.ReservUserVO;
import com.third.rent.reservation.model.ReservationVO;

public interface ReservSearchService {
	public List<CcarOptionVO> searchNormal(HashMap<String, Object> map);
	public CcarOptionVO selectByCcarCarId(String ccarCarId);
	public int insertReservUser(ReservUserVO reservVo);
	public int insertReservation(ReservationVO reserVo);
}
