package com.third.rent.user.model;

public interface UserDAO {
	public int insertUser(UserVO vo);
	public int duplicateUserid(String userId);
	public UserVO selectByUserid(String userId);
	public String selectPwd(String userId);
	public int updateUser(UserVO vo);
	public String selectSearchid(UserVO vo);
	public String selectSearchpwd(UserVO vo);
	public int outMember(String userid);
}
