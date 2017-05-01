package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	private static final Logger logger=LoggerFactory.getLogger(ReviewController.class);
	
	@RequestMapping("/user/review.do")
	public String showReview(){
		logger.info("이용후기 화면 띄우기");
		
		return "user/review";
		
	}
}
