package com.third.rent.company.model;

import java.util.List;
import java.util.Map;

import com.third.rent.Comments.model.CommentsVO;
import com.third.rent.admin.model.AdminVO;
import com.third.rent.common.DateSearchVO2;
import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

public interface CompanyService {
	public static final int EXIST_ID = 1;
	public static final int NONE_EXIST_ID = 2;

	public static final int LOGIN_OK = 1;
	public static final int ID_NONE = 2;
	public static final int PWD_DISAGREE = 3;
	
	public int loginCheck(String userid, String pwd);
	public int duplicateUserid(String comId);
	public CompanyVO selectBycomId(String comId);
	public int updateCompany(CompanyVO vo);
	public String selectSearchid(CompanyVO vo);
	public String selectSearchpwd(CompanyVO vo);
	public int updateReadCount(int no);
	
	public List<CommentsVO> selectAll(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
	
	public List<Map<String, Object>> ComselectSalesByMonth(DateSearchVO2 dateSearchVO);
	public List<Map<String, Object>> ComselectSalesByDate(DateSearchVO2 dateSearchVO);
}
