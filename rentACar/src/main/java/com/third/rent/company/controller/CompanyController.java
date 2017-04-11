package com.third.rent.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyController {
	private static final Logger logger
		= LoggerFactory.getLogger(CompanyController.class);
	
	@RequestMapping("/login_company/companyMain.do")
	public String company(){
		logger.info("업체메인화면 보여주기");
		
		return "login_company/companyMain";
	}
}
