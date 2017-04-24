package com.third.rent.ccaroption.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.third.rent.common.SearchVO;

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
}
