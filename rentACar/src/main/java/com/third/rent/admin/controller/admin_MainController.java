package com.third.rent.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.admin.model.AdminService;
import com.third.rent.admin_User.controller.Admin_UserController;
import com.third.rent.payInfo.model.PayInfoService;
import com.third.rent.payInfo.model.PayInfoVO;

@Controller
@RequestMapping("/administrator")
public class admin_MainController {
	private static final Logger logger 
		= LoggerFactory.getLogger(Admin_UserController.class);

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private PayInfoService payInfoService;
	
	@RequestMapping("/admin_Main.do")
	public String main(@ModelAttribute PayInfoVO payInfoVo, Model model) {
		logger.info("Main화면 띄우기");
		
		int userCount = adminService.selectCountUser();
		logger.info("userCount");
		
		int companyCount = adminService.selectCountCompany();
		logger.info("companyCount");
		
		int reservationCount = adminService.selectCountReservation();
		logger.info("reservationCount");
		
		int payinfoCount = adminService.selectCountPayinfo();
		logger.info("payinfoCount");
		
		List<PayInfoVO> PayInfoList = payInfoService.recentTenPayInfo(payInfoVo);
		logger.info("PayInfoList.size()={}", PayInfoList);
		
		List<Map<String, Object>> selectSumTotalPay = adminService.selectSumTotalPay();
		logger.info("selectSumTotalPay.size()={}", selectSumTotalPay);
		
		model.addAttribute("userCount", userCount);
		model.addAttribute("companyCount", companyCount);
		model.addAttribute("reservationCount", reservationCount);
		model.addAttribute("payinfoCount", payinfoCount);
		model.addAttribute("PayInfoList", PayInfoList);
		model.addAttribute("selectSumTotalPay", selectSumTotalPay);

		return "administrator/admin_Main";
	}
}
