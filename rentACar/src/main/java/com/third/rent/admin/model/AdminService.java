package com.third.rent.admin.model;

public interface AdminService {
	public int selectCountUser();
	
	public int selectCountCompany();
	
	public int selectCountReservation();
	
	public int selectCountPayinfo();
	
	public int selectSumPayMoney();
	
	public int selectSumPayDiscount();
}
