package com.third.rent.admin_Company.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.admin_Company.model.Admin_CompanyService;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;
import com.third.rent.company.model.CompanyVO;
import com.third.rent.user.model.UserVO;

@Controller
@RequestMapping("/administrator")
public class Admin_CompanyController {
	private static final Logger logger
		= LoggerFactory.getLogger(Admin_CompanyController.class);
	
	@Autowired
	private Admin_CompanyService adminCompanyService;
	
	@RequestMapping("/company/companyList.do")
	public String MemberList(@ModelAttribute SearchVO searchVo, Model model){
		//1
		logger.info("업체목록, 파라미터 searchVo={}", searchVo);

		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<CompanyVO> companyList = adminCompanyService.selectAllCompany(searchVo);
		logger.info("업체목록 조회결과, companyList.size()={}", companyList.size());

		int totalRecord = adminCompanyService.selectTotalRecord(searchVo);
		logger.info("업체목록 조회 - 전체 업체수 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		//3
		model.addAttribute("companyList", companyList);
		model.addAttribute("pagingInfo", pagingInfo);

		return "administrator/company/companyList";
	}
	
	@RequestMapping("/company/companyDetail.do")
	public String detail(@RequestParam String comId, Model model){
		//1.
		logger.info("글 상세보기, 파라미터 comId={}", comId);
		if(comId.isEmpty()){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/administrator/company/companyList.do");

			return "common/message";
		}

		//2.
		List<CompanyVO> companyDetail = adminCompanyService.selectByComId(comId);
		logger.info("상세보기 결과, companyDetail.size()={}", companyDetail.size());


		//3.
		model.addAttribute("companyDetail", companyDetail);

		return "administrator/company/companyDetail";
	}
}
