package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GreetingController {
	private static final Logger logger=LoggerFactory.getLogger(GreetingController.class);
	
	@RequestMapping("/user/greeting.do")
	public String showgreeting(){
		logger.info("인사말화면 띄우기");
		
		return "user/greeting";
		
	}
	
	@RequestMapping("/user/position.do")
	public String showposition(){
		logger.info("회사위치 화면 띄우기");
		
		return "user/position";
		
	}
	
	@RequestMapping("/user/guide.do")
	public String showguide(){
		logger.info("지점안내 화면 띄우기");
		
		return "user/guide";
		
	}
}
