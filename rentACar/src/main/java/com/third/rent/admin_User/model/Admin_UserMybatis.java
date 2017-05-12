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
	
	@Override
	public List<UserVO> selectAll(SearchVO searchVo){
		return getSqlSession().selectList(namespace+".selectAllUser", searchVo);
	}
	
	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectTotalRecord", searchVo);
	}
	
	@Override
	public UserVO selectByUserId(String userId){
		return getSqlSession().selectOne(namespace+".selectByUserId", userId);
	}

	@Override
	public List<UserVO> selectInUser(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectInUser", searchVo);
	}

	@Override
	public List<UserVO> selectOutUser(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectOutUser", searchVo);
	}

	@Override
	public int userWithdraw(String userId) {
		return getSqlSession().update(namespace+".userWithdraw", userId);
	}

	@Override
	public String selectPwdByAdminId(String adminId) {
		return getSqlSession().selectOne(namespace+".selectPwdByAdminId", adminId);
	}

	@Override
	public int reRegisterUser(String userId) {
		return getSqlSession().update(namespace+".userReregister", userId);
	}

	@Override
	public int updateUser(UserVO userVo) {
		return getSqlSession().update(namespace+".updateUser", userVo);
	}

	@Override
	public int selectOutTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectOutTotalRecord", searchVo);
	}
}
