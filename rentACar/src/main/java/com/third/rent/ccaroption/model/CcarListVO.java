package com.third.rent.ccaroption.model;

import java.util.List;

public class CcarListVO {

	private List<CcarOptionVO> cCarItems;

	public List<CcarOptionVO> getcCarItems() {
		return cCarItems;
	}

	public void setcCarItems(List<CcarOptionVO> cCarItems) {
		this.cCarItems = cCarItems;
	}

	@Override
	public String toString() {
		return "CcarListVO [cCarItems=" + cCarItems + "]";
	}
	
	
	
}
