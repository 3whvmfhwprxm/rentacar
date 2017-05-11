package com.third.rent.user.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.common.DateSearchVO2;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.userUtility;
import com.third.rent.payInfo.model.PayInfoService;
import com.third.rent.reservation.model.ReservationService;

@Controller
public class ConfirmController {
	private static final Logger logger=LoggerFactory.getLogger(ConfirmController.class);
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private PayInfoService pService;
	
	@RequestMapping("/user/confirm.do")
	public String showConfirm(@ModelAttribute DateSearchVO2 searchVo, HttpSession session, Model model){
		String userId=(String)session.getAttribute("userId");
		logger.info("예약확인 화면 띄우기 userId={}", userId);
		
		//조회버튼을 클릭하지 않은 경우-상단 메뉴에서 바로 들어오는 경우
		//=> 현재일자를 searchVo에 setting
		if(searchVo.getStartDay()==null 
				|| searchVo.getStartDay().isEmpty()){
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(date);
			searchVo.setStartDay(today);
			searchVo.setEndDay(today);			
		}
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(userUtility.CONFIRM_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(userUtility.CONFIRM_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(userUtility.REVIEW_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//로그인되었는지 체크
		if(userId==null || userId.isEmpty()){
			model.addAttribute("msg", "먼저 로그인하세요");
			model.addAttribute("url", "/user/login.do");
			return "common/message";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
		map.put("recordCountPerPage", searchVo.getRecordCountPerPage());
		map.put("startDay", searchVo.getStartDay());
		map.put("endDay", searchVo.getEndDay());
		
		
		List<Map<String, Object>> alist = reservationService.selectByUserid(map);
		logger.info("예약화면, 회원정보조회 alist.size()={}",alist.size());
		
		int totalRecord = reservationService.selectTotalRecord(userId);
		logger.info("조회 결과, totalRecord={}",totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "user/confirm";
		
	}
	
	@RequestMapping("/user/reservCancel.do")
	public String CancelPaymentByMerchantUid(@RequestParam String reservNum, Model model) throws Exception {
		
		logger.info("결제 취소 하기 파라미터값: reservNum={}", reservNum);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("reservNum", reservNum);
		map.put("reservCancelWhy", "사용자 취소 처리");

		//예약, 결제정보 취소처리하기
		int result=pService.cancelPayInfo(map);
		
		String url="/user/confirm.do", msg="";
		if(result>0){
			msg="취소 처리되었습니다.";
		}else{
			msg="취소 처리 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
}
