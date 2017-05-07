package com.third.rent.admin.controller;

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

import com.third.rent.common.PaginationInfo;
import com.third.rent.common.Utility;
import com.third.rent.reservation.model.ReservListVO;
import com.third.rent.reservation.model.ReservationService;
import com.third.rent.reservation.model.ReservationVO;

@Controller
@RequestMapping("/admin/reserv")
public class Admin_reservInfoController {
	
	private static final Logger logger=LoggerFactory.getLogger(Admin_reservInfoController.class);
	
	@Autowired
	private ReservationService rService;
	
	@RequestMapping("/reservInfo.do")
	public String reservInfo(@ModelAttribute ReservationVO rvo, Model model){
		
		logger.info("예약 내역 조회 핸들러 호출, 파라미터 rvo={}", rvo);
		
		PaginationInfo pInfo=new PaginationInfo();
		pInfo.setCurrentPage(rvo.getCurrentPage());
		pInfo.setBlockSize(Utility.ADMIN_OUT_COMPANY_BLOCKSIZE);
		pInfo.setRecordCountPerPage(Utility.ADMIN_OUT_COMPANY_RECORDCOUNT_PERPAGE);
		
		rvo.setFirstRecordIndex(pInfo.getFirstRecordIndex());
		rvo.setRecordCountPerPage(Utility.ADMIN_OUT_COMPANY_RECORDCOUNT_PERPAGE);
		
		List<Map<String, Object>> rlist=rService.selectReservPayInfo(rvo);
		logger.info("예약 내역 조회 결과 map.size()={}", rlist.size());
		
		int totalRecord=rService.selectTotalRecordWithPayInfo(rvo);
		logger.info("예약 내역 전체 조회 결과 수 totalRecord={}", totalRecord);
		
		pInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("pagingInfo", pInfo);
		
		return "administrator/reserv/reservInfo";
	}
	
	@RequestMapping(value="/reservMultiCancel.do", method=RequestMethod.POST)
	public String reservMultiCancel(@ModelAttribute ReservListVO rlistvo, Model model){
		logger.info("관리자 - 선택한 예약 목록 취소 파라미터 rlistvo={}", rlistvo);
		
		List<ReservationVO> reservlist=rlistvo.getReservItems();
		int result=rService.multiCancelReserv(reservlist);
		logger.info("관리자 - 선택한 예약 목록 취소 결과 result={}", result);
		
		String url="/admin/reserv/reservInfo.do", msg="";
		if(result!=-1){
			msg="선택한 예약 목록이 취소되었습니다.";
		}else{
			msg="선택한 예약 목록 취소가 실패했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
