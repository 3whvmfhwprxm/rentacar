package com.third.rent.event.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.common.SearchVO;

@Repository
public class EventDAOmyBatis extends SqlSessionDaoSupport implements EventDAO {

	private String nameSpace="config.mybatis.mapper.oracle.event";

	@Override
	public int insertEvt(EventVO evo) {
		return getSqlSession().insert(nameSpace+".", evo);
	}

	@Override
	public List<EventVO> selectEvt(SearchVO svo) {
		return getSqlSession().selectList(nameSpace+".", svo);
	}

	@Override
	public int updateEvt(EventVO evo) {
		return getSqlSession().update(nameSpace, evo);
	}	
}
