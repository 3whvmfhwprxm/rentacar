package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/inc_user/login.do")
	public String showLogin(){
		logger.info("로그인약화면 띄우기");
		
		return "inc_user/login";
		
	}
}
