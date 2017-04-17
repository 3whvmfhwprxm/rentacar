package com.third.rent.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.reservation.model.ReservationService;
import com.third.rent.reservation.model.ReservationVO;

@Controller
public class ConfirmController {
	private static final Logger logger=LoggerFactory.getLogger(ConfirmController.class);
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping("/inc_user/confirm.do")
	public String showConfirm(HttpSession session, Model model){
		String userId=(String)session.getAttribute("userId");
		logger.info("예약확인 화면 띄우기 userId={}", userId);
		
		//로그인되었는지 체크
		if(userId==null || userId.isEmpty()){
			model.addAttribute("msg", "먼저 로그인하세요");
			model.addAttribute("url", "/inc_user/login.do");
			return "common/message";
		}
		ReservationVO vo=reservationService.selectByUserid(userId);
		logger.info("예약화면, 회원정보조회 vo={}",vo);
		model.addAttribute("vo", vo);
		
		return "inc_user/confirm";
		
	}
}
