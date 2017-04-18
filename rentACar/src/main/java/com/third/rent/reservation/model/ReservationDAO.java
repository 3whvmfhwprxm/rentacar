package com.third.rent.reservation.model;

import java.util.List;
import java.util.Map;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

public interface ReservationDAO {
	public List<ReservationVO> selectAll(SearchVO searchVo);
	public List<ReservationVO> selectByUserid(Map<String, Object> map);
	public int selectTotalRecord(String userId);
}
