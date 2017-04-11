package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ServiceCenterController {
	private static final Logger logger=LoggerFactory.getLogger(ServiceCenterController.class);
	
	@RequestMapping("/inc_user/serviceCenter.do")
	public String showServiceCenter(){
		logger.info("고객센터 화면 띄우기");
		
		return "inc_user/serviceCenter";
		
	}
}
