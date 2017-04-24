package com.third.rent.user.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.rent.car.model.CarCategoryVO;
import com.third.rent.ccaroption.model.CcarOptionVO;
import com.third.rent.payInfo.model.PayInfoVO;
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
		reserVo.setReservStartTime("9");	//시간 관련 현재 9로 고정되어있는데 수정해야함. 아마도 시작날짜에 시간까지 포함하는 컬럼으로 수정되는걸로 결론날것 같음. 반납일로 마찬가지		
		reserVo.setReservEndDate(searchEndDate);
		reserVo.setReservEndTime("13"); //위와 같음
		reserVo.setReservInsurance("자차보험");
		reserVo.setUserId(userId);
					
		//DB작업
		String reservKey=rService.takeReservation(reserVo, reservWho);
		reserVo.setReservNum(reservKey);
		
		model.addAttribute("reserVo",reserVo);
		
		return "inc_user/payment";
	}
	
	@RequestMapping("/payOK.do")
	@ResponseBody
	public void payOK(@ModelAttribute PayInfoVO payInfoVO, @RequestParam long payRegdateUnixTimeStamp){
		logger.info("결제완료 정보 테이블 입력하기 ajax 호출. 파라미터 payInfoVO={}", payInfoVO);
		logger.info("결제완료 정보 테이블 입력하기 ajax 호출. 유닉스 타임 payRegdateUnixTimeStamp={}", payRegdateUnixTimeStamp);
		
		//unix timestamp형식 변환 1493027909
		Date date = new Date(payRegdateUnixTimeStamp*1000L);		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT+9"));

		System.out.println(sdf.format(date));
		payInfoVO.setPayRegdate(sdf.format(date));
		
		int result=rService.insertPayInfo(payInfoVO);
		logger.info("결제완료 정보 입력 결과 result={}", result);
	}
}
