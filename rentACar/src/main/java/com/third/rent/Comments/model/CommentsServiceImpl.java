package com.third.rent.Comments.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.common.SearchVO;

@Service
public class CommentsServiceImpl implements CommentsService{
	@Autowired
	private CommentsDAO commentsDao;

	@Override
	public List<CommentsVO> selectAll(SearchVO searchVo) {
		return commentsDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return commentsDao.selectTotalRecord(searchVo);
	}

	@Override
	public int writeComment(CommentsVO commentsVo) {
		return commentsDao.writeComment(commentsVo);
	}
}
