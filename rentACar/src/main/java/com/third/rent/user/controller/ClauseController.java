package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClauseController {
	private static final Logger logger=LoggerFactory.getLogger(ClauseController.class);
	
	@RequestMapping("/inc_user/clause.do")
	public String showIndex(){
		logger.info("이용약관 띄우기");
		
		return "inc_user/clause";
		
	}
}
