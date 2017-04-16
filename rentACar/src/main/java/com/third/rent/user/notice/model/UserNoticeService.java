package com.third.rent.user.notice.model;

import java.util.List;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

public interface UserNoticeService {
	//일반 공지게시판
	public List<UserNoticeVO> selectUN(SearchVO searchVo);
	public UserNoticeVO selectByNo(int no);
}
