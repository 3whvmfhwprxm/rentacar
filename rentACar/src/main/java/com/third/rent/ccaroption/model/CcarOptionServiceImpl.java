package com.third.rent.ccaroption.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.common.SearchVO;

@Service
public class CcarOptionServiceImpl implements CcarOptionService {

	@Autowired
	private CcarOptionDAO ccarOptionDao;
	
	@Override
	public int insertCcarOption(CcarOptionVO vo) {
		return ccarOptionDao.insertCcarOption(vo);
	}


	@Override
	public HashMap<String, Object> selectByCcarId(String ccarid) {
		return ccarOptionDao.selectByCcarId(ccarid);
	}


	@Override
	public List<Map<String, Object>> selectAllComCar(SearchVO searchVo) {
		return ccarOptionDao.selectAllComCar(searchVo);
	}


	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return ccarOptionDao.selectTotalRecord(searchVo);
	}


	@Override
	public int updateCarOption(CcarOptionVO vo) {
		return ccarOptionDao.updateCarOption(vo);
	}


	@Override
	public int deleteCarOption(CcarOptionVO vo) {
		return ccarOptionDao.deleteCarOption(vo);
	}


	@Override
	public int checkCarId(String ccarCarId) {
		return ccarOptionDao.checkCarId(ccarCarId);
	}


	@Override
	public int updateCarUseYn(CcarOptionVO vo) {
		return ccarOptionDao.updateCarUseYn(vo);
	}
	
	@Override
	public List<Map<String, Object>> selectComReserv(SearchVO searchVo) {
		return ccarOptionDao.selectComReserv(searchVo);
	}


	@Override
	public int ReservTotalRecord(SearchVO searchVo) {
		return ccarOptionDao.ReservTotalRecord(searchVo);
	}


	@Override
	public List<Map<String, Object>> selectRentalData(SearchVO searchVo) {
		return ccarOptionDao.selectRentalData(searchVo);
	}


	@Override
	public int todayRentalTR(SearchVO searchVo) {
		return ccarOptionDao.todayRentalTR(searchVo);
	}


	@Override
	public List<Map<String, Object>> selectReturnData(SearchVO searchVo) {
		return ccarOptionDao.selectReturnData(searchVo);
	}


	@Override
	public int todayReturnTR(SearchVO searchVo) {
		return ccarOptionDao.todayReturnTR(searchVo);
	}


	@Override
	public List<Map<String, Object>> selectRentalIng(SearchVO searchVo) {
		return ccarOptionDao.selectRentalIng(searchVo);
	}

	@Override
	public int rentalIngTR(SearchVO searchVo) {
		return ccarOptionDao.rentalIngTR(searchVo);
	}


}
