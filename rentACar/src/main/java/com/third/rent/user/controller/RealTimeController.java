package com.third.rent.user.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import com.third.rent.common.DateSearchVO;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.Utility;
import com.third.rent.common.userUtility;
import com.third.rent.payInfo.model.PayInfoVO;
import com.third.rent.reservUser.model.ReservUserVO;
import com.third.rent.reserv_search.model.ReservSearchService;
import com.third.rent.reservation.model.ReservationVO;
import com.third.rent.user.model.UserService;
import com.third.rent.user.model.UserVO;

@Controller
@RequestMapping("/user")
public class RealTimeController {
	private static final Logger logger=LoggerFactory.getLogger(RealTimeController.class);

	@Autowired
	private ReservSearchService rService;

	@Autowired
	private UserService uService;

	@RequestMapping("/realTime.do")
	public String showRealTime_post(@ModelAttribute DateSearchVO dateSearchVO, Model model){
		logger.info("예약 대상 검색 기간 조건 dateSearchVO={}", dateSearchVO);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.USER_RESERV_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.USER_RESERV_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(dateSearchVO.getCurrentPage());

		dateSearchVO.setRecordCountPerPage(Utility.USER_RESERV_RECORDCOUNT_PERPAGE);
		dateSearchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		if(dateSearchVO.getSearchStartDate()==null){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			Date today=new Date();

			//시작일: 오늘에 하루 더해서 세팅
			Calendar cal = Calendar.getInstance();
			cal.setTime(today);
			cal.add(Calendar.DATE, 1); //하루 더하기

			dateSearchVO.setSearchStartDate(sdf.format(cal.getTime()));
			dateSearchVO.setStartHour("08");
			dateSearchVO.setStartMin("00");

			cal.add(Calendar.DATE, 1); //하루 더 더하기
			//반납일: 오늘에 이틀 더해서 세팅
			dateSearchVO.setSearchEndDate(sdf.format(cal.getTime()));
			dateSearchVO.setEndHour("08");
			dateSearchVO.setEndMin("00");
		}

		//검색 날짜 조건 결합
		if(dateSearchVO.getSearchStartDate().length()<14){		
			String startDate=dateSearchVO.getSearchStartDate()+" "+dateSearchVO.getStartHour()+":"+dateSearchVO.getStartMin();
			String endDate=dateSearchVO.getSearchEndDate()+" "+dateSearchVO.getEndHour()+":"+dateSearchVO.getEndMin();		
			dateSearchVO.setSearchStartDate(startDate);
			dateSearchVO.setSearchEndDate(endDate);
		}
		/*//검색 조건 해쉬맵에 저장
		HashMap<String, Object> searchOption=new HashMap<String, Object>();
		searchOption.put("searchStartDate", startDate);
		searchOption.put("searchEndDate", endDate);
		searchOption.put("carType", dateSearchVO.getCarType());*/
		logger.info("예약 검색 값 dateSearchVO={}", dateSearchVO);
		//DB작업
		List<Map<String, Object>> clist=rService.searchNormal(dateSearchVO);
		logger.info("예약 대상 검색 - 검색된 예약가능차 리스트 크기 clist.size()={}", clist.size());
		
		int totalRecord =rService.searchNormalTotalCount(dateSearchVO);
		logger.info("예약 대상 검색 - 전체레코드 개수조회 결과, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		List<CarCategoryVO> catelist=rService.selectCategoryList();
		logger.info("예약 대상 검색 - 차종 카테고리 리스트 크기 catelist.size()={}", catelist.size());
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("catelist", catelist);		
		model.addAttribute("clist", clist);

		return "user/realTime";		
	}

	@RequestMapping("/reservInfo.do")
	public String showReservInfo(@ModelAttribute DateSearchVO dateSearchVO,
			@RequestParam String ccarCarId, Model model, HttpSession session){

		String userId=(String)session.getAttribute("userId");

		logger.info("선택한 회사차의 예약 기간 조건 dateSearchVO={}", dateSearchVO);
		logger.info("선택한 회사차의 ID값, ccarCarId={}", ccarCarId);
		logger.info("세션의 유저ID, userId={}", userId);

		//검색 날짜 조건 결합
		if(dateSearchVO.getSearchStartDate().length()<14){		
			String startDate=dateSearchVO.getSearchStartDate()+" "+dateSearchVO.getStartHour()+":"+dateSearchVO.getStartMin();
			String endDate=dateSearchVO.getSearchEndDate()+" "+dateSearchVO.getEndHour()+":"+dateSearchVO.getEndMin();		
			dateSearchVO.setSearchStartDate(startDate);
			dateSearchVO.setSearchEndDate(endDate);
		}

		//검색 조건 해쉬맵에 저장
		HashMap<String, Object> searchOption=new HashMap<String, Object>();
		searchOption.put("searchStartDate", dateSearchVO.getSearchStartDate());
		searchOption.put("searchEndDate", dateSearchVO.getSearchEndDate());
		searchOption.put("ccarCarId", ccarCarId);
		
		//DB작업 select by ccarCarId
		Map<String, Object> map=rService.selectedCarInfo(searchOption);
		logger.info("선택한 회사차의 정보, map={}", map);

		//유저에 대한 정보 가져오기
		UserVO uvo=uService.selectByUserid(userId);
		logger.info("예약자 회원 정보 uvo={}", uvo);

		model.addAttribute("map", map);
		model.addAttribute("uvo", uvo);

		return "user/reservInfo";
	}

	@RequestMapping("/reservation.do")
	public String reservation(@ModelAttribute ReservUserVO reservWho, 			
			@ModelAttribute DateSearchVO dateSearchVO,																
			@RequestParam String ccarCarId, HttpSession session, Model model) throws ParseException{

		String userId=(String)session.getAttribute("userId");
		logger.info("예약하기 - 예약자 로그인 아이디 체크 userid={}", userId);	
		logger.info("예약하기 - 예약자/운전자 정보 rUvo={}", reservWho);
		logger.info("예약하기 - 예약 대상 차 ccarCarId={}", ccarCarId);

		//예약조건 reserVo에 저장 
		ReservationVO reserVo=new ReservationVO();
		reserVo.setCcarCarId(ccarCarId);
		reserVo.setUserTel1(reservWho.getResUTel1());
		reserVo.setUserTel2(reservWho.getResUTel2());
		reserVo.setUserTel3(reservWho.getResUTel3());

		//날짜 문자열 조합
		//검색 날짜 조건 결합
		if(dateSearchVO.getSearchStartDate().length()<14){		
			String startDate=dateSearchVO.getSearchStartDate()+" "+dateSearchVO.getStartHour()+":"+dateSearchVO.getStartMin();
			String endDate=dateSearchVO.getSearchEndDate()+" "+dateSearchVO.getEndHour()+":"+dateSearchVO.getEndMin();		
			dateSearchVO.setSearchStartDate(startDate);
			dateSearchVO.setSearchEndDate(endDate);
		}

		reserVo.setReservStartDate(dateSearchVO.getSearchStartDate());		
		reserVo.setReservEndDate(dateSearchVO.getSearchEndDate());
		reserVo.setReservInsurance("자차보험");
		reserVo.setUserId(userId);
		

		//검색 조건 해쉬맵에 저장
		HashMap<String, Object> searchOption=new HashMap<String, Object>();
		searchOption.put("searchStartDate", dateSearchVO.getSearchStartDate());
		searchOption.put("searchEndDate", dateSearchVO.getSearchEndDate());
		searchOption.put("ccarCarId", ccarCarId);

		Map<String, Object> map=rService.selectedCarInfo(searchOption);
		logger.info("선택한 회사차의 정보, map={}", map);

		//DB작업
		String reservKey=rService.takeReservation(reserVo, reservWho);
		reserVo.setReservNum(reservKey);

		model.addAttribute("reserVo",reserVo);
		model.addAttribute("map", map);

		return "user/payment";
	}

	@RequestMapping("/payOK.do")
	@ResponseBody
	public void payOK(@ModelAttribute PayInfoVO payInfoVO, @RequestParam long payRegdateUnixTimeStamp){
		logger.info("결제완료 정보 테이블 입력하기 ajax 호출. 파라미터 payInfoVO={}", payInfoVO);
		logger.info("결제완료 정보 테이블 입력하기 ajax 호출. 유닉스 타임 payRegdateUnixTimeStamp={}", payRegdateUnixTimeStamp);

		//unix timestamp형식 변환 1493027909
		Date date = new Date(payRegdateUnixTimeStamp*1000L);		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT+9"));

		System.out.println(sdf.format(date));
		payInfoVO.setPayRegdate(sdf.format(date));

		int result=rService.insertPayInfo(payInfoVO);
		logger.info("결제완료 정보 입력 결과 result={}", result);
	}

}
