package com.third.rent.admin_balCalc.model;

import java.util.List;

public class BalCalcVOlist {
	private List<BalCalcVO> ballist;

	public List<BalCalcVO> getBallist() {
		return ballist;
	}

	public void setBallist(List<BalCalcVO> ballist) {
		this.ballist = ballist;
	}

	@Override
	public String toString() {
		return "BalCalcVOlist [ballist=" + ballist + "]";
	}
}
