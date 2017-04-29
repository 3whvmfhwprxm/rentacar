package com.third.rent.admin_payInfo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.rent.common.PaginationInfo;
import com.third.rent.common.Utility;
import com.third.rent.payInfo.model.PayInfoService;
import com.third.rent.payInfo.model.PayInfoVO;

@Controller
@RequestMapping("/admin")
public class PayInfoController {
	
	private static final Logger logger=LoggerFactory.getLogger(PayInfoController.class);
	
	@Autowired
	private PayInfoService pService;
	
	@RequestMapping("/payInfo.do")
	public String selectPayInfo(@ModelAttribute PayInfoVO pvo, Model model){
		
		logger.info("결제 내역 조회 핸들러 호출, 파라미터 pvo={}", pvo);
		
		PaginationInfo pInfo=new PaginationInfo();
		pInfo.setCurrentPage(pvo.getCurrentPage());
		pInfo.setBlockSize(Utility.ADMIN_PAYINFO_BLOCKSIZE);
		pInfo.setRecordCountPerPage(Utility.ADMIN_PAYINFO_RECORDCOUNT_PERPAGE);
		
		pvo.setFirstRecordIndex(pInfo.getFirstRecordIndex());
		pvo.setBlockSize(Utility.ADMIN_PAYINFO_BLOCKSIZE);
		
		List<PayInfoVO>	plist=pService.selectPayInfo(pvo);
		logger.info("결제 내역 조회 결과 plist.size()={}", plist.size());
		
		int totalRecord=pService.selectTotalRecordPayInfo(pvo);
		pInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("plist", plist);
		model.addAttribute("pagingInfo", pInfo);
		
		return "administrator/payInfo/payInfoList";
	}
}
