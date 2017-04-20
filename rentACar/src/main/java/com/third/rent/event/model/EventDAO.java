package com.third.rent.event.model;

import java.util.List;

import com.third.rent.common.SearchVO;

public interface EventDAO {
	public int insertEvt(EventVO evo);
	public List<EventVO> selectEvt(SearchVO svo);
	public int updateEvt(EventVO evo);
}
