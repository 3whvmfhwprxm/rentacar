package com.third.rent.admin_Board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.admin_Board.model.Admin_BoardService;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;
import com.third.rent.company.notice.model.CompanyNoticeVO;
import com.third.rent.service.notice.model.ServiceCenterNoticeVO;
import com.third.rent.user.notice.model.UserNoticeVO;

@Controller
public class Admin_BoardController {
	
	private static final Logger logger=LoggerFactory.getLogger(Admin_BoardController.class);
	
	@Autowired
	private Admin_BoardService adService;
	
	@RequestMapping("/admin/Board/uNotice.do")
	public String showUNotice(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("관리자 시스템 - 고객 공지사항 관리 화면표시 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<UserNoticeVO> unList=adService.selectUN(searchVo);
		logger.info("고객 공지사항 리스트 수, unList.size()={}", unList.size());
		
		int totalRecord=adService.selectTotalRecordU(searchVo);
		logger.info("고객 공지사항 전체수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("unList", unList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "administrator/board_management/UNoticeBoardMng";
	}
	
	@RequestMapping("/admin/Board/scNotice.do")
	public String showSCNotice(@ModelAttribute SearchVO searchVo, Model model){		
		logger.info("관리자 시스템 - 상담센터 공지사항 관리 화면표시 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<ServiceCenterNoticeVO> scnList=adService.selectSN(searchVo);
		logger.info("상담자센터 공지사항 리스트 수, scnList.size()={}", scnList.size());
		
		model.addAttribute("scnList", scnList);
		
		return "administrator/board_management/SCNoticeBoardMng";
	}
	
	@RequestMapping("/admin/Board/cNotice.do")
	public String showCNotice(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("관리자 시스템 - 업체 공지사항 관리 화면표시 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<CompanyNoticeVO> cnList=adService.selectCN(searchVo);
		logger.info("업체 공지사항 리스트 수, cnList.size()={}", cnList.size());
		
		model.addAttribute("cnList", cnList);
		
		return "administrator/board_management/CNoticeBoardMng";
	}
	
}
