package com.third.rent.admin_Sales.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.admin_Sales.model.SalesService;
import com.third.rent.common.DateSearchVO2;

@Controller
@RequestMapping("/admin/sales")
public class Admin_SalesController {

	private static final Logger logger=LoggerFactory.getLogger(Admin_SalesController.class);
	
	@Autowired
	private SalesService sService;
	
	@RequestMapping("/salesDay.do")
	public String salesDay(@ModelAttribute DateSearchVO2 dvo, Model model){
		logger.info("일별 매출 파라미터 dvo={}", dvo);
		
		List<Map<String, Object>> slist=null;
		
		if(dvo.getYear()!=null && !dvo.getYear().isEmpty()){
			slist=sService.selectSalesByDate(dvo);
			logger.info("일별 매출 조회 결과는 slist.size()={}", slist.size());
		}
		
		model.addAttribute("slist", slist);
		
		return "administrator/sales/salesDay";
	}
	
	@RequestMapping("/salesMonth.do")
	public String salesMonth(@ModelAttribute DateSearchVO2 dvo, Model model){
		logger.info("월별 매출 파라미터 dvo={}", dvo);
		
		List<Map<String, Object>> slist=null;
		
		if(dvo.getYear()!=null && !dvo.getYear().isEmpty()){
			slist=sService.selectSalesByMonth(dvo);
			logger.info("월별 매출 조회 결과는 slist.size()={}", slist.size());
		}
		
		model.addAttribute("slist", slist);
		
		return "administrator/sales/salesMonth";
	}
	
	@RequestMapping("/salesTerm.do")
	public String salesTerm(@ModelAttribute DateSearchVO2 dvo, Model model){
		logger.info("기간별 매출 파라미터 dvo={}", dvo);
		
		List<Map<String, Object>> slist=null;
		
		if(dvo.getStartDay()!=null && !dvo.getStartDay().isEmpty()){
			slist=sService.selectSalesByTerm(dvo);
			logger.info("기간별 매출 조회 결과는 slist.size()={}", slist.size());
		}
		
		model.addAttribute("slist", slist);
		
		return "administrator/sales/salesTerm";
	}
	
}
