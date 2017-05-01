package com.third.rent.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.admin.model.AdminService;
import com.third.rent.admin_User.controller.Admin_UserController;

@Controller
@RequestMapping("/administrator")
public class admin_MainController {
	private static final Logger logger 
		= LoggerFactory.getLogger(Admin_UserController.class);

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin_Main.do")
	public String main(Model model) {
		logger.info("Main화면 띄우기");
		
		int userCount = adminService.selectCountUser();
		logger.info("userCount");
		
		int companyCount = adminService.selectCountCompany();
		logger.info("companyCount");
		
		int reservationCount = adminService.selectCountReservation();
		logger.info("reservationCount");
		
		int payinfoCount = adminService.selectCountPayinfo();
		logger.info("payinfoCount");
		
		int selectSumPayMoney = adminService.selectSumPayMoney();
		logger.info("selectSumPayMoney");
		
		int selectSumPayDiscount = adminService.selectSumPayDiscount();
		logger.info("selectSumPayDiscount");
		
		model.addAttribute("userCount", userCount);
		model.addAttribute("companyCount", companyCount);
		model.addAttribute("reservationCount", reservationCount);
		model.addAttribute("payinfoCount", payinfoCount);
		model.addAttribute("selectSumPayMoney", selectSumPayMoney);
		model.addAttribute("selectSumPayDiscount", selectSumPayDiscount);

		return "administrator/admin_Main";
	}
}
