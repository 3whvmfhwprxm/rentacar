package com.third.rent.admin_CarModel.controller;

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

import com.third.rent.admin_CarModel.model.Admin_CarModelServiceImpl;
import com.third.rent.admin_Company.controller.Admin_CompanyController;
import com.third.rent.car.model.CarVO;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;

@Controller
@RequestMapping("/administrator")
public class Admin_CarModelController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(Admin_CompanyController.class);
	
	@Autowired
	private Admin_CarModelServiceImpl adminCarModelService;
	
	@RequestMapping("/carModel/modelList.do")
	public String CarModelList(@ModelAttribute SearchVO searchVo,
			Model model){
		//1
		logger.info("차량모델목록, 파라미터 searchVo={}", searchVo);

		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<CarVO> carList = adminCarModelService.selectAll(searchVo);
		logger.info("차량모델목록 조회결과, carList.size()={}", carList.size());

		int totalRecord = adminCarModelService.selectTotalRecord(searchVo);
		logger.info("차량모델목록 조회 - 전체 차량모델수 조회 결과, totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		//3
		model.addAttribute("carList", carList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "administrator/carModel/modelList";
	}
	
	@RequestMapping(value="/carModel/modelRegister.do", method=RequestMethod.GET)
	public String modelRegister_get(){
		logger.info("차량등록화면 보여주기");
			
		return "administrator/carModel/modelRegister";
	}
	
	@RequestMapping(value="/carModel/modelRegister.do", method=RequestMethod.POST)
	public String companyRegister_post(@ModelAttribute CarVO carVo, Model model){
		logger.info("차량등록 처리, 파라미터 carVo={}", carVo);

		int cnt = adminCarModelService.insertCarModel(carVo);
		String msg="", url="";
		if(cnt>0){
			msg="업체등록 성공";
			url="/administrator/carModel/modelList.do";
		}else{
			msg="업체등록 실패";
			url="/administrator/carModel/modelRegister.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/carModel/modelDetail.do")
	public String companyDetail(@RequestParam String carCode, Model model){
		logger.info("글 상세보기, 파라미터 carCode={}", carCode);
		if(carCode.isEmpty()){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/administrator/company/companyList.do");

			return "common/message";
		}

		CarVO carVo = adminCarModelService.selectByCarCode(carCode);
		logger.info("상세보기 결과, carVo={}", carVo);

		model.addAttribute("carVo", carVo);

		return "administrator/carModel/modelDetail";
	}
}
