package com.third.rent.ccaroption.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.third.rent.car.model.CarVO;
import com.third.rent.common.SearchVO;

@Service
public class CcarOptionServiceImpl implements CcarOptionService {
	private static final Logger logger = 
			LoggerFactory.getLogger(CcarOptionServiceImpl.class);
	
	@Autowired
	private CcarOptionDAO ccarOptionDao;
	
	@Override
	public int insertCcarOption(CcarOptionVO vo) {
		return ccarOptionDao.insertCcarOption(vo);
	}


	@Override
	public HashMap<String, Object> selectByCcarId(String ccarid) {
		return ccarOptionDao.selectByCcarId(ccarid);
	}


	@Override
	public List<Map<String, Object>> selectAllComCar(SearchVO searchVo) {
		return ccarOptionDao.selectAllComCar(searchVo);
	}


	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return ccarOptionDao.selectTotalRecord(searchVo);
	}


	@Override
	public int updateCarOption(CcarOptionVO vo) {
		return ccarOptionDao.updateCarOption(vo);
	}


	@Override
	public int deleteCarOption(CcarOptionVO vo) {
		return ccarOptionDao.deleteCarOption(vo);
	}


	@Override
	public int checkCarId(String ccarCarId) {
		return ccarOptionDao.checkCarId(ccarCarId);
	}


	@Override
	public int updateCarUseYn(CcarOptionVO vo) {
		return ccarOptionDao.updateCarUseYn(vo);
	}
	
	@Override
	public List<Map<String, Object>> selectComReserv(SearchVO searchVo) {
		return ccarOptionDao.selectComReserv(searchVo);
	}


	@Override
	public int ReservTotalRecord(SearchVO searchVo) {
		return ccarOptionDao.ReservTotalRecord(searchVo);
	}


	@Override
	public List<Map<String, Object>> selectRentalData(SearchVO searchVo) {
		return ccarOptionDao.selectRentalData(searchVo);
	}


	@Override
	public int todayRentalTR(SearchVO searchVo) {
		return ccarOptionDao.todayRentalTR(searchVo);
	}


	@Override
	public List<Map<String, Object>> selectReturnData(SearchVO searchVo) {
		return ccarOptionDao.selectReturnData(searchVo);
	}


	@Override
	public int todayReturnTR(SearchVO searchVo) {
		return ccarOptionDao.todayReturnTR(searchVo);
	}


	@Override
	public List<Map<String, Object>> selectRentalIng(SearchVO searchVo) {
		return ccarOptionDao.selectRentalIng(searchVo);
	}

	@Override
	public int rentalIngTR(SearchVO searchVo) {
		return ccarOptionDao.rentalIngTR(searchVo);
	}

	@Override
	public int updateStatusCgRent(CcarOptionVO vo) {
		return ccarOptionDao.updateStatusCgRent(vo);
	}

	@Override
	public int updateStatusCgReturn(CcarOptionVO vo) {
		return ccarOptionDao.updateStatusCgReturn(vo);
	}

	@Override
	public int updateStatusCgHold(CcarOptionVO vo) {
		return ccarOptionDao.updateStatusCgHold(vo);
	}


	@Override
	@Transactional
	public int multiMoveHold(List<CcarOptionVO> cCarList) {
		int cnt=0;
		try {
			for (CcarOptionVO cvo : cCarList) {
				if(cvo.getCcarCarId()!=null){
					CcarOptionVO vo = new CcarOptionVO();
					vo = ccarOptionDao.selectByCCarId(cvo.getCcarCarId());
					String status= "RENT";
					cvo.setCcarStatus(status);
					cnt = ccarOptionDao.updateStatusCgHold(cvo);
				}
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
		}
		return cnt;
	}


	@Override
	@Transactional
	public int multiMoveRent(List<CcarOptionVO> cCarList) {
		int cnt=0;
		try {
			for (CcarOptionVO cvo : cCarList) {
				if(cvo.getCcarCarId()!=null){
					CcarOptionVO vo = new CcarOptionVO();
					vo = ccarOptionDao.selectByCCarId(cvo.getCcarCarId());
					String status= "Return";
					cvo.setCcarStatus(status);
					cnt = ccarOptionDao.updateStatusCgHold(cvo);
				}
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
		}
		return cnt;
	}



	@Override
	@Transactional
	public int multiMoveReturn(List<CcarOptionVO> cCarList) {
		int cnt=0;
		try {
			for (CcarOptionVO cvo : cCarList) {
				if(cvo.getCcarCarId()!=null){
					CcarOptionVO vo = new CcarOptionVO();
					vo = ccarOptionDao.selectByCCarId(cvo.getCcarCarId());
					String status= "HOLD";
					cvo.setCcarStatus(status);
					cnt = ccarOptionDao.updateStatusCgHold(cvo);
				}
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
		}
		return cnt;
	}


	@Override
	public List<CarVO> selectByCarInc(String carInc) {
		return ccarOptionDao.selectByCarInc(carInc);
	}


}
