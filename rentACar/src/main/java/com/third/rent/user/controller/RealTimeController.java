package com.third.rent.user.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.ccaroption.model.CcarOptionVO;
import com.third.rent.reserv_search.model.ReservSearchService;

@Controller
@RequestMapping("/inc_user")
public class RealTimeController {
	private static final Logger logger=LoggerFactory.getLogger(RealTimeController.class);
	
	@Autowired
	private ReservSearchService rService;
	
	@RequestMapping(value="/realTime.do", method=RequestMethod.GET)
	public String showRealTime_get(){
		logger.info("실시간예약화면 띄우기");
		
		return "inc_user/realTime";		
	}
	
	@RequestMapping(value="/realTime.do", method=RequestMethod.POST)
	public String showRealTime_post(@RequestParam String searchStartDate, @RequestParam String searchEndDate,
											@RequestParam int carType ,Model model){
		logger.info("예약 대상 검색 기간 조건 searchStartDate={}, searchEndDate={}", searchStartDate, searchEndDate);
		logger.info("예약 대상 검색 차종 조건 carType={}", carType);
		
		//검색 조건 해쉬맵에 저장
		HashMap<String, Object> searchOption=new HashMap<String, Object>();
		searchOption.put("searchStartDate", searchStartDate);
		searchOption.put("searchEndDate", searchEndDate);
		searchOption.put("carType", carType);
		
		//DB작업
		List<CcarOptionVO> clist=rService.searchNormal(searchOption);
		logger.info("예약 대상 검색 차종 리스트 크기 clist={}", clist);
		
		model.addAttribute("clist", clist);
		
		return "inc_user/realTime";		
	}
	
	@RequestMapping("/reservInfo.do")
	public String showReservInfo(@RequestParam String searchStartDate, @RequestParam String searchEndDate, 
			@RequestParam String ccarCarId, Model model){
		logger.info("선택한 회사차의 예약 기간 조건 searchStartDate={}, searchEndDate={}", searchStartDate, searchEndDate);
		logger.info("선택한 회사차의 ID값, ccarCarId={}", ccarCarId);
		
		//DB작업 select by ccarCarId
		CcarOptionVO car=rService.selectByCcarCarId(ccarCarId);
		logger.info("선택한 회사차의 정보, car={}", car);
		
		model.addAttribute("car", car);
		
		return "inc_user/reservInfo";
	}
}
