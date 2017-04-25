package com.third.rent.admin_CarModel.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.car.model.CarVO;
import com.third.rent.common.SearchVO;

@Repository
public class Admin_CarModelDAOmyBatis extends SqlSessionDaoSupport
	implements Admin_CarModelDAO{
	
	private String namespace="config.mybatis.mapper.oracle.admin_CarModel";

	public int insertCarModel(CarVO carVo) {
		return getSqlSession().insert(namespace+".insertCarModel", carVo);
	}

	public List<CarVO> selectAll(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectAllCarModel", searchVo);
	}

	public CarVO selectByCarCode(String carCode) {
		return getSqlSession().selectOne(namespace+".selectByCarCode", carCode);
	}

	public int updateCarModel(CarVO vo) {
		return getSqlSession().update(namespace+".updateCarModel", vo);
	}

	public int deleteCarModel(String carCode) {
		return getSqlSession().delete(namespace+".deleteCarModel", carCode);
	}

	public int selectTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectTotalRecord", searchVo);
	}
}
