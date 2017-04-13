package com.third.rent.user.controller;

import java.sql.Timestamp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.reservation.model.ReservationVO;

@Controller
@RequestMapping("/inc_user")
public class RealTimeController {
	private static final Logger logger=LoggerFactory.getLogger(RealTimeController.class);
	
	@RequestMapping(value="/realTime.do", method=RequestMethod.GET)
	public String showRealTime_get(){
		logger.info("실시간예약화면 띄우기");
		
		return "inc_user/realTime";		
	}
	
	@RequestMapping(value="/realTime.do", method=RequestMethod.POST)
	public String showRealTime_post(@ModelAttribute ReservationVO vo, 
											@RequestParam int carSize ,Model model){
		logger.info("예약 조건에 맞는 리스트 찾기위한 vo={}, carSize={}", vo, carSize);
		
		//vo에서 예약시작/종료 날짜를 가져와서 reservation테이블에서 비교하여 기간에 포함되지않는 차목록을 가져온다
		//가져온 결과를 인라인뷰에 넣고 여기서 차량 조건에 맞는 차들만 목록으로 가져온다
		Timestamp startDate=vo.getReservStartDate();
		Timestamp endDate=vo.getReservEndDate();
		
		
		
		
		return "inc_user/realTime";		
	}
}
