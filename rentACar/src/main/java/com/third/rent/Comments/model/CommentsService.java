package com.third.rent.Comments.model;

import java.util.List;

import com.third.rent.common.SearchVO;

public interface CommentsService {
	public List<CommentsVO> selectAll(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
	public int writeComment(CommentsVO commentsVo);
}
