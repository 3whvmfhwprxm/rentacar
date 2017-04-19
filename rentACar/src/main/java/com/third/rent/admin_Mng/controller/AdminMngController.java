package com.third.rent.admin_Mng.controller;

import java.util.List;

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
import com.third.rent.admin_Mng.Model.AdminMngService;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;

@Controller
@RequestMapping("/admin/Mng")
public class AdminMngController {
	
	private static final Logger logger=LoggerFactory.getLogger(AdminMngController.class);
	
	@Autowired
	private AdminMngService aService;
	
	@RequestMapping("/adminList.do")
	public String showAdmins(@ModelAttribute SearchVO searchVO, Model model){
		logger.info("관리 - 관리자목록 조회조건  searchVO={}", searchVO);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVO.getCurrentPage());
		
		//SearchVO 값 셋팅
		searchVO.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		

		List<AdminVO> adminlist=aService.selectAdmins(searchVO);
		logger.info("관리 - 관리자 수, adminlist.size()={}", adminlist.size());
		
		int totalRecord=aService.countAdmin(searchVO);
		logger.info("관리 - 전체 관리자 수, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("adminlist", adminlist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "administrator/admin_Management/adminMng";
	}
	
	@RequestMapping(value="/adminJoin.do", method=RequestMethod.GET)
	public String joinAdmin_get(){
		logger.info("관리 - 관리자 입력 화면 보여주기");		
		return "administrator/admin_Management/adminJoin";
	};
	
	@RequestMapping(value="/adminJoin.do", method=RequestMethod.POST)
	public String joinAdmin_post(@ModelAttribute AdminVO avo, Model model){
		logger.info("관리 - 관리자 입력  파라미터 avo={}", avo);
		
		int cnt=aService.insertAdmin(avo);
		logger.info("관리 - 관리자 입력 결과 cnt={}", cnt);
		
		String msg="", url="/admin/Mng/adminList.do";
		if(cnt>0){
			msg="관리자가 새로 추가되었습니다.";
		}else{
			url="/admin/Mng/adminJoin.do";
			msg="관리자 입력 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/adminEdit.do", method=RequestMethod.GET)
	public String editAdmin_get(@RequestParam String adminId, Model model){
		logger.info("관리 - 관리자 수정 관련 파라미터 adminId={}", adminId);
		
		AdminVO avo=aService.selectOneAdmin(adminId);
		logger.info("관리 - 관리자 수정 관련 조회결과 avo={}", avo);
		
		model.addAttribute("avo", avo);
		
		return "administrator/admin_Management/adminEdit";
	}
	
	@RequestMapping(value="/adminEdit.do", method=RequestMethod.POST)
	public String editAdmin_post(@ModelAttribute AdminVO avo, Model model){
		logger.info("관리 - 관리자 수정 파라미터 avo={}", avo);
		
		int cnt=aService.updateAdmin(avo);
		logger.info("관리 - 관리자 수정 결과 cnt={}", cnt);
		
		String msg="", url="/admin/Mng/adminEdit.do?adminId="+avo.getAdminId();
		if(cnt>0){
			msg="관리자 정보가 수정 되었습니다.";
		}else{
			url="/admin/Mng/adminEdit.do";
			msg="관리자 수정 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/adminOut.do")
	public String outAdmin(@RequestParam String adminId, Model model){
		logger.info("관리 - 관리자 탈퇴처리 대상 adminId={}", adminId);
		
		int cnt=aService.updateAdminOutdate(adminId);
		logger.info("관리 - 관리자 수정 결과 cnt={}", cnt);
		
		String msg="", url="/admin/Mng/adminList.do";
		if(cnt>0){
			msg="해당 관리자가 제외처리 되었습니다.";
		}else{
			msg="관리자 제외처리 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	/*@RequestMapping("/adminDetail.do")
	public String adminDetail(@RequestParam String adminId, Model model){
		logger.info("관리 - 관리자 상세보기 파라미터 adminId={}", adminId);
		
		AdminVO avo=aService.selectOneAdmin(adminId);
		logger.info("관리 - 관리자 상세보기 조회결과 adminId={}", adminId);
		
		model.addAttribute("avo", avo);
		
		return "administrator/admin_Management/adminDetail";
	}*/
}
