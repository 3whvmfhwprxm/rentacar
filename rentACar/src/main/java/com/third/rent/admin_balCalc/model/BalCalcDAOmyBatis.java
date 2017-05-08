package com.third.rent.admin_balCalc.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BalCalcDAOmyBatis extends SqlSessionDaoSupport implements BalCalcDAO{
	
	private String nameSpace="config.mybatis.mapper.oracle.balance_cal";
	
	@Override
	public int insertBalCalc(BalCalcVO bvo) {
		return getSqlSession().insert(nameSpace+".insertBalCalc", bvo);
	}

	@Override
	public int updateBalCalcYES(String balNum) {
		return getSqlSession().update(nameSpace+".updatebaldecisionYES", balNum);
	}

	@Override
	public int updateBalCalcNO(String balNum) {
		return getSqlSession().update(nameSpace+".updatebaldecisionNO", balNum);
	}

	@Override
	public List<BalCalcVO> selectBalCalc(String targetDate) {
		return getSqlSession().selectList(nameSpace+".selectBalanceCal", targetDate);
	}

	@Override
	public int selectCountExist(BalCalcVO bvo) {
		return getSqlSession().selectOne(nameSpace+".selectCountExist", bvo);
	}

}
