package com.third.rent.payInfo.model;

import java.util.List;

public class PayInfoListVO {
	private List<PayInfoVO> payItems;

	public List<PayInfoVO> getPayItems() {
		return payItems;
	}

	public void setPayItems(List<PayInfoVO> payItems) {
		this.payItems = payItems;
	}

	@Override
	public String toString() {
		return "PayInfoListVO [payItems=" + payItems + "]";
	}
	
}
