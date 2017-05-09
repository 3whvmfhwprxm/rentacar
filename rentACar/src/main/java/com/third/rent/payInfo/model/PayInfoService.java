package com.third.rent.payInfo.model;

import java.util.List;
import java.util.Map;

import com.third.rent.reservation.model.ReservationVO;

public interface PayInfoService {
	public List<PayInfoVO> selectPayInfo(PayInfoVO pInfo);
	
	public int selectTotalRecordPayInfo(PayInfoVO pInfo);
	
	public List<PayInfoVO> recentTenPayInfo(PayInfoVO payInfoVo);
	
	public int cancelPayInfo(Map<String, Object> map);
	
	public int multiCancelPayInfo(List<PayInfoVO> rlist);
}
