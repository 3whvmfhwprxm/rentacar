package com.third.rent.user.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.third.rent.common.FileUploadWebUtil;
import com.third.rent.common.UserFileUploadWebUtil;

@Controller
public class ReviewWriteController {
	private static final Logger logger=LoggerFactory.getLogger(ReviewWriteController.class);
	
	@Autowired
	private CommentsService commentsService;
	
	@Autowired
	private UserFileUploadWebUtil userfileUploadWebUtil;
	
	@RequestMapping(value="/user/reviewWrite.do", method=RequestMethod.GET)
	public String showReviewWrite_get(@RequestParam String reservNum, Model model){
		logger.info("리뷰작성화면 띄우기 - 파라미터값 reservNum={}", reservNum);
		
		Map<String, Object> map=commentsService.selectComidByReservNum(reservNum);
		logger.info("리뷰작성화면 띄우기 - 조회 결과값 map={}", map);
		
		model.addAttribute("map", map);
		
		return "user/reviewWrite";
		
	}
	
	@RequestMapping(value="/user/reviewWrite.do", method=RequestMethod.POST)
	public String showReviewWrite_post(@ModelAttribute CommentsVO commentsVo, Model model, HttpServletRequest request,
			HttpSession session) throws IOException{
		String userId = (String)session.getAttribute("userId");
		commentsVo.setUserId(userId);
		logger.info("리뷰작성처리, 파라미터 userId={}, adminId={}", userId, commentsVo.getAdminId());
		
		/*UserFileUploadWebUtil fileUpload = new UserFileUploadWebUtil();
		List<Map<String, Object>> map = fileUpload.fileUpload(request, 2);
		commentsVo.setCmtImg1(map.get(0).get("cmtImg1").toString());
		map.get(0).get("fileSize");
		map.get(0).get("originalFileName");*/
		
		//파일 업로드 처리
		/*List<Map<String, Object>> fileList=userfileUploadWebUtil.fileUpload(request, FileUploadWebUtil.FILE_UPLOAD);

		String cmtImg1="";
		if(!fileList.isEmpty()){
			for(Map<String, Object> map : fileList){
				cmtImg1 = (String) map.get("cmtImg1");
			}//for
		}//if

		commentsVo.setCmtImg1(cmtImg1);*/
		
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
