package com.third.rent.user.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDao;

	@Override
	public int insertUser(UserVO vo) {
		return userDao.insertUser(vo);
	}

	@Override
	public int duplicateUserid(String userId) {
		return userDao.duplicateUserid(userId);
	}

	@Override
	public int loginCheck(String userId, String userPwd) {
		int result=0;
		String dbPwd=userDao.selectPwd(userId);
		
		if(dbPwd!=null && !dbPwd.isEmpty()){
			//아이디는 존재
			if(userPwd.equals(dbPwd)){
				result=LOGIN_OK;	//비밀번호도 일치-로그인 성공
			}else{
				result=PWD_DISAGREE;	//비밀번호 불일치
			}
		}else{ //해당 아이디가 없는 경우
			result=ID_NONE;
		}
		return result;
	}

	@Override
	public UserVO selectByUserid(String userId) {
		return userDao.selectByUserid(userId);
	}

	@Override
	public int updateUser(UserVO vo) {
		return userDao.updateUser(vo);
	}

	@Override
	public String selectSearchid(UserVO vo) {
		return userDao.selectSearchid(vo);
	}

	@Override
	public String selectSearchpwd(UserVO vo) {
		return userDao.selectSearchpwd(vo);
	}

	@Override
	public int outMember(String userid) {
		return userDao.outMember(userid);
	}
}
