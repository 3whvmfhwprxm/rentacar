package com.third.rent.admin_balCalc.model;

import java.util.List;
import java.util.Map;

public interface BalCalcDAO {
	public int insertBalCalc(BalCalcVO bvo);	//정산 대상(특정월의 특정기업의 매출, 수수료등) 입력 처리
	public int updateBalCalcYES(String balNum);	//정산처리날짜 업데이트 (날짜를 현재시간으로 업데이트)
	public int updateBalCalcNO(String balNum);		//정산처리 NO으로 바꾸기 (날짜를 null로 전환)
	public List<Map<String, Object>> selectBalCalc(String targetDate); //특정 월의 정산 목록 불러오기
	public int selectCountExist(BalCalcVO bvo);	//해당 기업의 해당년월의 정산정보가 이미 등록되어 있는지 확인 
}
