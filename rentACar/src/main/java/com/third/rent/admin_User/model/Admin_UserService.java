package com.third.rent.admin_User.model;

import java.util.List;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

public interface Admin_UserService {
	public static final int EXIST_ID=1;
	public static final int NONE_EXIST_ID=2;
	
	public static final int LOGIN_OK=1;
	public static final int ID_NONE=2;
	public static final int PWD_DISAGREE=3;
	
	public List<UserVO> selectAll(SearchVO searchVo);
	
	public int selectTotalRecord(SearchVO searchVo);
	
	public UserVO selectByUserId(String userId);
	
	public List<UserVO> selectInUser(SearchVO searchVo);
	
	public List<UserVO> selectOutUser(SearchVO searchVo);
	
	public int userWithdraw(String userId);
	
	public int loginCheck(String adminId, String adminPwd);
	
	public int userMultiWithdraw(List<UserVO> userList);
	
	public int userMultiReregister(List<UserVO> userList);
	
	public int updateUser(String userId);
}
