package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewWriteController {
	private static final Logger logger=LoggerFactory.getLogger(ReviewWriteController.class);
	
	@RequestMapping("/user/reviewWrite.do")
	public String showBenefits(){
		logger.info("리뷰작성화면 띄우기");
		
		return "user/reviewWrite";
		
	}
}
