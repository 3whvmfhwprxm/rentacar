package com.third.rent.zipcode.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class zipcodeController {
	private static final Logger logger=LoggerFactory.getLogger(zipcodeController.class);
	
	@RequestMapping("/administrator/zipcode/jusoPopup.do")
	public String getZipcode(){
		logger.info("우편번호 검색");
		
		return "administrator/zipcode/jusoPopup";
	}
}
