package com.third.rent.payInfo.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayInfoServiceImple implements PayInfoService{

	@Autowired
	private PayInfoDAO pDao;
	
	@Override
	public List<PayInfoVO> selectPayInfo(PayInfoVO pInfo) {
		return pDao.selectPayInfo(pInfo);
	}

	@Override
	public int selectTotalRecordPayInfo(PayInfoVO pInfo) {
		return pDao.selectTotalRecordPayInfo(pInfo);
	}

	
}
