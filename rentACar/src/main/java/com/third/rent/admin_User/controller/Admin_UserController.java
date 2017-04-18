package com.third.rent.admin_User.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.admin_User.model.Admin_UserService;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;
import com.third.rent.user.model.UserVO;


@Controller
@RequestMapping("/administrator")
public class Admin_UserController {
	private static final Logger logger
		= LoggerFactory.getLogger(Admin_UserController.class);
	
	@Autowired
	private Admin_UserService adminUserService;
	
	@RequestMapping("/user/userList.do")
	public String userList(@ModelAttribute SearchVO searchVo, Model model){
		//1
		logger.info("회원목록, 파라미터 searchVo={}", searchVo);

		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<UserVO> mlist = adminUserService.selectAll(searchVo);
		logger.info("회원목록 조회결과, mlist.size()={}", mlist.size());

		int totalRecord = adminUserService.selectTotalRecord(searchVo);
		logger.info("회원목록 조회 - 전체 회원수 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		//3
		model.addAttribute("mlist", mlist);
		model.addAttribute("pagingInfo", pagingInfo);

		return "administrator/user/userList";
	}
	
	@RequestMapping("/user/userDetail.do")
	public String userDetail(@RequestParam String userId, Model model){
		//1.
		logger.info("글 상세보기, 파라미터 userId={}", userId);
		if(userId.isEmpty()){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/administrator/user/userList.do");

			return "common/message";
		}

		//2.
		UserVO userVo = adminUserService.selectByUserId(userId);
		logger.info("상세보기 결과, userVo={}", userVo);


		//3.
		model.addAttribute("userVo", userVo);

		return "administrator/user/userDetail";
	}
	
}


