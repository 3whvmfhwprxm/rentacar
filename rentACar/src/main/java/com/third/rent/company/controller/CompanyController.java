package com.third.rent.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/login_company")
public class CompanyController {
	private static final Logger logger
		= LoggerFactory.getLogger(CompanyController.class);
	
	@RequestMapping("/companyMain.do")
	public String company(){
		logger.info("업체메인화면 보여주기");
		
		return "login_company/companyMain";
	}
	
	@RequestMapping("/com_index.do")
	public String login_company(){
		logger.info("업체 로그인  보여주기");
		
		return "login_company/com_login";
	}
	
	@RequestMapping("/login.do")
	public String login_post(){
		logger.info("업체 로그인  보여주기");
		
		return "login_company/com_login";
	}
}
