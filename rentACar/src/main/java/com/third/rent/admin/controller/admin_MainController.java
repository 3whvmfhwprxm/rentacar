package com.third.rent.admin.controller;

import java.util.ArrayList;
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
import com.third.rent.admin_HighChart.model.Admin_HighChartService;
import com.third.rent.admin_User.controller.Admin_UserController;
import com.third.rent.highcharts.model.DateVO;
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
	
	@Autowired
	private Admin_HighChartService adminHighChartService;
	
	@RequestMapping("/admin_Main.do")
	public String main(@ModelAttribute PayInfoVO payInfoVo, @ModelAttribute DateVO dateVo, Model model) {
		logger.info("Main화면 띄우기");
		
		int userCount = adminService.selectCountUser();
		logger.info("userCount");
		
		int companyCount = adminService.selectCountCompany();
		logger.info("companyCount");
		
		int reservationCount = adminService.selectCountReservation();
		logger.info("reservationCount");
		
		int payinfoCount = adminService.selectCountPayinfo();
		logger.info("payinfoCount");
		
		logger.info("파라미터 year={}", dateVo.getYear());
		
		List<PayInfoVO> PayInfoList = payInfoService.recentTenPayInfo(payInfoVo);
		logger.info("PayInfoList.size()={}", PayInfoList);
		
		List<Map<String, Object>> slist = null;
		List<String> listPay = new ArrayList<String>();
		List<String> listMonth = new ArrayList<String>();
		slist = adminHighChartService.totalPayByMonth(dateVo);
		logger.info("월별 매출 조회 결과는 slist.size()={}", slist.size());
		
		for(int i=0; i<slist.size(); i++){
			Map<String, Object> bean = slist.get(i);
			listMonth.add(bean.get("PAYDATE")+"");
			listPay.add(bean.get("TOTALPAY")+"");
		}
		logger.info("월별 매출현황 listPay={}, listMonth={}", listPay, listMonth);
		
		model.addAttribute("listMonth", listMonth);
		model.addAttribute("listPay", listPay);
		model.addAttribute("slist", slist);
		
		model.addAttribute("userCount", userCount);
		model.addAttribute("companyCount", companyCount);
		model.addAttribute("reservationCount", reservationCount);
		model.addAttribute("payinfoCount", payinfoCount);
		model.addAttribute("PayInfoList", PayInfoList);
		

		return "administrator/admin_Main";
	}
}
