package com.third.rent.reservation.model;

import java.util.List;
import java.util.Map;

import com.third.rent.common.SearchVO;

public interface ReservationDAO {
	public List<ReservationVO> selectAll(SearchVO searchVo);
	public List<ReservationVO> selectByUserid(Map<String, Object> map);
	public int selectTotalRecord(String userId);
	public List<Map<String, Object>> selectReservPayInfo(ReservationVO rvo);
	public int selectTotalRecordWithPayInfo(ReservationVO rvo);
	public int updateReservCancel(Map<String, Object> map);
}
