package com.third.rent.admin.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDao;
	
	public List<UserVO> selectAll(SearchVO searchVo){
		return adminDao.selectAll(searchVo);
	}
	
	public int selectTotalRecord(SearchVO searchVo){
		return adminDao.selectTotalRecord(searchVo);
	}
}
