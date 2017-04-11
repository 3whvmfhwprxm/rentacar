package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.user.model.UserService;

@Controller
public class LoginController {
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/inc_user/login.do", method=RequestMethod.GET)
	public String showLogin_get(){
		logger.info("로그인화면 띄우기");
		
		return "inc_user/login";
	}
	
	@RequestMapping(value="/inc_user/login.do", method=RequestMethod.POST)
	public String showLogin_post(){
		
		
		return "inc_user/index";
	}
	
	public String checkUserid(@RequestParam String userid, Model model){
		//1
		logger.info("아이디 중복확인, 파라미터 userid={}",userid);
		//2
		int result=0;
		if(userid!=null && !userid.isEmpty()){
			result=userService.duplicateUserid(userid);
			logger.info("아이디 중복확인 결과 result={}", result);
		}
		//3
		model.addAttribute("result", result);
		model.addAttribute("EXIST_ID", userService.EXIST_ID);
		model.addAttribute("NONE_EXIST_ID", userService.NONE_EXIST_ID);
		
		return "member/checkUserid";
	}
}
