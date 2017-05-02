package com.third.rent.admin_User.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

@Repository
public class Admin_UserMybatis extends SqlSessionDaoSupport
	implements Admin_UserDAO{
	private String namespace="config.mybatis.mapper.oracle.admin_User";
	
	public List<UserVO> selectAll(SearchVO searchVo){
		List<UserVO> alist
			=getSqlSession().selectList(namespace+".selectAllUser", searchVo);

		return alist;
	}
	
	public int selectTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectTotalRecord", searchVo);
	}
	
	public UserVO selectByUserId(String userId){
		return getSqlSession().selectOne(namespace+".selectByUserId", userId);
	}

	public List<UserVO> selectInUser(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectInUser", searchVo);
	}

	@Override
	public List<UserVO> selectOutUser(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectOutUser", searchVo);
	}
}
