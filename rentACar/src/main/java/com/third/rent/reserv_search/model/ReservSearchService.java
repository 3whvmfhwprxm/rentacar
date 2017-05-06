package com.third.rent.reserv_search.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.third.rent.car.model.CarCategoryVO;
import com.third.rent.ccaroption.model.CcarOptionVO;
import com.third.rent.common.DateSearchVO;
import com.third.rent.payInfo.model.PayInfoVO;
import com.third.rent.reservUser.model.ReservUserVO;
import com.third.rent.reservation.model.ReservationVO;

public interface ReservSearchService {
	public List<Map<String, Object>> searchNormal(DateSearchVO dvo);
	public int searchNormalTotalCount(DateSearchVO dvo);
	
	public CcarOptionVO selectByCcarCarId(String ccarCarId);
	public ReservationVO selectByReservNum(String reservNum);
	public String takeReservation(ReservationVO reserVo, ReservUserVO reservWho);
	public List<CarCategoryVO> selectCategoryList();
	public int insertPayInfo(PayInfoVO payInfoVO);
	public Map<String, Object> selectedCarInfo(HashMap<String, Object> map); 
}
