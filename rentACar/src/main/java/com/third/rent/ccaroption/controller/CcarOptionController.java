package com.third.rent.ccaroption.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CcarOptionController {
	private static final Logger logger =
			LoggerFactory.getLogger(CcarOptionController.class);
	
	@RequestMapping("/com_manage/regist_option.do")
	public String optionRegist(){
		
		logger.info("옵션등록화면 보여주기");
		
		return "com_manage/regist_option";
	}
}
