package com.third.rent.admin_User.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

@Service
public class Admin_UserServiceImpl implements Admin_UserService{
	@Autowired
	private Admin_UserDAO adminDao;
	
	public List<UserVO> selectAll(SearchVO searchVo){
		return adminDao.selectAll(searchVo);
	}
	
	public int selectTotalRecord(SearchVO searchVo){
		return adminDao.selectTotalRecord(searchVo);
	}

	public List<UserVO> selectByUserId(String userId) {
		return adminDao.selectByUserId(userId);
	}
}
