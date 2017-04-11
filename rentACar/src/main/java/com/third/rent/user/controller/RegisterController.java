package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {
	private static final Logger logger=LoggerFactory.getLogger(RegisterController.class);
	
	@RequestMapping("/inc_user/register.do")
	public String showRegister(){
		logger.info("회원가입 화면 띄우기");
		
		return "inc_user/register";
		
	}
}
