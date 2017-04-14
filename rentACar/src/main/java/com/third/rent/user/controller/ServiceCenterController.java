package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.user.notice.model.UserNoticeService;

@Controller
public class ServiceCenterController {
	private static final Logger logger=LoggerFactory.getLogger(ServiceCenterController.class);
	@Autowired
	private UserNoticeService usernoticeService;
	
	@RequestMapping("/inc_user/serviceCenter.do")
	public String showServiceCenter(Model model){
		logger.info("고객센터 화면 띄우기 ");
		
	

		//뷰페이지 리턴
		return "inc_user/serviceCenter";
	}
}
