package com.third.rent.admin_balCalc.model;

import java.util.List;

public interface BalCalcService {
	public int insertBalCalc(BalCalcVO bvo);	//정산 대상(특정월의 특정기업의 매출, 수수료등) 입력 처리
	public int updateBalCalcYES(String balNum);	//정산처리날짜 업데이트 (날짜가 null이 아니면 정산처리 됐음을 의미)
	public int updateBalCalcNO(String balNum);		//정산처리 NO으로 바꾸기 (날짜를 null로 전환)	
	public List<BalCalcVO> selectBalCalc(String targetDate); //특정 월의 정산 목록 불러오기	
	public int selectCountExist(BalCalcVO bvo);	//해당 기업의 해당년월의 정산정보가 이미 등록되어 있는지 확인
	
	public int updateMultiYES(List<BalCalcVO> ballist);	//정산처리날짜 일괄 업데이트 (승인)
	public int updateMultiNO(List<BalCalcVO> ballist);	//정산처리날짜 일괄 업데이트 (취소)
	public int insertMulti(List<BalCalcVO> ballist);	//특정일(예: 매월 1일)에 계산하여 정산내역에 insert 처리 
	
}
