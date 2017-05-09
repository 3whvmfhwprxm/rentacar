package com.third.rent.company.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.third.rent.Comments.model.CommentsVO;
import com.third.rent.common.DateSearchVO2;
import com.third.rent.common.SearchVO;

@Repository
public class CompanyDAOMybatis extends SqlSessionDaoSupport 
 implements CompanyDAO{
	
	private String namespace="config.mybatis.mapper.oracle.company";

	@Override
	public int duplicateUserid(String comId) {
		return getSqlSession().selectOne(namespace+".duplicateComId",comId);
	}

	@Override
	public String selectPwd(String comId) {
		return getSqlSession().selectOne(namespace+".selectPwdByComId",comId);
	}

	@Override
	public CompanyVO selectBycomId(String comId) {
		return getSqlSession().selectOne(namespace+".selectByComId",comId);
	}

	@Override
	public int updateCompany(CompanyVO vo) {
		return getSqlSession().update(namespace+".updateCompany",vo);
				
	}

	@Override
	public String selectSearchid(CompanyVO vo) {
		return getSqlSession().selectOne(namespace+".companyseachid", vo);
	}

	@Override
	public String selectSearchpwd(CompanyVO vo) {
		return getSqlSession().selectOne(namespace+".companyseachpwd", vo);
	}

	@Override
	public int updateReadCount(int no) {
		int cnt = getSqlSession().update(namespace+".updateReadCount", no);
		return cnt;
	}

	@Override
	public List<Map<String, Object>> ComselectSalesByDate(DateSearchVO2 dateSearchVO) {
		return getSqlSession().selectList(namespace+".", dateSearchVO);
	}

	@Override
	public List<Map<String, Object>> ComselectSalesByMonth(DateSearchVO2 dateSearchVO) {
		return getSqlSession().selectList(namespace+".ComSelectSalesByMonth", dateSearchVO);
	}

	@Override
	public List<Map<String, Object>> ComselectSalesByTerm(DateSearchVO2 dateSearchVO) {
		return getSqlSession().selectList(namespace+".", dateSearchVO);
	}

	@Override
	public List<CommentsVO> selectAll(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectAllComment", searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectTotalRecord", searchVo);
	}

	

}
