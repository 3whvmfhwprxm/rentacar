package com.third.rent.ccaroption.model;

import java.util.List;
import java.util.Map;

public class cCarListVO {
	private List<Map<String, Object>> cCarListVo;

	public List<Map<String, Object>> getcCarListVo() {
		return cCarListVo;
	}

	public void setcCarListVo(List<Map<String, Object>> cCarListVo) {
		this.cCarListVo = cCarListVo;
	}

	@Override
	public String toString() {
		return "cCarListVO [cCarListVo=" + cCarListVo + "]";
	}
	
	
}
