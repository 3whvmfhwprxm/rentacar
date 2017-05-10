package com.third.rent.admin_HighChart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.admin_HighChart.model.Admin_HighChartService;

@Controller
@RequestMapping("/administrator")
public class Admin_HighChartController {
	private static final Logger logger 
		= LoggerFactory.getLogger(Admin_HighChartController.class);
	
	@Autowired
	private Admin_HighChartService adminHighChartService;
	
	/*@RequestMapping("/admin_Main.do") 
	public String revenueMonth(@ModelAttribute DateVO dateVo, Model model){
		List<Map<String, Object>> slist = null;
		List<String> listPay = new ArrayList<String>();
		List<String> listMonth = new ArrayList<String>();
		if(dateVo.getYear()!=null && !dateVo.getYear().isEmpty()){
			slist = adminHighChartService.totalPayByMonth(dateVo);
			logger.info("월별 매출 조회 결과는 slist.size()={}", slist.size());
			
			for(int i=0; i<slist.size(); i++){
				Map<String, Object> bean = slist.get(i);
				listMonth.add(bean.get("TOTALPAY")+"");
				listPay.add(bean.get("PAYDATE")+"");
			}
			logger.info("월별 매출현황 listPay={}", listPay);
			
			model.addAttribute("listMonth", listMonth);
			model.addAttribute("listPay", listPay);
		}
		model.addAttribute("slist", slist);
		
		return "administrator/admin_Main";
	}*/
}
