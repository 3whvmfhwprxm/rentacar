package com.third.rent.ccaroption.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.third.rent.ccaroption.model.CcarOptionService;
import com.third.rent.ccaroption.model.CcarOptionVO;

@Controller
@RequestMapping("/com_manage")
public class CcarOptionController {
	private static final Logger logger =
			LoggerFactory.getLogger(CcarOptionController.class);
	
	@Autowired
	private CcarOptionService ccarOptionService;
	
	@RequestMapping(value="/regist_option.do", method=RequestMethod.GET)
	public String optionRegist_get(){
		
		logger.info("옵션등록화면 보여주기");
		
		return "com_manage/regist_option";
	}
	
	@RequestMapping(value="/regist_option.do", method=RequestMethod.POST)
	public String optionRegist_post(@ModelAttribute CcarOptionVO vo,
			Model model){
		logger.info("옵션등록처리, 파라미터 vo={}", vo);
		
		int cnt = ccarOptionService.insertCcarOption(vo);
		
		String msg="", url="/login_company/companyMain.do";
		if(cnt>0){
			msg="옵션등록성공";
		}else{
			msg="옵션등록실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
}
