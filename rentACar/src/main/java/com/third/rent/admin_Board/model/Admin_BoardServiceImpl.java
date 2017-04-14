package com.third.rent.admin_Board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.common.SearchVO;
import com.third.rent.company.notice.model.CompanyNoticeVO;
import com.third.rent.service.notice.model.ServiceCenterNoticeVO;
import com.third.rent.user.notice.model.UserNoticeVO;

@Service
public class Admin_BoardServiceImpl implements Admin_BoardService {

	@Autowired
	private Admin_BoardDAO adDao;
	
	@Override
	public List<ServiceCenterNoticeVO> selectSN(SearchVO searchVo) {		
		return adDao.selectSN(searchVo);
	}

	@Override
	public List<CompanyNoticeVO> selectCN(SearchVO searchVo) {		
		return adDao.selectCN(searchVo);
	}

	@Override
	public List<UserNoticeVO> selectUN(SearchVO searchVo) {		
		return adDao.selectUN(searchVo);
	}

	@Override
	public int selectTotalRecordU(SearchVO searchVo) {
		return adDao.selectTotalRecordU(searchVo);
	}

	@Override
	public int selectTotalRecordC(SearchVO searchVo) {
		return adDao.selectTotalRecordC(searchVo);
	}

	@Override
	public int selectTotalRecordSC(SearchVO searchVo) {
		return adDao.selectTotalRecordSC(searchVo);
	}
	
	

}
