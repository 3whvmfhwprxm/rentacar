package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.user.model.UserService;

@Controller
public class CheckUserIdController {
	private static final Logger logger=LoggerFactory.getLogger(CheckUserIdController.class);

	@Autowired
	private UserService userService;
	
	@RequestMapping("/inc_user/checkUserid.do")
	public String checkUserid(@RequestParam String userId, Model model){
		//1
		logger.info("아이디 중복확인, 파라미터 userid={}", userId);

		//2
		int result=0;
		if(userId!=null && !userId.isEmpty()){
			result = userService.duplicateUserid(userId);
			logger.info("아이디 중복확인 결과 result={}", result);
		}

		//3
		model.addAttribute("result", result);
		model.addAttribute("EXIST_ID", UserService.EXIST_ID);
		model.addAttribute("NONE_EXIST_ID", UserService.NONE_EXIST_ID);

		return "inc_user/checkUserid";
	}
}
