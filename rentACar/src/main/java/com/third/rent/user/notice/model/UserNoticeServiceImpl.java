package com.third.rent.user.notice.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

@Service
public class UserNoticeServiceImpl implements UserNoticeService{
	@Autowired
	private UserNoticeDAO usernoticeDao;
	
	@Override
	public List<UserNoticeVO> selectUN(SearchVO searchVo) {		
		return usernoticeDao.selectUN(searchVo);
	}

	@Override
	public UserNoticeVO selectByNo(int no) {
		return usernoticeDao.selectByNo(no);
	}

}
