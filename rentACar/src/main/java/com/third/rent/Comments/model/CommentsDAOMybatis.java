package com.third.rent.Comments.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.common.SearchVO;

@Repository
public class CommentsDAOMybatis extends SqlSessionDaoSupport implements CommentsDAO{
	private String namespace="config.mybatis.mapper.oracle.comments";

	@Override
	public List<CommentsVO> selectAll(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectAllComment", searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectTotalRecord", searchVo);
	}

	@Override
	public int writeComment(CommentsVO commentsVo) {
		return getSqlSession().insert(namespace+".writeComment", commentsVo);
	}

	@Override
	public Map<String, Object> selectComidByReservNum(String reservNum) {
		return getSqlSession().selectOne(namespace+".selectComidByReservNum", reservNum);
	}
	
}
