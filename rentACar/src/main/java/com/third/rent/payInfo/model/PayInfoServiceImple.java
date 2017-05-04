package com.third.rent.payInfo.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.third.rent.reservation.model.ReservationDAO;

@Service
public class PayInfoServiceImple implements PayInfoService{

	@Autowired
	private PayInfoDAO pDao;
	
	@Autowired
	private ReservationDAO rDao;
	
	@Override
	public List<PayInfoVO> selectPayInfo(PayInfoVO pInfo) {
		return pDao.selectPayInfo(pInfo);
	}

	@Override
	public int selectTotalRecordPayInfo(PayInfoVO pInfo) {
		return pDao.selectTotalRecordPayInfo(pInfo);
	}

	@Override
	public List<PayInfoVO> recentTenPayInfo(PayInfoVO payInfoVo) {
		return pDao.recentTenPayInfo(payInfoVo);
	}

	@Override
	@Transactional
	public int cancelPayInfo(Map<String, Object> map) {
		int result=0;
		result=pDao.updatePayCancel((String)map.get("reservNum"));		
		result=rDao.updateReservCancel(map);				
		return result;
	}
	
}
