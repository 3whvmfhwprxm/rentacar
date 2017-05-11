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
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.ccaroption.model.CcarListVO;
import com.third.rent.ccaroption.model.CcarOptionService;
import com.third.rent.ccaroption.model.CcarOptionVO;
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
	
	@RequestMapping("/updateStatusCg.do")
	public String StatusCg(@RequestParam String ccarStatus,
			@RequestParam String ccarCarId, HttpSession session,
			@ModelAttribute SearchVO searchVo,
			Model model){
		String companyId = (String)session.getAttribute("comId");
		searchVo.setCompanyId(companyId);
		logger.info("대여상태 변경 처리하기, 파라미터 comId={}, ccarStatus={}", companyId, ccarStatus);
		logger.info("파라미터 ccarCarId={}", ccarCarId);
		CcarOptionVO vo = new CcarOptionVO();
		vo.setCcarCarId(ccarCarId);
		vo.setComId(companyId);
		String status="";
		String msg="", url="";
		int cnt= 0;
		/* 대여상태(status) 에 따라 메서드를 호출하여 상태를 변경하게 함 */
		if(ccarStatus.equals("HOLD")){
			logger.info("상태 홀드");
			status="RENT";
			vo.setCcarStatus(status);
			cnt = csService.updateStatusCgHold(vo);
			url="/com_manage/rentalData/todayRentalCar.do";
		}else if(ccarStatus.equals("RENT")){
			logger.info("상태 렌트");
			status="RETURN";
			vo.setCcarStatus(status);
			cnt = csService.updateStatusCgRent(vo);
			url="/com_manage/rentalData/todayReturnCar.do";
		}else if(ccarStatus.equals("RETURN")){
			logger.info("상태 리턴");
			status="HOLD";
			vo.setCcarStatus(status);
			cnt=csService.updateStatusCgReturn(vo);
			url="/com_manage/rentalData/todayEndnCar.do";
		}
		
		if(cnt<=0){
			msg="차량상태 변경에 실패했습니다!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/multiUpdateStatusCgHold.do")
	public String multiHold(@ModelAttribute CcarListVO cCarItems, HttpSession session,
			@ModelAttribute SearchVO searchVo,
			Model model){
		String companyId = (String)session.getAttribute("comId");
		logger.info("대여상태 변경 처리하기, 파라미터 cCarList={}", cCarItems);
		List<CcarOptionVO> cvoList = cCarItems.getcCarItems();
		int cnt = csService.multiMoveHold(cvoList);
		logger.info("선택항목 보내기 결과 cnt ={}", cnt);
		
		String msg="", url="/com_manage/rentalData/todayRentalCar.do";
		if(cnt>0){
			msg="선택한 항목 보내기성공!";
		}else{
			msg="선택항목 보내기 처리 중 에러가 발생했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/multiUpdateStatusCgRent.do")
	public String multiRent(@ModelAttribute CcarListVO cCarItems, HttpSession session,
			@ModelAttribute SearchVO searchVo,
			Model model){
		String companyId = (String)session.getAttribute("comId");
		logger.info("대여상태 변경 처리하기, 파라미터 cCarList={}", cCarItems);
		List<CcarOptionVO> cvoList = cCarItems.getcCarItems();
		int cnt = csService.multiMoveRent(cvoList);
		logger.info("선택항목 보내기 결과 cnt ={}", cnt);
		
		String msg="", url="/com_manage/rentalData/todayReturnCar.do";
		if(cnt>0){
			msg="선택한 항목 보내기성공!";
		}else{
			msg="선택항목 보내기 처리 중 에러가 발생했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/multiUpdateStatusCgReturn.do")
	public String multiReturn(@ModelAttribute CcarListVO cCarItems, HttpSession session,
			@ModelAttribute SearchVO searchVo,
			Model model){
		String companyId = (String)session.getAttribute("comId");
		logger.info("대여상태 변경 처리하기, 파라미터 cCarList={}", cCarItems);
		List<CcarOptionVO> cvoList = cCarItems.getcCarItems();
		int cnt = csService.multiMoveReturn(cvoList);
		logger.info("선택항목 보내기 결과 cnt ={}", cnt);
		
		String msg="", url="/com_manage/rentalData/todayRentalCar.do";
		if(cnt>0){
			msg="선택한 항목 삭제성공!";
		}else{
			msg="선택항목 보내기 처리 중 에러가 발생했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}




