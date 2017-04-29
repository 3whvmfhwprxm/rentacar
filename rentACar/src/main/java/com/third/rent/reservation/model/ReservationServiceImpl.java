package com.third.rent.reservation.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.common.SearchVO;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDAO reservationDao;

	@Override
	public List<ReservationVO> selectByUserid(Map<String, Object> map){
		return reservationDao.selectByUserid(map);
	}

	@Override
	public int selectTotalRecord(String userId) {
		return reservationDao.selectTotalRecord(userId);
	}

	@Override
	public List<ReservationVO> selectAll(SearchVO searchVo) {
		return reservationDao.selectAll(searchVo);
	}

	@Override
	public List<Map<String, Object>> selectReservPayInfo(ReservationVO rvo) {
		return reservationDao.selectReservPayInfo(rvo);
	}

	@Override
	public int selectTotalRecordWithPayInfo(ReservationVO rvo) {
		return reservationDao.selectTotalRecordWithPayInfo(rvo);
	}
	
	
}
