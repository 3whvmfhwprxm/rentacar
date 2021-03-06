package com.third.rent.admin.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDao;
	
	@Override
	public int selectCountUser() {
		return adminDao.selectCountUser();
	}

	@Override
	public int selectCountCompany() {
		return adminDao.selectCountCompany();
	}

	@Override
	public int selectCountReservation() {
		return adminDao.selectCountReservation();
	}

	@Override
	public int selectCountPayinfo() {
		return adminDao.selectCountPayinfo();
	}

	@Override
	public List<Map<String, Object>> selectSumTotalPay() {
		return adminDao.selectSumTotalPay();
	}
	
}
