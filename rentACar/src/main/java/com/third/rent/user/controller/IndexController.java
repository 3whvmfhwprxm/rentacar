package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	private static final Logger logger=LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping("/inc_user/index.do")
	public String showIndex(){
		logger.info("메인화면 띄우기");
		
		return "inc_user/index";
		
	}
}
