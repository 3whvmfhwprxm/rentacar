package com.third.rent.ccaroption.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.jdbc.core.metadata.GenericTableMetaDataProvider;
import org.springframework.stereotype.Repository;

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
	
}




