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
}
