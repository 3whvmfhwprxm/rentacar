package com.third.rent.user.model;

public interface UserDAO {
	public int insertUser(UserVO vo);
	public int duplicateUserid(String userid);
}
