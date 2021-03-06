package com.third.rent.ccaroption.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.car.model.CarVO;
import com.third.rent.common.SearchVO;

@Repository
public class CcarOptionDAOMybatis extends SqlSessionDaoSupport
	implements CcarOptionDAO{

	private String namespace="config.mybatis.mapper.oracle.ccaroption";
	
	@Override
	public int insertCcarOption(CcarOptionVO vo){ 
		return getSqlSession().insert(namespace+".insertCcarOption", vo);
	}

	@Override
	public List<CcarOptionVO> selectAllCcar() {
		return getSqlSession().selectList(namespace+".selectCompanyCO");
	}
	
	public List<Map<String, Object>> selectAllComCar(SearchVO searchVo){
		return getSqlSession().selectList(namespace+".selectAllCcar", searchVo);
	}
	
	public HashMap<String, Object> selectByCcarId(String ccarid){
		return getSqlSession().selectOne(namespace+".selectByCcarId", ccarid);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectTotalRecord", searchVo);
	}

	@Override
	public int updateCarOption(CcarOptionVO vo) {
		return getSqlSession().update(namespace+".updateCarOption", vo);
	}

	@Override
	public int deleteCarOption(CcarOptionVO vo) {
		return getSqlSession().update(namespace+".DeleteCompanyCar", vo);
	}

	@Override
	public int checkCarId(String ccarCarId) {
		return getSqlSession().selectOne(namespace+".checkCarId", ccarCarId);
	}

	@Override
	public int updateCarUseYn(CcarOptionVO vo) {
		return getSqlSession().update(namespace+".updateCarUseYn", vo);
	}
	
	@Override
	public List<Map<String, Object>> selectComReserv(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectComReserv", searchVo);
	}

	@Override
	public int ReservTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".ReservTotalRecord", searchVo);
	}

	@Override
	public List<Map<String, Object>> selectRentalData(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectRentalData", searchVo);
	}

	@Override
	public int todayRentalTR(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".todayRentalTR", searchVo);
	}

	@Override
	public int todayReturnTR(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".todayReturnTR", searchVo);
	}

	@Override
	public List<Map<String, Object>> selectReturnData(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectReturnData", searchVo);
	}

	@Override
	public int rentalIngTR(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".rentalIngTR", searchVo);
	}

	@Override
	public List<Map<String, Object>> selectRentalIng(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectRentalIng", searchVo);
	}

	@Override
	public int updateStatusCgRent(CcarOptionVO vo) {
		return getSqlSession().update(namespace+".updateStatusCgRent", vo);
	}

	@Override
	public int updateStatusCgReturn(CcarOptionVO vo) {
		return getSqlSession().update(namespace+".updateStatusCgReturn", vo);
	}

	@Override
	public int updateStatusCgHold(CcarOptionVO vo) {
		return getSqlSession().update(namespace+".updateStatusCgHold", vo);
	}

	@Override
	public CcarOptionVO selectByCCarId(String ccarCarId) {
		return getSqlSession().selectOne(namespace+".selectByCCarId", ccarCarId);
	}

	@Override
	public List<CarVO> selectByCarInc(String carInc) {
		return getSqlSession().selectList(namespace+".selectByCarInc", carInc);
	}

	
}




