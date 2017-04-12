package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.third.rent.user.model.UserService;
import com.third.rent.user.model.UserVO;

@Controller
public class RegEditController {
	private static final Logger logger=LoggerFactory.getLogger(RegEditController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/inc_user/register.do", method=RequestMethod.GET)
	public String insertLogin_get(){
		logger.info("회원가입화면 띄우기");
		
		return "inc_user/register";
	}
	
	@RequestMapping(value="/inc_user/register.do",method=RequestMethod.POST)
	public String insertLogin_post(@ModelAttribute UserVO vo){
		logger.info("회원가입, vo={}",vo);
		
		int cnt=userService.insertUser(vo);
		logger.info("회원가입, cnt={}",cnt);
		return "inc_user/index";
	}
}
