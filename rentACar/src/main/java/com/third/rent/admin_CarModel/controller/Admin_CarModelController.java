package com.third.rent.admin_CarModel.controller;

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

import com.third.rent.admin_CarModel.model.Admin_CarModelServiceImpl;
import com.third.rent.admin_Company.controller.Admin_CompanyController;
import com.third.rent.car.model.CarVO;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.adminImagesUpload;
import com.third.rent.common.admin_Utility;

@Controller
@RequestMapping("/administrator")
public class Admin_CarModelController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(Admin_CompanyController.class);
	
	@Autowired
	private Admin_CarModelServiceImpl adminCarModelService;
	
	@Autowired
	private adminImagesUpload adminImgUpload;
	
	@RequestMapping("/carModel/modelList.do")
	public String CarModelList(@ModelAttribute SearchVO searchVo,
			Model model){
		//1
		logger.info("차량모델목록, 파라미터 searchVo={}", searchVo);

		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(admin_Utility.ADMIN_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(admin_Utility.ADMIN_RECORDCOUNT_PERPAGE);
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
	public String companyRegister_post(@ModelAttribute CarVO carVo, 
			HttpServletRequest request, Model model){
		logger.info("차량등록 처리, 파라미터 carVo={}", carVo);

		List<Map<String, Object>> carImgList
			= adminImgUpload.carImgUpload(request, adminImagesUpload.carImg_UPLOAD);
	
		if(carImgList.size()==1){
			carVo.setCarImg(carImgList.get(0).get("carImg").toString());
		}else if(carImgList.size()==2){
			carVo.setCarImg(carImgList.get(0).get("carImg").toString());
			carVo.setCarImg2(carImgList.get(1).get("carImg").toString());
		}else if(carImgList.size()==3){
			carVo.setCarImg(carImgList.get(0).get("carImg").toString());
			carVo.setCarImg2(carImgList.get(1).get("carImg").toString());
			carVo.setCarImg3(carImgList.get(2).get("carImg").toString());
		}
		
		int cnt = adminCarModelService.insertCarModel(carVo);
		String msg="", url="";
		if(cnt>0){
			msg="차량등록 성공";
			url="/administrator/carModel/modelList.do";
		}else{
			msg="차량등록 실패";
			url="/administrator/carModel/modelRegister.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/carModel/modelEdit.do", method=RequestMethod.GET)
	public String modelEdit_get(@RequestParam String carCode,
			Model model){
		logger.info("차량수정화면 보여주기, 파라미터 carCode={}", carCode);
		
		if(carCode==null || carCode.isEmpty()){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "administrator/carModel/modelList");
			
			return "common/message";
		}
		
		CarVO carVo
			= adminCarModelService.selectByCarCode(carCode);
		logger.info("차량수정화면 조회결과 carVo={}", carVo);
		
		model.addAttribute("carVo", carVo);
		
		return "administrator/carModel/modelEdit";
	}
	
	@RequestMapping(value="/carModel/modelEdit.do", method=RequestMethod.POST)
	public String modelEdit_post(@ModelAttribute CarVO carVo, @RequestParam String oldFileName1, 
			@RequestParam String oldFileName2, @RequestParam String oldFileName3, 
			HttpServletRequest request, Model model){
		logger.info("차량 수정 처리, 파라미터 carVo={}", carVo);
		
		List<Map<String, Object>> carImgList
			= adminImgUpload.carImgUpload(request, adminImagesUpload.carImg_UPLOAD);
		
		if(carImgList.size()==1){
			carVo.setCarImg(carImgList.get(0).get("carImg").toString());
		}else if(carImgList.size()==2){
			carVo.setCarImg(carImgList.get(0).get("carImg").toString());
			carVo.setCarImg2(carImgList.get(1).get("carImg").toString());
		}else if(carImgList.size()==3){
			carVo.setCarImg(carImgList.get(0).get("carImg").toString());
			carVo.setCarImg2(carImgList.get(1).get("carImg").toString());
			carVo.setCarImg3(carImgList.get(2).get("carImg").toString());
		}
		
			
		if(oldFileName1!=null && !oldFileName1.isEmpty()){
			String upPath = adminImgUpload.getcarImgUploadPath(request, adminImagesUpload.FILE_UPLOAD);
			File oldFile = new File(upPath, oldFileName1);
			if(oldFile.exists()){
				boolean bool = oldFile.delete();
				logger.info("기존 파일 삭제 여부:{}", bool);
			}
		}else if(oldFileName2!=null && !oldFileName2.isEmpty()){
			String upPath = adminImgUpload.getcarImgUploadPath(request, adminImagesUpload.FILE_UPLOAD);
			File oldFile = new File(upPath, oldFileName2);
			if(oldFile.exists()){
				boolean bool = oldFile.delete();
				logger.info("기존 파일 삭제 여부:{}", bool);
			}
		}else if(oldFileName3!=null && !oldFileName3.isEmpty()){
			String upPath = adminImgUpload.getcarImgUploadPath(request, adminImagesUpload.FILE_UPLOAD);
			File oldFile = new File(upPath, oldFileName3);
			if(oldFile.exists()){
				boolean bool = oldFile.delete();
				logger.info("기존 파일 삭제 여부:{}", bool);
			}
		}

		
		int cnt = adminCarModelService.updateCarModel(carVo);
		logger.info("차량 수정 결과 cnt={}", cnt);
		
		String msg = "", url = "/administrator/carModel/modelList.do";
		if(cnt>0){
			msg = "차량 수정 성공";
			url = "/administrator/carModel/modelDetail.do?carCode="+carVo.getCarCode();
		}else{
			msg = "차량 수정 실패";
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
			model.addAttribute("url", "/administrator/carModel/modelList.do");

			return "common/message";
		}

		CarVO carVo = adminCarModelService.selectByCarCode(carCode);
		logger.info("상세보기 결과, carVo={}", carVo);

		model.addAttribute("carVo", carVo);

		return "administrator/carModel/modelDetail";
	}
}
