package com.third.rent.ccaroption.model;

import java.util.List;
import java.util.Map;

public class CcarListVO {
	private List<Map<String, Object>> cCarListItems;

	public List<Map<String, Object>> getcCarListItems() {
		return cCarListItems;
	}

	public void setcCarListItems(List<Map<String, Object>> cCarListItems) {
		this.cCarListItems = cCarListItems;
	}

	@Override
	public String toString() {
		return "CcarListVO [cCarListItems=" + cCarListItems + "]";
	}

	
	
}
