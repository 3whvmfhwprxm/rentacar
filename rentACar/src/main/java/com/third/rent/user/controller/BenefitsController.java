package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BenefitsController {
	private static final Logger logger=LoggerFactory.getLogger(BenefitsController.class);
	
	@RequestMapping("/inc_user/benefits.do")
	public String showBenefits(){
		logger.info("이용혜택화면 띄우기");
		
		return "inc_user/benefits";
		
	}
}
