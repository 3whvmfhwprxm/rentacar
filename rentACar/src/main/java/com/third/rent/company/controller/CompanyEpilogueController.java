package com.third.rent.company.controller;

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
import com.third.rent.admin_Board.model.Admin_BoardService;
import com.third.rent.admin_Company.model.Admin_CompanyService;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;
import com.third.rent.company.model.CompanyService;
import com.third.rent.company.model.CompanyVO;
import com.third.rent.company.notice.model.CompanyNoticeVO;


@Controller
@RequestMapping("/com_manage")
public class CompanyEpilogueController {

	private static final Logger logger=LoggerFactory.getLogger(CompanyEpilogueController.class);
	
	@Autowired
	private Admin_BoardService adService;
	
	@Autowired
	private CompanyService comService;
	
	@RequestMapping("/company_epilogue.do")
	public String consel_index(){
		
		logger.info("후기화면 구현");
		
		return "com_manage/company_epilogue";
	}
	
	
	@RequestMapping("/company_announcement.do")
	public String companyAnnouncement(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("업체 공지사항 화면표시 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.COM_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<CompanyNoticeVO> cnList=adService.selectCN(searchVo);
		logger.info("업체 공지사항 리스트 수, cnList.size()={}", cnList.size());
		
		int totalRecord=adService.selectTotalRecordC(searchVo);
		logger.info("업체 공지사항 전체수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("cnList", cnList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "com_manage/company_announcement";
	}
	
	@RequestMapping(value="/company_detail.do",method=RequestMethod.GET)
	public String companyEdit_get(@RequestParam String comId,
			Model model){
		
		//String comId = null;
		logger.info("업체화면 보여주기, 파라미터 comId={}", comId);
		
		if(comId==null || comId.isEmpty()){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "com_manage/company_detail");
			
			return "common/message";
		}
		
		CompanyVO companyVo
			= comService.selectBycomId(comId);
		logger.info("업체화면 조회결과 companyVo={}", companyVo);
		
		model.addAttribute("companyVo", companyVo);
		
		return "com_manage/company_detail";
	}
	/*@RequestMapping(value="/company_edit.do", method=RequestMethod.GET)
	public String companyEdit_get(){
		logger.info("업체수정화면 조회결과");
		
		return "/com_manage/company_edit";
		
	}*/
	
	@RequestMapping(value="/company_detail.do", method=RequestMethod.POST)
	public String companyEdit_post(@ModelAttribute CompanyVO companyVo,
			Model model){
		logger.info("업체 수정 처리, 파라미터 companyVo={}", companyVo);
		

		int cnt = comService.updateCompany(companyVo);
		logger.info("업체 수정 결과 cnt={}", cnt);
		
		String msg = "", url = "";
		if(cnt>0){
			msg = "업체 수정 성공";
			url = "/com_manage/company_detail.do?comId="+companyVo.getComId();
		}else{
			msg = "업체 수정 실패";
		}

		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/company_revenue.do")
	public String consultation_inquiry(){
		
		logger.info("매출 통계 화면 구현");
		
		return "com_manage/company_revenue";
		
	}
	
	@RequestMapping("/company_announcement_detail.do")
	public String company_announcementDetail(){
		
		logger.info("공지사항 상세 화면 구현");
		
		return "com_manage/company_announcement_detail";
		
	}
	
	

	

	
	
}
