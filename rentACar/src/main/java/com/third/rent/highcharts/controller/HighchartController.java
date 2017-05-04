package com.third.rent.highcharts.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.highcharts.model.DateVO;
import com.third.rent.highcharts.model.HighchartsService;

@Controller
@RequestMapping("/administrator")
public class HighchartController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(HighchartController.class);
	
	@Autowired
	private HighchartsService highchartService;
	
	@RequestMapping("/highChart/sales.do")
	public String highChart(@ModelAttribute DateVO dateVo,
			Model model){
		logger.info("월별매출, 파라미터 dateVo={}", dateVo);
		
		List<Map<String, Object>> salesByMonth = null;
		if(dateVo.getYear()!=null
				&& !dateVo.getYear().isEmpty()){
			salesByMonth = highchartService.selectSalesByMonth(dateVo);
			logger.info("월별매출 결과, salesByMonth.size()={}", salesByMonth.size());
		}
		
		model.addAttribute("salesByMonth", salesByMonth);
		
		return "administrator/highChart/sales";
	}
}
