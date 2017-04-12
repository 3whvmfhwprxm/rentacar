package com.third.rent.admin.board.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.third.rent.company.notice.model.CompanyNoticeVO;
import com.third.rent.service.notice.model.ServiceCenterNoticeVO;
import com.third.rent.user.notice.model.UserNoticeVO;

@Service
public class Admin_BoardServiceImpl implements Admin_BoardService {

	@Override
	public List<ServiceCenterNoticeVO> selectSN() {
		
		return null;
	}

	@Override
	public List<CompanyNoticeVO> selectCN() {
		
		return null;
	}

	@Override
	public List<UserNoticeVO> selectUN() {
		
		return null;
	}
	

}
