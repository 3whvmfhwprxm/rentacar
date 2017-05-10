package com.third.rent.admin_User.controller;

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

import com.third.rent.admin.model.AdminVO;
import com.third.rent.admin_User.model.Admin_UserService;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.admin_Utility;
import com.third.rent.user.model.UserListVO;
import com.third.rent.user.model.UserVO;


@Controller
@RequestMapping("/administrator")
public class Admin_UserController {
	private static final Logger logger
		= LoggerFactory.getLogger(Admin_UserController.class);
	
	@Autowired
	private Admin_UserService adminUserService;
	
	@RequestMapping("/user/userInList.do")
	public String userInList(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("회원목록, 파라미터 searchVo={}", searchVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(admin_Utility.ADMIN_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<UserVO> userInList = adminUserService.selectInUser(searchVo);
		logger.info("회원목록 조회결과, userInList.size()={}", userInList.size());
		
		int totalRecord = adminUserService.selectTotalRecord(searchVo);
		logger.info("회원목록 조회 - 전체 회원수 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("userInList", userInList);
		model.addAttribute("pagingInfo", pagingInfo);

		return "administrator/user/userInList";
	}
	
	@RequestMapping("/user/userOutList.do")
	public String userOutList(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("회원목록, 파라미터 searchVo={}", searchVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(admin_Utility.ADMIN_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<UserVO> userOutList = adminUserService.selectOutUser(searchVo);
		logger.info("회원목록 조회결과, userOutList.size()={}", userOutList.size());		
		
		int totalRecord = adminUserService.selectTotalRecord(searchVo);
		logger.info("회원목록 조회 - 전체 회원수 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("userOutList", userOutList);
		model.addAttribute("pagingInfo", pagingInfo);

		return "administrator/user/userOutList";
	}
	
	@RequestMapping(value="/user/userWithdraw.do", method=RequestMethod.GET)
	public String userWithdraw_get(){
		//1.
		logger.info("삭제화면 보여주기");
		
		return "administrator/user/userWithdraw";
	}
	
	@RequestMapping(value="/user/userWithdraw.do", method=RequestMethod.POST)
	public String userWithdraw_post(@RequestParam String userId, @RequestParam String pwd, 
			HttpSession session, Model model){
		logger.info("삭제처리시 비밀번호  매개변수 userId={}, pwd={}", userId, pwd);
		
		String Admin_Id = (String)session.getAttribute("Admin_Id");
		logger.info("회원탈퇴 처리, 파라미터 Admin_Id={}", Admin_Id);
		
		int result = adminUserService.loginCheck(Admin_Id, pwd);
		logger.info("result={}", result);
		
		String msg="", url="/administrator/user/userWithdraw.do";
		if(result==Admin_UserService.LOGIN_OK){
			int outResult = adminUserService.userWithdraw(userId);
			logger.info("회원탈퇴 결과, outResult={}", outResult);
			
			if(outResult>0){
				msg="탈퇴 처리 성공";
				url="/administrator/user/userOutList.do";	
			}else{
				msg="탈퇴 처리 실패";
			}
		}else if(result==Admin_UserService.PWD_DISAGREE){
			msg="비밀번호를 확인해주세요";
		}else{
			msg="비밀번호 체크 에러발생";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/user/userMultiWithdraw.do", method=RequestMethod.POST)
	public String companyMultiWithdraw_List(@ModelAttribute UserListVO userListVo, Model model){
		logger.info("선택한 회원 목록 탈퇴 파라미터 userListVo={}", userListVo);
		
		List<UserVO> userList = userListVo.getUserItems();
		int cnt = adminUserService.userMultiWithdraw(userList);;
		logger.info("선택한 회원 목록 탈퇴 결과 cnt={}", cnt);
		
		String msg="", url="/administrator/user/userInList.do";
		if(cnt>0){
			msg="선택한 업체가 탈퇴처리 되었습니다.";
		}else{
			msg="선택한 업체 탈퇴처리 중 에러가 발생했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/user/userMultiReregister.do", method=RequestMethod.POST)
	public String companyMultiWithdraw_OutList(@ModelAttribute UserListVO userListVo, Model model){
		logger.info("선택한 회원 목록 탈퇴 파라미터 userListVo={}", userListVo);
		
		List<UserVO> userList = userListVo.getUserItems();
		int cnt = adminUserService.userMultiReregister(userList);
		logger.info("관리자 - 선택한 예약 목록 취소 결과 cnt={}", cnt);
		
		String msg="", url="/administrator/user/userOutList.do";
		if(cnt>0){
			msg="선택한 업체가 재등록처리 되었습니다.";
		}else{
			msg="선택한 업체 재등록처리 중 에러가 발생했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/user/userEdit.do", method=RequestMethod.GET)
	public String userEdit_get(@RequestParam String userId,
			Model model){
		logger.info("회원수정화면 보여주기, 파라미터 userId={}", userId);
		
		if(userId==null || userId.isEmpty()){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "administrator/user/userInList");
			
			return "common/message";
		}
		
		UserVO userVo
			= adminUserService.selectByUserId(userId);
		logger.info("업체수정화면 조회결과 userVo={}", userVo);
		
		model.addAttribute("userVo", userVo);
		
		return "administrator/user/userEdit";
	}
	
	@RequestMapping(value="/user/userEdit.do", method=RequestMethod.POST)
	public String companyEdit_post(@ModelAttribute UserVO userVo,
			@ModelAttribute AdminVO adminVo,
			Model model){
		logger.info("회원 수정 처리, 파라미터 userVo={}", userVo);
		
		int cnt = adminUserService.updateUser(userVo);
		logger.info("회원 수정 결과 cnt={}", cnt);
		
		String msg = "", url = "";
		if(cnt>0){
			msg = "회원 수정 성공";
			url = "/administrator/user/userInList.do";
		}else{
			msg = "회원 수정 실패";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}


