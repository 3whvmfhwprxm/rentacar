package com.third.rent.admin_Board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.admin_Board.model.Admin_BoardService;
import com.third.rent.user.notice.model.UserNoticeVO;

@Controller
public class Admin_BoardController {
	
	private static final Logger logger=LoggerFactory.getLogger(Admin_BoardController.class);
	
	private Admin_BoardService adService;
	
	@RequestMapping("/admin/Board/uNotice.do")
	public String showUNotice(Model model){
		logger.info("관리자 시스템 - 고객 공지사항 관리 화면 표시");
		
		List<UserNoticeVO> unList=adService.selectUN();
		logger.info("고객 공지사항 리스트 수, unList.size()={}", unList.size());
		
		model.addAttribute("unList", unList);
		
		return "";
	}
}
