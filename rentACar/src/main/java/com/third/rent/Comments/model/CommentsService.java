package com.third.rent.Comments.model;

import java.util.List;
import java.util.Map;

import com.third.rent.common.SearchVO;
import com.third.rent.company.notice.model.CompanyNoticeVO;

public interface CommentsService {
	public List<CommentsVO> selectAll(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
	public int writeComment(CommentsVO commentsVo);
	public Map<String, Object> selectComidByReservNum(String reservNum);
	public CommentsVO selectByCmtNo(int cmtNo);
}
