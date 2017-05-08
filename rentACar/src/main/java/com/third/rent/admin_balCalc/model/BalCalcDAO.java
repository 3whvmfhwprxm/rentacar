package com.third.rent.admin_balCalc.model;

import java.util.List;

public interface BalCalcDAO {
	public int insertBalCalc(BalCalcVO bvo);	//정산 대상(특정월의 특정기업의 매출, 수수료등) 입력 처리
	public int updateBalCalc(int balNum);	//정산처리날짜 업데이트 (날짜가 null이 아니면 정산처리 됐음을 의미)
	public List<BalCalcVO> selectBalCalc(String targetDate); //특정 월의 정산 목록 불러오기
}
