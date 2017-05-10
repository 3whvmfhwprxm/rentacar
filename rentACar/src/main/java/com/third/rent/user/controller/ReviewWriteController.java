package com.third.rent.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.Comments.model.CommentsService;
import com.third.rent.Comments.model.CommentsVO;

@Controller
public class ReviewWriteController {
	private static final Logger logger=LoggerFactory.getLogger(ReviewWriteController.class);
	
	@Autowired
	private CommentsService commentsService;
	
	@RequestMapping(value="/user/reviewWrite.do", method=RequestMethod.GET)
	public String showReviewWrite_get(@RequestParam String reservNum, Model model){
		logger.info("리뷰작성화면 띄우기");
		
		
		
		return "user/reviewWrite";
		
	}
	
	@RequestMapping(value="/user/reviewWrite.do", method=RequestMethod.POST)
	public String showReviewWrite_post(@ModelAttribute CommentsVO commentsVo, Model model){
		logger.info("리뷰작성처리, 파라미터 ");
		
		int cnt=commentsService.writeComment(commentsVo);
		String msg="", url="";
		if(cnt>0){
			msg="사용후기 등록이 완료되었습니다";
			url="/user/review.do";
		}else{
			msg="사용후기 등록이 실패하였습니다";
			url="/user/reviewWrite.do";
		}
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
}
