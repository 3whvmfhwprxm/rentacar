package com.third.rent.admin_balCalc.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

@Controller
public class BalCalcController {
	private static final Logger logger=LoggerFactory.getLogger(BalCalcController.class);
	
	@Scheduled(cron="0 0 0 1 * * ")	/*초 분 시 일 월 요일 (fixedRate=30000)*/
	public void doSchedule() {
	   logger.info("정산 스케쥴러 호출");
	   
	   
	}
}
