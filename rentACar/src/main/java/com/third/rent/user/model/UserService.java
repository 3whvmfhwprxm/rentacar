package com.third.rent.user.model;

public interface UserService {
	//아이디 중복확인에서 사용하는 상수
	public static final int EXIST_ID=1;  //이미 해당 아이디가 존재함
	public static final int NONE_EXIST_ID=0; //아이디가 존재하지 않음

	//로그인 처리에 사용하는 상수
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int ID_NONE=2;   //아이디가 없는 경우
	public static final int PWD_DISAGREE=3; //비밀번호가 일치하지 않는 경우
	
	public int insertUser(UserVO vo);
	public int loginCheck(String userid, String userPwd);
	public int duplicateUserid(String userId);
	public UserVO selectByUserid(String userId);
	public int updateUser(UserVO vo);
	public String selectSearchid(UserVO vo);
	/*public String selectSearchpwd(UserVO vo);*/
	public int returnUserCount(UserVO vo);	//아이디와 이메일이 일치하는 유저의 수를 리턴해주는 메서드
	public int updateNewRandomPwd(UserVO uvo);	//새로운 랜덤 패스워드를 업데이트하는 메서드
	public int outMember(String userid);
}
