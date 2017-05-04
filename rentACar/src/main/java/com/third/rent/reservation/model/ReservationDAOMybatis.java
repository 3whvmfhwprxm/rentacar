package com.third.rent.reservation.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

@Repository
public class ReservationDAOMybatis extends SqlSessionDaoSupport implements ReservationDAO{
	private String namespace="config.mybatis.mapper.oracle.reservation";

	@Override
	public List<ReservationVO> selectByUserid(Map<String, Object> map) {
		return getSqlSession().selectList(namespace+".selectByUserid", map);
	}

	public int selectTotalRecord(String userId){
		return getSqlSession().selectOne(namespace+".selectTotalRecord", userId);
	}

	@Override
	public List<ReservationVO> selectAll(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectAllRaservation", searchVo);
	}

	@Override
	public List<Map<String, Object>> selectReservPayInfo(ReservationVO rvo) {
		return getSqlSession().selectList(namespace+".selectWithReservPayInfoView", rvo);
	}

	@Override
	public int selectTotalRecordWithPayInfo(ReservationVO rvo) {
		return getSqlSession().selectOne(namespace+".selectWithReservPayInfoViewTotalRecord", rvo);
	}

	@Override
	public int updateReservCancel(Map<String, Object> map) {
		return getSqlSession().update(namespace+".cancelReservation", map);
	}	
}
