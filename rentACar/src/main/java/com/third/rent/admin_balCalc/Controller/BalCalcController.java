package com.third.rent.admin_balCalc.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.admin_Company.model.Admin_CompanyService;
import com.third.rent.admin_balCalc.model.BalCalcService;
import com.third.rent.admin_balCalc.model.BalCalcVO;
import com.third.rent.admin_balCalc.model.BalCalcVOlist;
import com.third.rent.company.model.CompanyVO;

@Controller
public class BalCalcController {
	private static final Logger logger=LoggerFactory.getLogger(BalCalcController.class);

	@Autowired
	private Admin_CompanyService adminCservice;

	@Autowired
	private BalCalcService bCservice;

	@Scheduled(cron="0 0 0 1 * * ") /*초 분 시 일 월 요일 (fixedRate=120000)(cron="0 0 0 1 * * ") 매월 1일 실행되는 메서드 테스트는 2분마다 업데이트하는것으로 바꿈*/	public void doSchedule() {
		logger.info("정산 스케쥴러 호출");

		//오늘 날짜를 구하고, 그 기준으로 한달전 년월을 구한다
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");
		Date today=new Date();	   
		Calendar cal=Calendar.getInstance();
		cal.setTime(today);
		cal.add(Calendar.MONTH, -1);

		String aMonthBefore=sdf.format(cal.getTime());
		String[] splitDate=aMonthBefore.split("-");
		logger.info("정산 스케쥴러 한달전 시간 값 aMonthBefore={}", aMonthBefore);

		//등록되어 있는 전체업체 목록 불러오기
		List<CompanyVO> clist=adminCservice.selectAllCompanyID();
		logger.info("정산 스케쥴러 업체목록 clist={}", clist);

		//정산목록에 등록전 생성한 값들로 셋팅하기
		List<BalCalcVO> blist=new ArrayList<BalCalcVO>();

		for (int i = 0; i < clist.size(); i++) {
			CompanyVO cvo=clist.get(i);

			BalCalcVO bvo=new BalCalcVO();
			bvo.setComId(cvo.getComId());
			bvo.setBalTargetDate(aMonthBefore);
			bvo.setYear(splitDate[0]);
			bvo.setMonth(splitDate[1]);

			blist.add(bvo);
		}

		//정산목록에 등록 처리하기
		int result=bCservice.insertMulti(blist);
		logger.info("등록처리 결과 result={}", result);

	}

	@RequestMapping(value="/admin/balCalc/balCalcShow.do", method=RequestMethod.GET)
	public String selectBalCalclist_get(Model model){
		logger.info("정산 조회 호출 get");

		//오늘 날짜를 구하고, 그 기준으로 한달전 년월을 구한다
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");
		Date today=new Date();	   
		Calendar cal=Calendar.getInstance();
		cal.setTime(today);
		cal.add(Calendar.MONTH, -1);

		String aMonthBefore=sdf.format(cal.getTime());
		logger.info("정산 조회 get - 한달전 시간 값 세팅 aMonthBefore={}", aMonthBefore);	

		List<Map<String, Object>> blist=bCservice.selectBalCalc(aMonthBefore);
		logger.info("정산 조회 get - 결과값 blist={}", blist);

		model.addAttribute("blist", blist);

		return "administrator/balance_calc/bal_calc";
	}

	@RequestMapping(value="/admin/balCalc/balCalcShow.do", method=RequestMethod.POST)
	public String selectBalCalclist_post(@RequestParam String year, @RequestParam int month, Model model){
		logger.info("정산 조회 호출 post 파라미터값 year={}, month={}", year, month);
		
		String strMonth="";
		if(month<10){
			strMonth="0"+month;
		}else{
			strMonth=""+month;
		}
		
		List<Map<String, Object>> blist=bCservice.selectBalCalc(year+"-"+strMonth);
		logger.info("정산 조회 post 결과값 blist.size()={}", blist.size());

		model.addAttribute("blist", blist);

		return "administrator/balance_calc/bal_calc";
	}
	
	@RequestMapping(value="/admin/balCalc/balMultiDecision.do", method=RequestMethod.POST)
	public String balCalcMultiDecision(@ModelAttribute BalCalcVOlist balanceItems, Model model) {
		
		logger.info("정산처리 하기 - 파라미터값: balanceItems={}", balanceItems);
	
		List<BalCalcVO> blist=balanceItems.getBalanceItems();
		int result=bCservice.updateMultiYES(blist);
		logger.info("정산처리 하기 - 선택한 정산 대상 처리 결과 result={}", result);
		
		String url="/admin/balCalc/balCalcShow.do", msg="";
		if(result!=-1){
			msg="선택한 대상이 정산처리 되었습니다.";
		}else{
			msg="선택한 대상의 정산처리가 실패했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
				
		return "common/message";
	}
	
	@RequestMapping(value="/admin/balCalc/balCancel.do", method=RequestMethod.GET)
	public String balCalcCancel(@RequestParam String balNum, Model model) {
		
		logger.info("정산취소 하기 - 파라미터값: balNum={}", balNum);
	
		int result=bCservice.updateBalCalcNO(balNum);
		logger.info("정산취소 하기 - 선택한 정산 대상 취소 결과 result={}", result);
		
		String url="/admin/balCalc/balCalcShow.do", msg="";
		if(result!=-1){
			msg="선택한 대상이 정산취소 되었습니다.";
		}else{
			msg="선택한 대상 정산취소를 실패했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
				
		return "common/message";
	}
}
