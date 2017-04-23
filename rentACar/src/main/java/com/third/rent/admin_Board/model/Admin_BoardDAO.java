package com.third.rent.admin_Board.model;

import java.util.List;

import com.third.rent.common.SearchVO;
import com.third.rent.company.notice.model.CompanyNoticeVO;
import com.third.rent.service.notice.model.ServiceCenterNoticeVO;
import com.third.rent.user.notice.model.UserNoticeVO;

public interface Admin_BoardDAO {
	
	//일반 공지게시판
	public List<UserNoticeVO> selectUN(SearchVO searchVo);
	
	//상담사 공지게시판
	public List<ServiceCenterNoticeVO> selectSN(SearchVO searchVo);
	
	//업체 공지게시판
	public List<CompanyNoticeVO> selectCN(SearchVO searchVo);	
	public int selectTotalRecordU(SearchVO searchVo);
	public int selectTotalRecordC(SearchVO searchVo);
	public int selectTotalRecordSC(SearchVO searchVo);
	
	
	
}
