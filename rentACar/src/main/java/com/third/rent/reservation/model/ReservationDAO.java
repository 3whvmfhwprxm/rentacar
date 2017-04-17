package com.third.rent.reservation.model;

import com.third.rent.user.model.UserVO;

public interface ReservationDAO {
	public ReservationVO selectByUserid(String userId);
}
