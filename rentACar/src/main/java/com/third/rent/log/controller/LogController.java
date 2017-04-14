package com.third.rent.log.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/administrator")
public class LogController {
	private static final Logger logger
		= LoggerFactory.getLogger(LogController.class);
	
	@RequestMapping(value="/log/logIn.do", method=RequestMethod.GET)
	public String logIn_get(){
		logger.info("로그인화면 보여주기");
		return "administrator/log/logIn";
	}
}
