package com.third.rent.user.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.third.rent.admin_Board.model.Admin_BoardService;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;
import com.third.rent.common.userUtility;
import com.third.rent.user.notice.model.UserNoticeService;
import com.third.rent.user.notice.model.UserNoticeVO;

@Controller
public class ServiceCenterController {
	private static final Logger logger=LoggerFactory.getLogger(ServiceCenterController.class);
	@Autowired
	private UserNoticeService usernoticeService;
	@Autowired
	private Admin_BoardService adService;
	
	@RequestMapping(value="/user/serviceCenter.do", method=RequestMethod.GET)
	public String showServiceCenter(@ModelAttribute SearchVO searchVo, Model model){
		//1
		logger.info("고객센터 화면 띄우기 ");
		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(userUtility.RESERVATION_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(userUtility.RESERVATION_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(userUtility.RESERVATION_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<UserNoticeVO> unList=usernoticeService.selectUN(searchVo);
		logger.info("고객 공지사항 리스트 수, unList.size()={}", unList.size());
		
		int totalRecord=adService.selectTotalRecordU(searchVo);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("unList", unList);
		model.addAttribute("pagingInfo", pagingInfo);
		//뷰페이지 리턴
		return "user/serviceCenter";
	}
}
