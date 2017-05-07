package com.third.rent.reservation.model;

import java.util.List;

public class ReservListVO {
	private List<ReservationVO> reservItems;

	public List<ReservationVO> getReservItems() {
		return reservItems;
	}

	public void setReservItems(List<ReservationVO> reservItems) {
		this.reservItems = reservItems;
	}

	@Override
	public String toString() {
		return "ReservListVO [reservItems=" + reservItems + "]";
	}
	
}
