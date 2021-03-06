package com.third.rent.admin_Company.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.rent.admin_Company.model.Admin_CompanyService;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.adminImagesUpload;
import com.third.rent.common.admin_Utility;
import com.third.rent.company.model.CompanyVO;
import com.third.rent.company.model.companyListVO;

@Controller
@RequestMapping("/administrator")
public class Admin_CompanyController {
	private static final Logger logger
		= LoggerFactory.getLogger(Admin_CompanyController.class);
	
	@Autowired
	private Admin_CompanyService adminCompanyService;
	
	@Autowired
	private adminImagesUpload adminImgUpload;
	
	@RequestMapping("/company/companyMain.do")
	public String companyMain(){
		logger.info("Company Main 띄우기");
		
		return "administrator/company/companyMain";
	}
	
	@RequestMapping("/company/companyList.do")
	public String companyList(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("업체목록, 파라미터 searchVo={}", searchVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(admin_Utility.ADMIN_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<CompanyVO> companyInList = adminCompanyService.selectInCompany(searchVo);
		logger.info("업체목록 조회결과, companyInList.size()={}", companyInList.size());
		
		int totalRecord = adminCompanyService.selectTotalRecord(searchVo);
		logger.info("업체목록 조회 - 전체 업체수 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("companyInList", companyInList);
		model.addAttribute("pagingInfo", pagingInfo);

		return "administrator/company/companyList";
	}
	
	@RequestMapping("/company/companyOutList.do")
	public String companyOutList(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("업체목록, 파라미터 searchVo={}", searchVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(admin_Utility.ADMIN_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<CompanyVO> companyOutList = adminCompanyService.selectOutCompany(searchVo);
		logger.info("업체목록 조회결과, companyOutList.size()={}", companyOutList.size());
		
		int totalRecord = adminCompanyService.selectTotalRecord(searchVo);
		logger.info("업체목록 조회 - 전체 업체수 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);
		model.addAttribute("companyOutList", companyOutList);
		model.addAttribute("pagingInfo", pagingInfo);

		return "administrator/company/companyOutList";
	}
	
	@RequestMapping("/company/companyCarList.do")
	public String companyCarList(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("업체목록, 파라미터 searchVo={}", searchVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(admin_Utility.ADMIN_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<CompanyVO> companyAllList = adminCompanyService.selectAllCompany(searchVo);
		logger.info("업체목록 조회결과, companyAllList.size()={}", companyAllList.size());
		
		int totalRecord = adminCompanyService.selectTotalRecord(searchVo);
		logger.info("업체목록 조회 - 전체 업체수 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("companyAllList", companyAllList);
		model.addAttribute("pagingInfo", pagingInfo);

		return "administrator/company/companyCarList";
	}
	
	@RequestMapping(value="/company/companyRegister.do", method=RequestMethod.GET)
	public String companyRegister_get(){
		logger.info("업체등록화면 보여주기");
			
		return "administrator/company/companyRegister";
	}
	
	@RequestMapping(value="/company/companyRegister.do", method=RequestMethod.POST)
	public String companyRegister_post(@ModelAttribute CompanyVO comVo, 
			HttpServletRequest request, Model model){
		logger.info("업체등록 처리, 파라미터 comVo={}", comVo);
		
		String tel2 = comVo.getComTel2();
		String tel3 = comVo.getComTel3();
		if(tel2==null || tel2.isEmpty() || tel3==null || tel3.isEmpty()){
			comVo.setComTel1("");
			comVo.setComTel2("");
			comVo.setComTel3("");
		}
		
		List<Map<String, Object>> comLogoList
			= adminImgUpload.companyLogoUpload(request, adminImagesUpload.companyLogo_UPLOAD);
		
		comVo.setComLogo(comLogoList.get(0).get("comLogo").toString());
		
		int cnt = adminCompanyService.insertCompany(comVo);
		String msg="", url="";
		if(cnt>0){
			msg="업체등록 성공";
			url="/administrator/company/companyList.do";
		}else{
			msg="업체등록 실패";
			url="/administrator/company/companyRegister.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/company/CheckCompanyId.do")
	@ResponseBody
	public boolean CheckCompanyId(@RequestParam String CompanyId){
		logger.info("ajax - 아이디 중복확인, 파라미터 CompanyId={}", CompanyId);
		
		int result = adminCompanyService.duplicateCompanyId(CompanyId);
		logger.info("아이디 중복확인, CompanyId={}", CompanyId);
		
		boolean bool = false;
		if(result==Admin_CompanyService.EXIST_ID){
			bool = true;
		}
		return bool;
	}
	
	@RequestMapping("/company/companyDetail.do")
	public String companyDetail(@RequestParam String comId, Model model){
		logger.info("글 상세보기, 파라미터 comId={}", comId);
		if(comId.isEmpty()){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/administrator/company/companyList.do");

			return "common/message";
		}

		CompanyVO companyVo = adminCompanyService.selectByComId(comId);
		logger.info("상세보기 결과, companyVo={}", companyVo);

		model.addAttribute("companyVo", companyVo);

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
			@RequestParam String oldFileName, HttpServletRequest request, Model model){
		logger.info("업체 수정 처리, 파라미터 companyVo={}", companyVo);
		
		List<Map<String, Object>> comLogoList
			= adminImgUpload.companyLogoUpload(request, adminImagesUpload.companyLogo_UPLOAD);
		
		String comLogo = "";
		if(!comLogoList.isEmpty()){
			for(Map<String, Object> map : comLogoList){
				comLogo = (String) map.get("comLogo");
			}

			if(oldFileName!=null && !oldFileName.isEmpty()){
				String upPath = adminImgUpload.getLogoUploadPath(request, adminImagesUpload.FILE_UPLOAD);
				File oldFile = new File(upPath, oldFileName);
				if(oldFile.exists()){
					boolean bool = oldFile.delete();
					logger.info("기존 파일 삭제 여부:{}", bool);
				}
			}
		}
		
		companyVo.setComLogo(comLogo);
	
		int cnt = adminCompanyService.updateCompany(companyVo);
		logger.info("업체 수정 결과 cnt={}", cnt);
		
		String msg = "", url = "";
		if(cnt>0){
			msg = "업체 수정 성공";
			url = "/administrator/company/companyDetail.do?comId="+companyVo.getComId();
		}else{
			msg = "업체 수정 실패";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/company/companyCar.do")
	public String list(@ModelAttribute SearchVO searchVo, @RequestParam String comId,	
			Model model){
		logger.info("업체차량 전체 보여주기");
			
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(admin_Utility.ADMIN_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		
		List<Map<String, Object>> cclist 
			= adminCompanyService.selectAllComCar(searchVo);
		logger.info("업체 차량목록 조회결과, cclist.size()={}", cclist.size());
		logger.info("cclist={}", cclist);

		int totalRecord = adminCompanyService.selectCarTotalRecord(searchVo);
		logger.info("업체 차량목록 조회 - 전체 업체 차량 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("cclist", cclist);
		
		return "administrator/company/companyCar";
	}
	
	@RequestMapping(value="/company/companyMultiWithdraw.do", method=RequestMethod.POST)
	public String companyMultiWithdraw_List(@ModelAttribute companyListVO companyListVo, Model model){
		logger.info("관리자 - 선택한 예약 목록 취소 파라미터 companyListVo={}", companyListVo);
		
		List<CompanyVO> companyList = companyListVo.getCompanyItems();
		int cnt = adminCompanyService.companyMultiWithdraw(companyList);
		logger.info("관리자 - 선택한 예약 목록 취소 결과 cnt={}", cnt);
		
		String msg="", url="/administrator/company/companyOutList.do";
		if(cnt>0){
			msg="선택한 업체가 탈퇴처리 되었습니다.";
		}else{
			msg="선택한 업체 탈퇴처리 중 에러가 발생했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/company/companyMultiReregister.do", method=RequestMethod.POST)
	public String companyMultiWithdraw_OutList(@ModelAttribute companyListVO companyListVo, Model model){
		logger.info("관리자 - 선택한 예약 목록 취소 파라미터 companyListVo={}", companyListVo);
		
		List<CompanyVO> companyList = companyListVo.getCompanyItems();
		int cnt = adminCompanyService.companyMultiReregister(companyList);
		logger.info("관리자 - 선택한 예약 목록 취소 결과 cnt={}", cnt);
		
		String msg="", url="/administrator/company/companyList.do";
		if(cnt>0){
			msg="선택한 업체가 재등록처리 되었습니다.";
		}else{
			msg="선택한 업체 재등록 처리 중 에러가 발생했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}




