package com.third.rent.admin_balCalc.model;

import java.util.List;

public class BalCalcVOlist {
	private List<BalCalcVO> balanceItems;

	public List<BalCalcVO> getBalanceItems() {
		return balanceItems;
	}

	public void setBalanceItems(List<BalCalcVO> balanceItems) {
		this.balanceItems = balanceItems;
	}

	@Override
	public String toString() {
		return "BalCalcVOlist [balanceItems=" + balanceItems + "]";
	}
	
}
