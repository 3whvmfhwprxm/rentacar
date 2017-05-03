package com.third.rent.admin.model;

import java.util.List;
import java.util.Map;

public interface AdminDAO {
	public int selectCountUser();
	
	public int selectCountCompany();
	
	public int selectCountReservation();
	
	public int selectCountPayinfo();
	
	public List<Map<String, Object>> selectSumTotalPay();
}
