package com.third.rent.admin_balCalc.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BalCalcServiceImple implements BalCalcService{
	
	@Autowired
	private BalCalcDAO bdao;

	@Override
	public int insertBalCalc(BalCalcVO bvo) {
		return bdao.insertBalCalc(bvo);
	}

	@Override
	public int updateBalCalc(int balNum) {
		return bdao.updateBalCalc(balNum);
	}

	@Override
	public List<BalCalcVO> selectBalCalc(String targetDate) {
		return bdao.selectBalCalc(targetDate);
	}

	@Override
	public int updateMulti(List<BalCalcVO> ballist) {
		
		return 0;
	}

}
