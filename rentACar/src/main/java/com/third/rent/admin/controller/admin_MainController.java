package com.third.rent.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.admin.model.AdminService;
import com.third.rent.admin_User.controller.Admin_UserController;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.Utility;
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
		
		int selectSumPayMoney = adminService.selectSumPayMoney();
		logger.info("selectSumPayMoney");
		
		int selectSumPayDiscount = adminService.selectSumPayDiscount();
		logger.info("selectSumPayDiscount");
		
		PaginationInfo pInfo=new PaginationInfo();
		pInfo.setCurrentPage(payInfoVo.getCurrentPage());
		pInfo.setBlockSize(Utility.ADMIN_PAYINFO_BLOCKSIZE);
		pInfo.setRecordCountPerPage(Utility.ADMIN_PAYINFO_RECORDCOUNT_PERPAGE);
		
		payInfoVo.setFirstRecordIndex(pInfo.getFirstRecordIndex());
		payInfoVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		
		List<PayInfoVO> PayInfoList = payInfoService.selectPayInfo(payInfoVo);
		logger.info("PayInfoList.size()={}", PayInfoList);
		
		int totalRecord=payInfoService.selectTotalRecordPayInfo(payInfoVo);
		logger.info("결제 내역 전체 조회 결과 수 totalRecord={}", totalRecord);
		pInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("userCount", userCount);
		model.addAttribute("companyCount", companyCount);
		model.addAttribute("reservationCount", reservationCount);
		model.addAttribute("payinfoCount", payinfoCount);
		model.addAttribute("selectSumPayMoney", selectSumPayMoney);
		model.addAttribute("selectSumPayDiscount", selectSumPayDiscount);
		model.addAttribute("PayInfoList", PayInfoList);
		model.addAttribute("pagingInfo", pInfo);

		return "administrator/admin_Main";
	}
}
