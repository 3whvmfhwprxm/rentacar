package com.third.rent.ccaroption.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.ccaroption.model.CcarOptionService;

@Controller
@RequestMapping("/com_manage/comCalcData")
public class CcarCalcController {
	private static final Logger logger
		= LoggerFactory.getLogger(CcarCalcController.class);
	
	@Autowired
	private CcarOptionService csService;
	
	@RequestMapping("/comCalc.do")
	public String comCalc(){
		logger.info("업체 정산 현황 보여주기");
		
		
		return "com_manage/comCalcData/comCalc";
	}
}












