package com.third.rent.admin_User.model;

import java.util.List;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

public interface Admin_UserDAO {
	public List<UserVO> selectAll(SearchVO searchVo);
	
	public int selectTotalRecord(SearchVO searchVo);
	
	public UserVO selectByUserId(String userId);
	
	public List<UserVO> selectInUser(SearchVO searchVo);	
	
	public List<UserVO> selectOutUser(SearchVO searchVo);
	
	public int userWithdraw(String userId);
	
	public String selectPwdByAdminId(String adminId);
	
	public int reRegisterUser(String userId);
	
	public int updateUser(UserVO userVo);
	
	public int selectOutTotalRecord(SearchVO searchVo);
}
