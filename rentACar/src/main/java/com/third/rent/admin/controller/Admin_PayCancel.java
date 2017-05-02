/*package com.third.rent.admin.controller;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/admin")
public class Admin_PayCancel {
	
	private static final Logger logger=LoggerFactory.getLogger(Admin_PayCancel.class);
	
	private IamportClient client;
	
	@RequestMapping("/payCancel_22.do")
	public String CancelPaymentByMerchantUid(@RequestParam String payNo) {
		String api_key = "2564830999358043";
		String api_secret = "OfVxUx173DxRXBPWzdxoj0IDo2I8aUrZamw4UycXcJO9lD6VQEj9E2N35wcfrDeB0LGUjSSvCGFXkMTb";
		client = new IamportClient(api_key, api_secret);
		
		IamportResponse<AccessToken> auth_response = client.getAuth();
		assertNotNull(auth_response.getResponse());
		assertNotNull(auth_response.getResponse().getToken());
		
		String token=auth_response.getResponse().getToken();
		
		String merchant_uid = "merchant_1448280088556";
		CancelData cancel_data = new CancelData(merchant_uid, false); //merchant_uid를 통한 전액취소
		IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
		
		assertNull(payment_response.getResponse()); // 이미 취소된 거래는 response가 null이다
		
		String cancelResult=payment_response.getMessage();
		logger.info("결제 취소 결과 cancelResult={}", cancelResult);
		
		return "administrator/payInfo/payInfoList";
	}
	
}
*/