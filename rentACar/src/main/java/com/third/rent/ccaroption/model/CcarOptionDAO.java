package com.third.rent.ccaroption.model;

import java.util.List;

public interface CcarOptionDAO {
	
	public int insertCcarOption(CcarOptionVO vo);
	public List<CcarOptionVO> selectAllCcar();
}
