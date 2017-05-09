package com.third.rent.admin_payInfo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.third.rent.common.PaginationInfo;
import com.third.rent.common.Utility;
import com.third.rent.payInfo.model.PayInfoListVO;
import com.third.rent.payInfo.model.PayInfoService;
import com.third.rent.payInfo.model.PayInfoVO;

@Controller
@RequestMapping("/admin")
public class PayInfoController {
	
	private static final Logger logger=LoggerFactory.getLogger(PayInfoController.class);
	
	/*private IamportClient client;*/
	
	@Autowired
	private PayInfoService pService;
	
	@RequestMapping("/payInfo.do")
	public String selectPayInfo(@ModelAttribute PayInfoVO pvo, Model model){
		
		logger.info("결제 내역 조회 핸들러 호출, 파라미터 pvo={}", pvo);
		
		PaginationInfo pInfo=new PaginationInfo();
		pInfo.setCurrentPage(pvo.getCurrentPage());
		pInfo.setBlockSize(Utility.ADMIN_OUT_COMPANY_BLOCKSIZE);
		pInfo.setRecordCountPerPage(Utility.ADMIN_OUT_COMPANY_RECORDCOUNT_PERPAGE);
		
		pvo.setFirstRecordIndex(pInfo.getFirstRecordIndex());
		pvo.setRecordCountPerPage(Utility.ADMIN_OUT_COMPANY_RECORDCOUNT_PERPAGE);
		
		List<PayInfoVO>	plist=pService.selectPayInfo(pvo);
		logger.info("결제 내역 조회 결과 plist.size()={}", plist.size());
		
		int totalRecord=pService.selectTotalRecordPayInfo(pvo);
		logger.info("결제 내역 전체 조회 결과 수 totalRecord={}", totalRecord);
		pInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("plist", plist);
		model.addAttribute("pagingInfo", pInfo);
		
		return "administrator/payInfo/payInfoList";
	}	
	
	@RequestMapping(value="/payCancel.do", method=RequestMethod.POST)
	public String CancelPaymentByMerchantUid(@ModelAttribute PayInfoListVO pvo, Model model) {
		
		logger.info("결제 취소 하기 파라미터값: pvo={}", pvo);
	
		List<PayInfoVO> plist=pvo.getPayItems();
		int result=pService.multiCancelPayInfo(plist);
		logger.info("관리자 - 선택한 예약 목록 취소 결과 result={}", result);
		
		String url="/admin/payInfo.do", msg="";
		if(result!=-1){
			msg="선택한 결제 목록이 취소되었습니다.";
		}else{
			msg="선택한 결제 목록 취소가 실패했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		
		/*
		String api_key = "2564830999358043";
		String api_secret = "OfVxUx173DxRXBPWzdxoj0IDo2I8aUrZamw4UycXcJO9lD6VQEj9E2N35wcfrDeB0LGUjSSvCGFXkMTb";

		client = new IamportClient(api_key, api_secret);
		
		String token=client.getToken();
		logger.info("결제 취소 하기 token={}", token);
		
		String merchant_uid = "merchant_1448280088556";
		CancelData cancel_data = new CancelData(merchant_uid, false); //merchant_uid를 통한 전액취소
		IamportResponse<Payment> payment_response = client.cancelPayment(cancel_data);
		
		
		String cancelResult=payment_response.getMessage();
		logger.info("결제 취소 결과 cancelResult={}", cancelResult);
		*/
		
		return "common/message";
	}
}
