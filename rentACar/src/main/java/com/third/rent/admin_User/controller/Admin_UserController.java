package com.third.rent.admin_User.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.admin_User.model.Admin_UserService;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.admin_Utility;
import com.third.rent.user.model.UserVO;


@Controller
@RequestMapping("/administrator")
public class Admin_UserController {
	private static final Logger logger
		= LoggerFactory.getLogger(Admin_UserController.class);
	
	@Autowired
	private Admin_UserService adminUserService;
	
	@RequestMapping("/user/userList.do")
	public String userInList(@ModelAttribute SearchVO searchVo, Model model){
		//1
		logger.info("회원목록, 파라미터 searchVo={}", searchVo);

		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(admin_Utility.ADMIN_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<UserVO> userInList = adminUserService.selectInUser(searchVo);
		logger.info("회원목록 조회결과, userInList.size()={}", userInList.size());
		
		List<UserVO> userOutList = adminUserService.selectOutUser(searchVo);
		logger.info("회원목록 조회결과, userOutList.size()={}", userOutList.size());		
		
		int totalRecord = adminUserService.selectTotalRecord(searchVo);
		logger.info("회원목록 조회 - 전체 회원수 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("userInList", userInList);
		model.addAttribute("userOutList", userOutList);
		model.addAttribute("pagingInfo", pagingInfo);

		return "administrator/user/userList";
	}
}


