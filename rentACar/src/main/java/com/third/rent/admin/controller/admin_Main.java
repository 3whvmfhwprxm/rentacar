package com.third.rent.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.admin_User.controller.Admin_UserController;

@Controller
@RequestMapping("/administrator")
public class admin_Main {
	private static final Logger logger 
		= LoggerFactory.getLogger(Admin_UserController.class);

	@RequestMapping("/Main.do")
	public String main() {
		logger.info("Main화면 띄우기");
		return "administrator/Main";
	}
}
