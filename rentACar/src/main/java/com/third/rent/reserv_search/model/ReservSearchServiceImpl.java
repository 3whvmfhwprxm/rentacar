package com.third.rent.reserv_search.model;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.third.rent.car.model.CarCategoryVO;
import com.third.rent.ccaroption.model.CcarOptionVO;
import com.third.rent.payInfo.model.PayInfoVO;
import com.third.rent.reservUser.model.ReservUserVO;
import com.third.rent.reservation.model.ReservationVO;

@Service
public class ReservSearchServiceImpl implements ReservSearchService{

	private static final Logger logger=LoggerFactory.getLogger(ReservSearchServiceImpl.class);
	
	@Autowired
	private ReservSearchDAO dao;
	
	@Override
	public List<CcarOptionVO> searchNormal(HashMap<String, Object> map) {
		return dao.searchNormal(map);
	}

	@Override
	public CcarOptionVO selectByCcarCarId(String ccarCarId) {
		return dao.selectByCcarCarId(ccarCarId);
	}

	@Override
	public ReservationVO selectByReservNum(String reservNum) {
		return dao.selectByReservNum(reservNum);
	}

	@Transactional
	@Override
	public String takeReservation(ReservationVO reserVo, ReservUserVO reservWho) {
		String primarykey=dao.createReservationKey();
		reserVo.setReservNum(primarykey);
		reservWho.setReservNum(primarykey);
		logger.info("서비스 트랜잭션 처리 reserVo={}", reserVo);
		logger.info("서비스 트랜잭션 처리 reservWho={}", reservWho);
		
		dao.insertReservation(reserVo);
		dao.insertReservUser(reservWho);
		
		//예약번호 고유키 리턴
		return primarykey;
	}

	@Override
	public List<CarCategoryVO> selectCategoryList() {
		return dao.selectCategoryList();
	}

	@Override
	public int insertPayInfo(PayInfoVO payInfoVO) {
		return dao.insertPayInfo(payInfoVO);
	}

	
}
