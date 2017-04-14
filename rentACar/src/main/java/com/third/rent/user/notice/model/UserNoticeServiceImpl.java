package com.third.rent.user.notice.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserNoticeServiceImpl implements UserNoticeService{
	@Autowired
	private UserNoticeDAO usernoticeDao;

}
