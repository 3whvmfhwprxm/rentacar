package com.third.rent.user.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.third.rent.Comments.model.CommentsService;
import com.third.rent.Comments.model.CommentsVO;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;



@Controller
public class ReviewController {
	private static final Logger logger=LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private CommentsService commentsService;
	
	@RequestMapping(value="/user/review.do", method=RequestMethod.GET)
	public String showReview(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("이용후기 화면 띄우기");
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());


		List<CommentsVO> alist=commentsService.selectAll(searchVo);
		logger.info("후기목록 조회결과, alist.size()={}", alist.size());

		int totalRecord =commentsService.selectTotalRecord(searchVo);
		logger.info("후기목록 조회-전체레코드 개수조회 결과, totalRecord={}", totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);

		return "user/review";
		
	}
}
