package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConfirmController {
	private static final Logger logger=LoggerFactory.getLogger(ConfirmController.class);
	
	@RequestMapping("/inc_user/confirm.do")
	public String showConfirm(){
		logger.info("예약확인 화면 띄우기");
		
		return "inc_user/confirm";
		
	}
}
