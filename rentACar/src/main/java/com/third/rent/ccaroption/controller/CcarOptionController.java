package com.third.rent.ccaroption.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.ccaroption.model.CcarOptionService;
import com.third.rent.ccaroption.model.CcarOptionVO;

@Controller
@RequestMapping("/com_manage")
public class CcarOptionController {
	private static final Logger logger =
			LoggerFactory.getLogger(CcarOptionController.class);

	@Autowired
	private CcarOptionService ccarOptionService;

	@RequestMapping(value="/company_optionRegist.do", method=RequestMethod.GET)
	public String optionRegist_get(){

		logger.info("옵션등록화면 보여주기");

		return "com_manage/company_optionRegist";
	}

	@RequestMapping(value="/company_optionRegist.do", method=RequestMethod.POST)
	public String optionRegist_post(@ModelAttribute CcarOptionVO vo,
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

		int cnt = ccarOptionService.insertCcarOption(vo);
		logger.info("vo 수정후 등록처리 vo={}", vo);
		String msg="", url="/login_company/companyMain.do";
		if(cnt>0){
			msg="옵션등록성공";
			url="/com_manage/company_ccarList.do";
		}else{
			msg="옵션등록실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}


	@RequestMapping(value="/company_ccarList.do", method=RequestMethod.GET)
	public String list_get(Model model){
		logger.info("업체차량 전체현황 보여주기");
			
		List<Map<String, Object>> cclist =
				ccarOptionService.selectAllComCar();
		logger.info("cclist.size()={}", cclist.size());
		
		model.addAttribute("cclist", cclist);
		return "com_manage/company_ccarList";
	}


	@RequestMapping(value="/company_ccarDetail.do", method=RequestMethod.GET)
	public String ccarDetail(@RequestParam String ccarCarId, Model model){
		logger.info("차량 상세정보 보여주기, 파라미터 ccarCarId={}", ccarCarId);
		String ccarid = ccarCarId;
		
		HashMap<String, Object> map  
			= ccarOptionService.selectByCcarId(ccarid);

		model.addAttribute("map", map);
		
		return "com_manage/company_ccarDetail";
	}

	@RequestMapping(value="/company_ccarEdit.do", method=RequestMethod.GET)
	public String ccarEdit(@RequestParam String ccarCarId, Model model){
		logger.info("차량 수정화면 보여주기, 파라미터 ccarCarId={}", ccarCarId);
		String ccarid = ccarCarId;
		
		HashMap<String, Object> map  
			= ccarOptionService.selectByCcarId(ccarid);

		model.addAttribute("map", map);
		
		return "com_manage/company_ccarEdit";
	}
}
