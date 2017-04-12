package com.third.rent.user.model;

public interface UserDAO {
	public int insertUser(UserVO vo);
	public int duplicateUserid(String userId);
	public UserVO selectByUserid(String userId);
	public String selectPwd(String userId);
}
