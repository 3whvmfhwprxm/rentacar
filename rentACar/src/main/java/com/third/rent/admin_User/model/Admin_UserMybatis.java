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
	
	public List<UserVO> selectByUserId(String userId){
		List<UserVO> listByUser = getSqlSession().selectList(namespace+".selectByUserId", userId);
		
		return listByUser;
	}
}
