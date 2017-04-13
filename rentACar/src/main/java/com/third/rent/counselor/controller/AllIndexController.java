package com.third.rent.counselor.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AllIndexController {

	private static final Logger logger=LoggerFactory.getLogger(CounselController.class);
	
	@RequestMapping("/All_index")
	public String consel_index(){
		
		logger.info("총화면 구현 구현");
		
		return "All_index";
	}

}
