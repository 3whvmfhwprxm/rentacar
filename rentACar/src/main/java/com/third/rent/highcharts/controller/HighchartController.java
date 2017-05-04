package com.third.rent.highcharts.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/administrator")
public class HighchartController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(HighchartController.class);
	
	@RequestMapping("/highChart/userHighChart.do")
	public String userHighChart(){
		logger.info("회원 차트 보여주기");
		
		return "administrator/highChart/userHighChart";
	}
}
