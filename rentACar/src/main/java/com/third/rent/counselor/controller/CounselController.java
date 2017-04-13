package com.third.rent.counselor.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CounselController {
	
	private static final Logger logger=LoggerFactory.getLogger(CounselController.class);
	
	
	@RequestMapping("/inc_counselor/consel_index.do")
	public String consel_index(){
		
		logger.info("상담화면 구현");
		
		return "inc_counselor/consel_index";
	}
	
	@RequestMapping("/counselor/consel_nonmember.do")
	public String consel_nonmember(){
		
		logger.info("비회원 화면 구현");
		
		return "counselor/consel_nonmember";
		
	}
	
	@RequestMapping("/counselor/consultation_inquiry.do")
	public String consultation_inquiry(){
		
		logger.info("상담문의 화면 구현");
		
		return "counselor/consultation_inquiry";
		
	}
	
	@RequestMapping("/counselor/consultation_notice_board.do")
	public String consultation_notice_board(){
		
		logger.info("게시판 화면 구현");
		
		return "counselor/consultation_notice_board";
	}
	
	@RequestMapping("/counselor/consel_statistics.do")
	public String consel_statistics(){
		
		logger.info("게시판 화면 구현");
		
		return "counselor/consel_statistics";
		
	}
	
	@RequestMapping("/counselor/counselor_manage.do")
	public String counselor_manage(){
		
		logger.info("상담사 관리 화면 구현");
		
		return "counselor/counselor_manage";
		
	}
}
