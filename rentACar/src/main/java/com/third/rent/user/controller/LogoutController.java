package com.third.rent.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {
	private static final Logger logger=LoggerFactory.getLogger(LogoutController.class);
	
	@RequestMapping("/inc_user/logout.do")
	public String logout(HttpSession session){
		logger.info("로그아웃 처리, 파라미터");

		session.invalidate();
		
		return "redirect:/inc_user/index.do";
	}
}
