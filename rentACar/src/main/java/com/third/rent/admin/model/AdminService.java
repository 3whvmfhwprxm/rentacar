package com.third.rent.admin.model;

import java.util.List;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

public interface AdminService {
	public List<UserVO> selectAll(SearchVO searchVo);
	
	public int selectTotalRecord(SearchVO searchVo);
}
