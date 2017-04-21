package com.third.rent.company.controller;

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




@Controller
@RequestMapping("/com_manage")
public class CompanyEpilogueController {

	private static final Logger logger=LoggerFactory.getLogger(CompanyEpilogueController.class);
	
	@Autowired
	private Admin_BoardService adService;
	
	@RequestMapping("/company_epilogue.do")
	public String consel_index(){
		
		logger.info("후기화면 구현");
		
		return "com_manage/company_epilogue";
	}
	
	@RequestMapping("/company_announcement.do")
	public String consel_nonmember(){
		
		logger.info("공지사항 화면 구현");
		
		return "com_manage/company_announcement";
		
	}
	
	/*@RequestMapping("/company_announcement.do")
	public String companyAnnouncement(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("업체 공지사항 화면표시 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<CompanyNoticeVO> cnList=adService.selectCN(searchVo);
		logger.info("업체 공지사항 리스트 수, cnList.size()={}", cnList.size());
		
		int totalRecord=adService.selectTotalRecordC(searchVo);
		logger.info("업체 공지사항 전체수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("cnList", cnList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "com_manage/company_announcement";
	}*/
	
	
	@RequestMapping("/company_revenue.do")
	public String consultation_inquiry(){
		
		logger.info("매출 통계 화면 구현");
		
		return "com_manage/company_revenue";
		
	}
	

	

	
	
}
