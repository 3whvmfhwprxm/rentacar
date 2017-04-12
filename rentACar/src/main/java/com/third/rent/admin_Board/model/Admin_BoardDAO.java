package com.third.rent.admin_Board.model;

import java.util.List;

import com.third.rent.company.notice.model.CompanyNoticeVO;
import com.third.rent.service.notice.model.ServiceCenterNoticeVO;
import com.third.rent.user.notice.model.UserNoticeVO;

public interface Admin_BoardDAO {
	
	//상담사 공지게시판
	public List<ServiceCenterNoticeVO> selectSN();
	
	//업체 공지게시판
	public List<CompanyNoticeVO> selectCN();
		
	//일반 공지게시판
	public List<UserNoticeVO> selectUN();
	
}
