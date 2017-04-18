package com.third.rent.admin_User.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

@Service
public class Admin_UserServiceImpl implements Admin_UserService{
	@Autowired
	private Admin_UserDAO adminUserDao;
	
	public List<UserVO> selectAll(SearchVO searchVo){
		return adminUserDao.selectAll(searchVo);
	}
	
	public int selectTotalRecord(SearchVO searchVo){
		return adminUserDao.selectTotalRecord(searchVo);
	}

	public UserVO selectByUserId(String userId) {
		return adminUserDao.selectByUserId(userId);
	}
}
