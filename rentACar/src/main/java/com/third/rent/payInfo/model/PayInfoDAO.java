package com.third.rent.payInfo.model;

import java.util.List;

public interface PayInfoDAO {
	public List<PayInfoVO> selectPayInfo(PayInfoVO pInfo);
	
	public int selectTotalRecordPayInfo(PayInfoVO pInfo);
	
	public List<PayInfoVO> recentTenPayInfo(PayInfoVO payInfoVo);
}
