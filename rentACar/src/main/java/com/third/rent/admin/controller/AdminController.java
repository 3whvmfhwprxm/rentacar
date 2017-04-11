package com.third.rent.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	private static final Logger logger
		= LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("/inc_admin/main.do")
	public String main(){
		logger.info("Main화면 띄우기");
		return "inc_admin/main";
	}
}
