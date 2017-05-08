package com.third.rent.admin_balCalc.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BalCalcServiceImple implements BalCalcService{
	
	@Autowired
	private BalCalcDAO bdao;

	@Override
	public int insertBalCalc(BalCalcVO bvo) {
		return bdao.insertBalCalc(bvo);
	}

	@Override
	public int updateBalCalcYES(String balNum) {
		return bdao.updateBalCalcYES(balNum);
	}

	@Override
	public int updateBalCalcNO(String balNum) {
		return bdao.updateBalCalcNO(balNum);
	}

	@Override
	public List<BalCalcVO> selectBalCalc(String targetDate) {
		return bdao.selectBalCalc(targetDate);
	}

	@Override
	public int selectCountExist(BalCalcVO bvo) {
		return bdao.selectCountExist(bvo);
	}

	@Override
	@Transactional
	public int insertMulti(List<BalCalcVO> ballist){
		int cnt=0;
		
		try{
			for (BalCalcVO vo : ballist) {
				if(vo.getComId()!=null){
					//해당 기업의 해당년월의 정산정보가 이미 등록되어 있는지 확인 
					int result=bdao.selectCountExist(vo);
					if(result==0){
						cnt=bdao.insertBalCalc(vo);
					}
				}
			}
		}catch(RuntimeException e){
			e.printStackTrace();
			cnt=-1;
		}		
		return cnt;
	}
	
	@Override
	@Transactional
	public int updateMultiYES(List<BalCalcVO> ballist) {
		int cnt=0;
		
		try{
			for (BalCalcVO vo : ballist) {
				if(vo.getComId()!=null){
					cnt=bdao.updateBalCalcYES(vo.getBalNum());
				}
			}
		}catch(RuntimeException e){
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}
	
	@Override
	@Transactional
	public int updateMultiNO(List<BalCalcVO> ballist) {
		int cnt=0;
		
		try{
			for (BalCalcVO vo : ballist) {
				if(vo.getComId()!=null){
					
					
					cnt=bdao.updateBalCalcNO(vo.getBalNum());
				}
			}
		}catch(RuntimeException e){
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}

}
