package com.third.rent.reserv_search.model;

import java.util.HashMap;
import java.util.List;

import com.third.rent.car.model.CarCategoryVO;
import com.third.rent.ccaroption.model.CcarOptionVO;
import com.third.rent.reservUser.model.ReservUserVO;
import com.third.rent.reservation.model.ReservationVO;

public interface ReservSearchDAO {
	public List<CcarOptionVO> searchNormal(HashMap<String, Object> map);
	public CcarOptionVO selectByCcarCarId(String ccarCarId);
	public int insertReservation(ReservationVO reserVo);
	public int insertReservUser(ReservUserVO reservWho);
	public ReservationVO selectByReservNum(String reservNum);
	public String createReservationKey();
	public List<CarCategoryVO> selectCategoryList();
}
