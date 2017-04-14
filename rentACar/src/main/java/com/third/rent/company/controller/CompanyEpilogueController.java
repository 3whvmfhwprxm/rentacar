package com.third.rent.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
@RequestMapping("/com_manage")
public class CompanyEpilogueController {

	private static final Logger logger=LoggerFactory.getLogger(CompanyEpilogueController.class);
	
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
	
	@RequestMapping("/company_revenue.do")
	public String consultation_inquiry(){
		
		logger.info("매출 통계 화면 구현");
		
		return "com_manage/company_revenue";
		
	}
	

	

	
	
}
