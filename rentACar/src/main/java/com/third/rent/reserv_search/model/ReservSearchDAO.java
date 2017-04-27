package com.third.rent.reserv_search.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.third.rent.car.model.CarCategoryVO;
import com.third.rent.ccaroption.model.CcarOptionVO;
import com.third.rent.payInfo.model.PayInfoVO;
import com.third.rent.reservUser.model.ReservUserVO;
import com.third.rent.reservation.model.ReservationVO;

public interface ReservSearchDAO {
	public List<Map<String, Object>> searchNormal(HashMap<String, Object> map);
	public CcarOptionVO selectByCcarCarId(String ccarCarId);
	public int insertReservation(ReservationVO reserVo);
	public int insertReservUser(ReservUserVO reservWho);
	public ReservationVO selectByReservNum(String reservNum);
	public String createReservationKey();
	public List<CarCategoryVO> selectCategoryList();
	public int insertPayInfo(PayInfoVO payInfoVO);
	public Map<String, Object> selectedCarInfo(String ccarCarId);
}
