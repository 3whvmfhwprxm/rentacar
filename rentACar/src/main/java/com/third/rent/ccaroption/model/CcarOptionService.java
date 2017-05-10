package com.third.rent.ccaroption.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

public interface CcarOptionService {
	//차량번호 사용에 관련한 상수
	public static final int UN_USABLE_NUM=1; //사용 불가능한 차량번호
	public static final int USABLE_NUM =2; //사용가능한 차량번호
	
	public int insertCcarOption(CcarOptionVO vo);
	public List<Map<String, Object>> selectAllComCar(SearchVO searchVo);
	public HashMap<String, Object> selectByCcarId(String ccarid);
	public int selectTotalRecord(SearchVO searchVo);
	public int updateCarOption(CcarOptionVO vo);
	public int deleteCarOption(CcarOptionVO vo);
	public int checkCarId(String ccarCarId);
	public int updateCarUseYn(CcarOptionVO vo);
	public List<Map<String, Object>> selectComReserv(SearchVO searchVo);
	public int ReservTotalRecord(SearchVO searchVo);
	public List<Map<String, Object>> selectRentalData(SearchVO searchVo);
	public int todayRentalTR(SearchVO searchVo);
	public List<Map<String, Object>> selectReturnData(SearchVO searchVo);
	public int todayReturnTR(SearchVO searchVo);
	public List<Map<String, Object>> selectRentalIng(SearchVO searchVo);
	public int rentalIngTR(SearchVO searchVo);
	public int updateStatusCgRent(CcarOptionVO vo);
	public int updateStatusCgReturn(CcarOptionVO vo);
	public int updateStatusCgHold(CcarOptionVO vo);
	public int moveHold(List<Map<String, Object>> cCarList);
}
