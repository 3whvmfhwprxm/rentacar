package com.third.rent.payInfo.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.third.rent.reservation.model.ReservationDAO;
import com.third.rent.reservation.model.ReservationVO;

@Service
public class PayInfoServiceImple implements PayInfoService{

	@Autowired
	private PayInfoDAO pDao;
	
	@Autowired
	private ReservationDAO rDao;
	
	@Override
	public List<PayInfoVO> selectPayInfo(PayInfoVO pInfo) {
		return pDao.selectPayInfo(pInfo);
	}

	@Override
	public int selectTotalRecordPayInfo(PayInfoVO pInfo) {
		return pDao.selectTotalRecordPayInfo(pInfo);
	}

	@Override
	public List<PayInfoVO> recentTenPayInfo(PayInfoVO payInfoVo) {
		return pDao.recentTenPayInfo(payInfoVo);
	}

	@Override
	@Transactional
	public int cancelPayInfo(Map<String, Object> map) {
		int result=0;
		result=pDao.updatePayCancel((String)map.get("reservNum"));		
		result=rDao.updateReservCancel(map);				
		return result;
	}

	@Override
	public int multiCancelPayInfo(List<PayInfoVO> rlist) {
		int cnt=0;
		try{
			for(PayInfoVO vo: rlist){
				
				if(vo.getReservNum()!=null){
					
					Map<String, Object> map=new HashMap<String, Object>();
					map.put("reservNum", vo.getReservNum());
					map.put("reservCancelWhy", "관리자 일괄 취소");					
					cnt=rDao.updateReservCancel(map);
					
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
