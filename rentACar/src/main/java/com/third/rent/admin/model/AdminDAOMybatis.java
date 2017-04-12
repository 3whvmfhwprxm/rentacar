package com.third.rent.admin.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

@Repository
public class AdminDAOMybatis extends SqlSessionDaoSupport
	implements AdminDAO{
	private String namespace="config.mybatis.mapper.oracle.admin";
	
	public List<UserVO> selectAll(SearchVO searchVo){
		List<UserVO> alist
			=getSqlSession().selectList(namespace+".selectAllUser", searchVo);

		return alist;
	}
	
	public int selectTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace
				+".selectTotalRecord", searchVo);
	}
}
