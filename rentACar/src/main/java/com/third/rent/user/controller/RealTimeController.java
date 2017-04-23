package com.third.rent.user.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.car.model.CarCategoryVO;
import com.third.rent.ccaroption.model.CcarOptionVO;
import com.third.rent.reservUser.model.ReservUserVO;
import com.third.rent.reserv_search.model.ReservSearchService;
import com.third.rent.reservation.model.ReservationVO;

@Controller
@RequestMapping("/inc_user")
public class RealTimeController {
	private static final Logger logger=LoggerFactory.getLogger(RealTimeController.class);
	
	@Autowired
	private ReservSearchService rService;
	
	@RequestMapping(value="/realTime.do", method=RequestMethod.GET)
	public String showRealTime_get(Model model){
		logger.info("실시간예약화면 띄우기");
		
		List<CarCategoryVO> catelist=rService.selectCategoryList();
		
		model.addAttribute("catelist", catelist);
		
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
		logger.info("예약 대상 검색 차종 리스트 크기 clist.size()={}", clist.size());
		
		List<CarCategoryVO> catelist=rService.selectCategoryList();
		
		model.addAttribute("catelist", catelist);		
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
	
	@RequestMapping("/reservation.do")
	public String reservation(@ModelAttribute ReservUserVO reservWho, @RequestParam String searchStartDate, 
								@RequestParam String searchEndDate, @RequestParam String ccarCarId, 
								HttpSession session, Model model) throws ParseException{
		
		String userId=(String)session.getAttribute("userId");
		logger.info("예약하기 - 예약자 로그인 아이디 체크 userid={}", userId);		
		
		String url="/inc_user/realTime.do", msg="";
		if(userId==null || userId.isEmpty()){
			msg="로그인하셔야 예약하실수 있습니다.";
		}else{		

			logger.info("예약하기 - 예약자/운전자 정보 rUvo={}", reservWho);
			logger.info("예약하기 - 예약기간 searchStartDate={}, searchEndDate={}", searchStartDate, searchEndDate);
			logger.info("예약하기 - 예약 대상 차 ccarCarId={}", ccarCarId);
			
						
			//예약조건 reserVo에 저장 
			ReservationVO reserVo=new ReservationVO();
			reserVo.setCcarCarId(ccarCarId);
			reserVo.setUserTel1(reservWho.getResUTel1());
			reserVo.setUserTel2(reservWho.getResUTel2());
			reserVo.setUserTel3(reservWho.getResUTel3());
			reserVo.setReservStartDate(searchStartDate);
			reserVo.setReservStartTime("9");			
			reserVo.setReservEndDate(searchEndDate);
			reserVo.setReservEndTime("13");
			reserVo.setReservInsurance("자차보험");
			reserVo.setUserId(userId);
						
			//DB작업
			rService.takeReservation(reserVo, reservWho);
			
			msg="예약이 완료됨. 결제는 아직 안됨. 일단 메인으로 보내고 토드로 확인";
			url="/inc_user/index.do";		
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
}
