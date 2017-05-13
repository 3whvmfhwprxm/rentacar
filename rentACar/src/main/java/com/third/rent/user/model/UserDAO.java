package com.third.rent.user.model;

public interface UserDAO {
	public int insertUser(UserVO vo);
	public int duplicateUserid(String userId);
	public UserVO selectByUserid(String userId);
	public String selectPwd(String userId);
	public int updateUser(UserVO vo);
	public String selectSearchid(UserVO vo);
	/*public String selectSearchpwd(UserVO vo);*/
	public int returnUserCount(UserVO vo);	//아이디와 이메일이 일치하는 유저의 수를 리턴해주는 메서드
	public int updateNewRandomPwd(UserVO uvo);	//새로운 랜덤 패스워드를 업데이트하는 메서드
	public int outMember(String userid);
}
