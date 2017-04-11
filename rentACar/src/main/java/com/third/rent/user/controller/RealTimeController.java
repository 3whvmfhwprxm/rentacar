package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RealTimeController {
	private static final Logger logger=LoggerFactory.getLogger(RealTimeController.class);
	
	@RequestMapping("/inc_user/realTime.do")
	public String showRealTime(){
		logger.info("실시간예약화면 띄우기");
		
		return "inc_user/realTime";
		
	}
}
