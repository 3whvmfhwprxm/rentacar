package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserZipcodeController {
	private static final Logger logger=LoggerFactory.getLogger(UserZipcodeController.class);
	
	@RequestMapping("/userzipcode/jusoPopup.do")
	public String userZipcode(){
		logger.info("우편번호 검색");
		
		return "userzipcode/jusoPopup";
	}
}
