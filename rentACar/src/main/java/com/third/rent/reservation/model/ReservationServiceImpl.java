package com.third.rent.reservation.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.user.model.UserVO;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDAO reservationDao;

	@Override
	public ReservationVO selectByUserid(String userId) {
		return reservationDao.selectByUserid(userId);
	}
}
