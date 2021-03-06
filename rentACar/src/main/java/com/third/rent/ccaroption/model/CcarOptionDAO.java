package com.third.rent.ccaroption.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.third.rent.car.model.CarVO;
import com.third.rent.common.SearchVO;

public interface CcarOptionDAO {
	
	public int insertCcarOption(CcarOptionVO vo);
	public List<CcarOptionVO> selectAllCcar();
	public List<Map<String, Object>> selectAllComCar(SearchVO searchVo);
	public HashMap<String, Object> selectByCcarId(String ccarid);
	public int selectTotalRecord(SearchVO searchVo);
	public int ReservTotalRecord(SearchVO searchVo);
	public int todayRentalTR(SearchVO searchVo);
	public int todayReturnTR(SearchVO searchVo);
	public int rentalIngTR(SearchVO searchVo);
	public int updateCarOption(CcarOptionVO vo);
	public int deleteCarOption(CcarOptionVO vo);
	public int checkCarId(String ccarCarId);
	public int updateCarUseYn(CcarOptionVO vo);
	public List<Map<String, Object>> selectComReserv(SearchVO searchVo);
	public List<Map<String, Object>> selectRentalData(SearchVO searchVo);
	public List<Map<String, Object>> selectReturnData(SearchVO searchVo);
	public List<Map<String, Object>> selectRentalIng(SearchVO searchVo);
	public int updateStatusCgRent(CcarOptionVO vo);
	public int updateStatusCgReturn(CcarOptionVO vo);
	public int updateStatusCgHold(CcarOptionVO vo);
	public CcarOptionVO selectByCCarId(String ccarCarId);
	public List<CarVO> selectByCarInc(String carInc);
}
