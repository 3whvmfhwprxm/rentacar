package com.third.rent.admin_Company.controller;

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
import com.third.rent.admin_Company.model.Admin_CompanyService;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;
import com.third.rent.company.model.CompanyVO;

@Controller
@RequestMapping("/administrator")
public class Admin_CompanyController {
	private static final Logger logger
		= LoggerFactory.getLogger(Admin_CompanyController.class);
	
	@Autowired
	private Admin_CompanyService adminCompanyService;
	
	@RequestMapping("/company/companyList.do")
	public String companyList(@ModelAttribute SearchVO searchVo, Model model){
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
	
	@RequestMapping(value="/company/companyRegister.do", method=RequestMethod.GET)
	public String companyRegister_get(Model model){
		logger.info("업체등록화면 보여주기");
			
			return "administrator/company/companyRegister";
		}
	
	@RequestMapping(value="/company/companyRegister.do", method=RequestMethod.POST)
	public String companyRegister_post(@ModelAttribute CompanyVO comVo,
			@RequestParam(value="email3", required=false) String email3,
			Model model){
		//1
		logger.info("업체등록 처리, 파라미터 comVo={}", comVo);
		
		//2
		String tel2 = comVo.getComTel2();
		String tel3 = comVo.getComTel3();
		if(tel2==null || tel2.isEmpty() || tel3==null || tel3.isEmpty()){
			comVo.setComTel1("");
			comVo.setComTel2("");
			comVo.setComTel3("");
		}
		
		String email1=comVo.getComEmail1();
				
		if(email1==null || email1.isEmpty()){
			comVo.setComEmail2("");;
		}else{
			if(comVo.getComEmail2().equals("etc")){
				if(email3 !=null && !email3.isEmpty()){
					comVo.setComEmail2(email3);
				}else{
					comVo.setComEmail2("");
					comVo.setComEmail2("");
				}
			}
		}
		
		int cnt = adminCompanyService
		String msg="", url="";
		if(cnt>0){
			msg="업체등록 성공";
			url="/administrator/company/companyList.do";
		}else{
			msg="업체등록 실패";
			url="/administrator/company/companyRegister.do";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/company/companyDetail.do")
	public String companyDetail(@RequestParam String comId, Model model){
		//1.
		logger.info("글 상세보기, 파라미터 comId={}", comId);
		if(comId.isEmpty()){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/administrator/company/companyList.do");

			return "common/message";
		}

		//2.
		CompanyVO companyDetail = adminCompanyService.selectByComId(comId);
		logger.info("상세보기 결과, companyDetail={}", companyDetail);


		//3.
		model.addAttribute("companyDetail", companyDetail);

		return "administrator/company/companyDetail";
	}
	
	@RequestMapping(value="/company/companyEdit.do", method=RequestMethod.GET)
	public String companyEdit_get(@RequestParam String comId,
			Model model){
		logger.info("업체수정화면 보여주기, 파라미터 comId={}", comId);
		
		if(comId==null || comId.isEmpty()){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "administrator/company/companyList");
			
			return "common/message";
		}
		
		CompanyVO companyVo
			= adminCompanyService.selectByComId(comId);
		logger.info("업체수정화면 조회결과 companyVo={}", companyVo);
		
		model.addAttribute("companyVo", companyVo);
		
		return "administrator/company/companyEdit";
	}
	
	@RequestMapping(value="/company/companyEdit.do", method=RequestMethod.POST)
	public String companyEdit_post(@ModelAttribute CompanyVO companyVo,
			@ModelAttribute AdminVO adminVo,
			Model model){
		logger.info("업체 수정 처리, 파라미터 companyVo={}", companyVo);
		

		int cnt = adminCompanyService.updateCompany(companyVo);
		logger.info("업체 수정 결과 cnt={}", cnt);
		
		String msg = "", url = "";
		if(cnt>0){
			msg = "업체 수정 성공";
			url = "/administrator/company/companyEdit.do?comId="+companyVo.getComId();
		}else{
			msg = "업체 수정 실패";
		}

		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}




