package com.third.rent.ccaroption.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.rent.car.model.CarService;
import com.third.rent.car.model.CarVO;
import com.third.rent.ccaroption.model.CcarOptionService;
import com.third.rent.ccaroption.model.CcarOptionVO;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;

@Controller
@RequestMapping("/com_manage")
public class CcarOptionController {
	private static final Logger logger =
			LoggerFactory.getLogger(CcarOptionController.class);

	@Autowired
	private CcarOptionService ccarOptionService;
	
	@Autowired
	private CarService carService;

	@RequestMapping(value="/company_optionRegist.do", method=RequestMethod.GET)
	public String optionRegist_get(HttpSession session,
			Model model){
		String comId = (String) session.getAttribute("comId");
		logger.info("옵션등록화면 보여주기 comId={}", comId);
		
		List<CarVO> alist = carService.selectAllCar();
		
		model.addAttribute("slist",alist);
		model.addAttribute("comId", comId);
		
		return "com_manage/company_optionRegist";
	}

	@RequestMapping(value="/company_optionRegist.do", method=RequestMethod.POST)
	public String optionRegist_post(@ModelAttribute CcarOptionVO vo,
			@RequestParam String area, @RequestParam String carMiddleNum,
			Model model){
		logger.info("옵션등록처리, 파라미터 vo={}", vo);
		String aux = vo.getCcarAuxYn();
		String blackbox = vo.getCcarBlackboxYn();
		String bluetooth = vo.getCcarBluetoothYn();
		String navi = vo.getCcarNaviYn();
		String rearcam = vo.getCcarRearCameraYn();
		String rearSense = vo.getCcarRearSenceYn();
		String smartkey = vo.getCcarSmartkeyYn();
		String smoke = vo.getCcarSmokeYn();
		String sunroof = vo.getCcarSunRoofYn();
		String caruse = vo.getCcarUseYn();

		if(aux==null || aux.isEmpty()) aux = "N"; 
		if(blackbox==null || blackbox.isEmpty()) blackbox = "N";
		if(bluetooth==null || bluetooth.isEmpty()) bluetooth = "N";
		if(navi==null || navi.isEmpty()) navi = "N";
		if(rearcam==null || rearcam.isEmpty()) rearcam = "N";
		if(rearSense==null || rearSense.isEmpty()) rearSense = "N";
		if(smartkey==null || smartkey.isEmpty()) smartkey = "N";
		if(smoke==null || smoke.isEmpty()) smoke = "N";
		if(sunroof==null || sunroof.isEmpty()) sunroof = "N";
		if(caruse==null || caruse.isEmpty()) caruse = "N";

		vo.setCcarAuxYn(aux);
		vo.setCcarBlackboxYn(blackbox);
		vo.setCcarBluetoothYn(bluetooth);
		vo.setCcarNaviYn(navi);
		vo.setCcarRearCameraYn(rearcam);
		vo.setCcarRearSenceYn(rearSense);
		vo.setCcarSmartkeyYn(smartkey);
		vo.setCcarSmokeYn(smoke);
		vo.setCcarSunRoofYn(sunroof);
		vo.setCcarUseYn(caruse);

		logger.info("N작업후 vo = {}",vo);

		//연료,렌탈카운트0 처리
		int arrear = vo.getCcarArrear();
		int rentalcnt = vo.getCcarRentalcount();
		if(arrear==0){
			arrear=0;
		}
		if(rentalcnt==0){
			rentalcnt=0;
		}
		vo.setCcarArrear(arrear);
		vo.setCcarRentalcount(rentalcnt);
		
		String carId = vo.getCcarCarId();
		String CcarCarId =area+carMiddleNum+carId;
		vo.setCcarCarId(CcarCarId);
		logger.info("ccarCarId 합치기 파라미터 area={}, secondCarNum={}",area,carMiddleNum);
		logger.info("파라미터carId={}",carId);
		
		int cnt = ccarOptionService.insertCcarOption(vo);
		logger.info("vo 수정후 등록처리 vo={}", vo);
		String msg="", url="/login_company/companyMain.do";
		if(cnt>0){
			msg="차량등록이 처리되었습니다.";
			url="/com_manage/company_ccarList.do";
		}else{
			msg="차량등록실패!";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}


	@RequestMapping("/company_ccarList.do")
	public String list(@ModelAttribute SearchVO searchVo,
			HttpSession session,
			Model model){
		logger.info("업체차량 전체현황 보여주기");
			
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.COM_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		String comId = (String)session.getAttribute("comId");
		searchVo.setCompanyId(comId);
		logger.info("#############파라미터 회사아이디:" +comId);
		List<Map<String, Object>> cclist =
				ccarOptionService.selectAllComCar(searchVo);
		logger.info("업체 차량목록 조회결과, cclist.size()={}", cclist.size());

		int totalRecord = ccarOptionService.selectTotalRecord(searchVo);
		logger.info("업체 차량목록 조회 - 전체 업체 차량 조회 결과, totalRecord={}",
				totalRecord);
		
		

		pagingInfo.setTotalRecord(totalRecord);

		//3
		model.addAttribute("pagingInfo", pagingInfo);
		
		model.addAttribute("cclist", cclist);
		return "com_manage/company_ccarList";
	}


	@RequestMapping("/company_ccarDetail.do")
	public String ccarDetail(@RequestParam String ccarCarId, Model model){
		logger.info("차량 상세정보 보여주기, 파라미터 ccarCarId={}", ccarCarId);
		String ccarid = ccarCarId;
		
		HashMap<String, Object> map  
			= ccarOptionService.selectByCcarId(ccarid);

		model.addAttribute("map", map);
		
		return "com_manage/company_ccarDetail";
	}

	@RequestMapping(value="/company_ccarEdit.do", method=RequestMethod.GET)
	public String ccarEdit_get(@RequestParam String ccarCarId, Model model){
		logger.info("차량 수정화면 보여주기, 파라미터 ccarCarId={}", ccarCarId);
		String ccarid = ccarCarId;
		
		HashMap<String, Object> map  
			= ccarOptionService.selectByCcarId(ccarid);

		model.addAttribute("map", map);
		
		return "com_manage/company_ccarEdit";
	}
	
	@RequestMapping(value="/company_ccarEdit.do", method=RequestMethod.POST)
	public String ccarEdit_post(@ModelAttribute CcarOptionVO vo,
			Model model){
		logger.info("차량 수정처리, 파라미터=ccarOptionVo={}", vo);
		String aux = vo.getCcarAuxYn();
		String blackbox = vo.getCcarBlackboxYn();
		String bluetooth = vo.getCcarBluetoothYn();
		String navi = vo.getCcarNaviYn();
		String rearcam = vo.getCcarRearCameraYn();
		String rearSense = vo.getCcarRearSenceYn();
		String smartkey = vo.getCcarSmartkeyYn();
		String smoke = vo.getCcarSmokeYn();
		String sunroof = vo.getCcarSunRoofYn();
		String caruse = vo.getCcarUseYn();

		if(aux==null || aux.isEmpty()) aux = "N"; 
		if(blackbox==null || blackbox.isEmpty()) blackbox = "N";
		if(bluetooth==null || bluetooth.isEmpty()) bluetooth = "N";
		if(navi==null || navi.isEmpty()) navi = "N";
		if(rearcam==null || rearcam.isEmpty()) rearcam = "N";
		if(rearSense==null || rearSense.isEmpty()) rearSense = "N";
		if(smartkey==null || smartkey.isEmpty()) smartkey = "N";
		if(smoke==null || smoke.isEmpty()) smoke = "N";
		if(sunroof==null || sunroof.isEmpty()) sunroof = "N";
		if(caruse==null || caruse.isEmpty()) caruse = "N";

		vo.setCcarAuxYn(aux);
		vo.setCcarBlackboxYn(blackbox);
		vo.setCcarBluetoothYn(bluetooth);
		vo.setCcarNaviYn(navi);
		vo.setCcarRearCameraYn(rearcam);
		vo.setCcarRearSenceYn(rearSense);
		vo.setCcarSmartkeyYn(smartkey);
		vo.setCcarSmokeYn(smoke);
		vo.setCcarSunRoofYn(sunroof);
		vo.setCcarUseYn(caruse);
		
		//연료,렌탈카운트0 처리
		int arrear = vo.getCcarArrear();
		int rentalcnt = vo.getCcarRentalcount();
		if(arrear==0){
			arrear=0;
		}
		if(rentalcnt==0){
			rentalcnt=0;
		}
		vo.setCcarArrear(arrear);
		vo.setCcarRentalcount(rentalcnt);
		logger.info("수정 N작업후 vo = {}",vo);
		
		int cnt = ccarOptionService.updateCarOption(vo);
		String msg="", url="/com_manage/company_ccarList.do";
		if(cnt>0){
			msg="차량정보 수정이 정상적으로 처리되었습니다.";
			url="/com_manage/company_ccarDetail.do?ccarCarId=" +vo.getCcarCarId();
		}else{
			msg="차량정보 수정실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/company_ccarDelete.do", method=RequestMethod.POST)
	public String ccardelete_post(HttpSession session, @RequestParam String ccarCarId1
			,Model model){
		String ccarCarId= ccarCarId1;
		String comId = (String)session.getAttribute("comId");
		logger.info("차량 삭제처리, 파라미터=ccarCarId{},comId={}",ccarCarId,comId);
		CcarOptionVO vo = new CcarOptionVO();
		vo.setComId(comId);
		vo.setCcarCarId(ccarCarId);
		logger.info("차량 삭제처리, vo셋팅후={}",vo);
		int cnt =ccarOptionService.deleteCarOption(vo);
		String msg="", url="/com_manage/company_ccarList.do";
		if(cnt>0){
			msg="해당 차량등록 해지가 정상적으로 처리되었습니다.";
		}else{
			msg="차량 등록 해지 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	/*@RequestMapping(value="/checkCarId.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean checkCarId(@RequestParam String ccarCarId){
		logger.info("ajax-아이디 중복확인, 파라미터ccarCarId={}", ccarCarId);
		
		int result = ccarOptionService.checkCarId(ccarCarId);
		logger.info("아이디 중복확인, result={}", result);
		
		boolean bool=false;
		if(result==ccarOptionService.UN_USABLE_NUM){
			//차량번호가가 이미 존재하는경우
			bool=true;
		}
		return bool;
	}*/
	
	@RequestMapping("/updateCarUseYn.do")
	public String UpdateCarUseYn(@RequestParam String ccarUseYn,
			@RequestParam String ccarCarId, @RequestParam String comId,
			Model model){
		logger.info("상태변경 파라미터, ccaruseyn={},ccarCarId={}",ccarUseYn,ccarCarId);
		logger.info("상태변경 파라미터, comId={}",comId);
		CcarOptionVO vo = new CcarOptionVO();
		vo.setCcarCarId(ccarCarId);
		vo.setComId(comId);
		String useYn="";
		if(ccarUseYn.equals("Y")){
			useYn="N";
			vo.setCcarUseYn(useYn);
		}else if(ccarUseYn.equals("N")){
			useYn="Y";
			vo.setCcarUseYn(useYn);
		}
		
		int cnt = ccarOptionService.updateCarUseYn(vo);
		String msg="", url="/com_manage/company_ccarList.do";
		if(cnt<=0){
			msg="차량상태 변경에 실패했습니다!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping("/company_reservList.do")
	public String reservList(@ModelAttribute SearchVO searchVo,
			HttpSession session,
			Model model){
		String companyId = (String)session.getAttribute("comId");
		logger.info("업체 예약목록 관리 예약현황보여주기, 파라미터 comId={}",companyId);
		searchVo.setCompanyId(companyId);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.COM_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		
		int totalRecord = ccarOptionService.ReservTotalRecord(searchVo);
		logger.info("업체 예약목록 관리, 예약목록 조회결과 totalRecord={}",
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("pagingInfo", pagingInfo);
		
		List<Map<String, Object>> alist =
				ccarOptionService.selectComReserv(searchVo);
		logger.info("예약정보 조회결과 alist.size()={}",alist.size());
		
		model.addAttribute("crList", alist);
		
		return "com_manage/company_reservList";
	}
	
}




