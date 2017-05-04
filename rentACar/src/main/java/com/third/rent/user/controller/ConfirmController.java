package com.third.rent.user.controller;

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

import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;
import com.third.rent.common.userUtility;
import com.third.rent.reservation.model.ReservationService;
import com.third.rent.reservation.model.ReservationVO;

@Controller
public class ConfirmController {
	private static final Logger logger=LoggerFactory.getLogger(ConfirmController.class);
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping("/user/confirm.do")
	public String showConfirm(@ModelAttribute SearchVO searchVo, HttpSession session, Model model){
		String userId=(String)session.getAttribute("userId");
		logger.info("예약확인 화면 띄우기 userId={}", userId);
		
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
		
		
		List<Map<String, Object>> alist = reservationService.selectByUserid(map);
		logger.info("예약화면, 회원정보조회 alist.size()={}",alist.size());
		
		int totalRecord = reservationService.selectTotalRecord(userId);
		logger.info("조회 결과, totalRecord={}",totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "user/confirm";
		
	}
}
