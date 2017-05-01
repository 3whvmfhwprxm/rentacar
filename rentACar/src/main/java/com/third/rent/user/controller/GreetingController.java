package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GreetingController {
	private static final Logger logger=LoggerFactory.getLogger(GreetingController.class);
	
	@RequestMapping("/user/greeting.do")
	public String showBenefits(){
		logger.info("인사말화면 띄우기");
		
		return "user/greeting";
		
	}
}
