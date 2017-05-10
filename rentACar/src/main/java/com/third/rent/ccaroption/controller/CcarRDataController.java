package com.third.rent.ccaroption.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.ccaroption.model.CcarOptionService;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;

@Controller
@RequestMapping("/com_manage/rentalData")
public class CcarRDataController {
	private static final Logger logger =
			LoggerFactory.getLogger(CcarRDataController.class);
	
	@Autowired
	private CcarOptionService csService;
	
	@RequestMapping("/todayRentalCar.do")
	public String rentalCar(HttpSession session,
			@ModelAttribute SearchVO searchVo, Model model){
		String companyId = (String)session.getAttribute("comId");
		logger.info("렌탈 차량페이지, 파라미터 companyId={}", companyId);
		searchVo.setCompanyId(companyId);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.COM_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		
		int totalRecord = csService.todayRentalTR(searchVo);
		logger.info("오늘 대여 차량목록 조회 - 대여 차량 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("pagingInfo", pagingInfo);
		
		List<Map<String, Object>> alist =
				csService.selectRentalData(searchVo);
		logger.info("대여차량 목록 alist.size()={}",alist.size());
		
		model.addAttribute("rlist", alist);
		
		return "com_manage/rentalData/todayRentalCar";
	}
	
	@RequestMapping("/todayReturnCar.do")
	public String returnCar(HttpSession session,
			@ModelAttribute SearchVO searchVo, Model model){
		String companyId = (String)session.getAttribute("comId");
		logger.info("반납 차량페이지, 파라미터 companyId={}", companyId);
		searchVo.setCompanyId(companyId);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.COM_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		
		int totalRecord = csService.todayReturnTR(searchVo);
		logger.info("오늘 반납 차량목록 조회 - 반납 차량 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("pagingInfo", pagingInfo);
		
		List<Map<String, Object>> alist =
				csService.selectReturnData(searchVo);
		logger.info("반납차량 목록 alist.size()={}",alist.size());
		
		model.addAttribute("rlist", alist);
		
		return "com_manage/rentalData/todayReturnCar";
	}
	
	@RequestMapping("/rentalIngCar.do")
	public String rentalIng(HttpSession session,
			@ModelAttribute SearchVO searchVo, Model model){
		String companyId = (String)session.getAttribute("comId");
		logger.info("현재 대여중인 차량페이지, 파라미터 companyId={}", companyId);
		searchVo.setCompanyId(companyId);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.COM_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		
		int totalRecord = csService.rentalIngTR(searchVo);
		logger.info("대여중 차량목록 조회 - 대여 차량 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("pagingInfo", pagingInfo);
		
		List<Map<String, Object>> alist =
				csService.selectRentalIng(searchVo);
		logger.info("대여차량 목록 alist.size()={}",alist.size());
		
		model.addAttribute("rlist", alist);
		
		return "com_manage/rentalData/rentalIngCar";
	}
	
	@RequestMapping("/endRentalCar.do")
	public String endRentalCar(HttpSession session,
			@ModelAttribute SearchVO searchVo, Model model){
		String companyId = (String)session.getAttribute("comId");
		logger.info("반납완료 차량페이지, 파라미터 companyId={}", companyId);
		searchVo.setCompanyId(companyId);
		
		/*PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.COM_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		
		int totalRecord = csService.rentalIngTR(searchVo);
		logger.info("반납완료 차량목록 조회 - 반납 차량 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("pagingInfo", pagingInfo);
		
		List<Map<String, Object>> alist =
				csService.selectRentalIng(searchVo);
		logger.info("반납차량 목록 alist.size()={}",alist.size());
		
		model.addAttribute("rlist", alist);*/
		
		return "com_manage/rentalData/endRentalCar";
	}
}
