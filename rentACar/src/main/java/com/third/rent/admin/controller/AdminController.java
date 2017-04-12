package com.third.rent.admin.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.admin.model.AdminService;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;
import com.third.rent.user.model.UserVO;


@Controller
public class AdminController {
	private static final Logger logger
		= LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/inc_admin/main.do")
	public String main(){
		logger.info("Main화면 띄우기");
		return "inc_admin/main";
	}
	
	@RequestMapping("/administrator/user/memberList.do")
	public String MemberList(@ModelAttribute SearchVO searchVo, Model model){
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

		List<UserVO> mlist = adminService.selectAll(searchVo);
		logger.info("회원목록 조회결과, mlist.size()={}", mlist.size());

		int totalRecord = adminService.selectTotalRecord(searchVo);
		logger.info("회원목록 조회 - 전체 회원수 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		//3
		model.addAttribute("mlist", mlist);
		model.addAttribute("pagingInfo", pagingInfo);

		return "administrator/user/memberList";
	}
	
	
}


