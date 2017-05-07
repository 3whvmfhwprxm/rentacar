package com.third.rent.reservation.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.third.rent.common.SearchVO;
import com.third.rent.payInfo.model.PayInfoDAO;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDAO reservationDao;
	
	@Autowired
	private PayInfoDAO pDao;

	@Override
	public List<Map<String, Object>> selectByUserid(Map<String, Object> map){
		return reservationDao.selectByUserid(map);
	}

	@Override
	public int selectTotalRecord(String userId) {
		return reservationDao.selectTotalRecord(userId);
	}

	@Override
	public List<ReservationVO> selectAll(SearchVO searchVo) {
		return reservationDao.selectAll(searchVo);
	}

	@Override
	public List<Map<String, Object>> selectReservPayInfo(ReservationVO rvo) {
		return reservationDao.selectReservPayInfo(rvo);
	}

	@Override
	public int selectTotalRecordWithPayInfo(ReservationVO rvo) {
		return reservationDao.selectTotalRecordWithPayInfo(rvo);
	}

	@Override
	@Transactional
	public int multiCancelReserv(List<ReservationVO> rlist) {
		int cnt=0;
		try{
			for(ReservationVO vo: rlist){
				
				if(vo.getReservNum()!=null){
					
					Map<String, Object> map=new HashMap<String, Object>();
					map.put("reservNum", vo.getReservNum());
					map.put("reservCancelWhy", "관리자 일괄 취소");					
					cnt=reservationDao.updateReservCancel(map);
					
					if(cnt>0){
						cnt=pDao.updatePayCancel(vo.getReservNum());
					}
				}
			}			
		}catch(RuntimeException e){
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}
	
}
