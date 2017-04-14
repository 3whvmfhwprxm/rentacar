package com.third.rent.user.notice.contorller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserNoticeController {
	private static final Logger logger=LoggerFactory.getLogger(UserNoticeController.class);
	
	@RequestMapping(value="/usernotice/usernotice.do", method=RequestMethod.GET)
	public String shownotice_get(){
		logger.info("공지사항디테일화면");
		
		return "usernotice/usernotice";
		
	}
}
