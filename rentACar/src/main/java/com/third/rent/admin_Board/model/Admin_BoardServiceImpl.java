package com.third.rent.admin_Board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.company.notice.model.CompanyNoticeVO;
import com.third.rent.service.notice.model.ServiceCenterNoticeVO;
import com.third.rent.user.notice.model.UserNoticeVO;

@Service
public class Admin_BoardServiceImpl implements Admin_BoardService {

	@Autowired
	private Admin_BoardDAO adDao;
	
	@Override
	public List<ServiceCenterNoticeVO> selectSN() {		
		return adDao.selectSN();
	}

	@Override
	public List<CompanyNoticeVO> selectCN() {		
		return adDao.selectCN();
	}

	@Override
	public List<UserNoticeVO> selectUN() {		
		return adDao.selectUN();
	}
	

}
