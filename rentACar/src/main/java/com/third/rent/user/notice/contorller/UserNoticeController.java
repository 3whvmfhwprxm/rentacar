package com.third.rent.user.notice.contorller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.user.notice.model.UserNoticeService;
import com.third.rent.user.notice.model.UserNoticeVO;

@Controller
public class UserNoticeController {
	private static final Logger logger=LoggerFactory.getLogger(UserNoticeController.class);
	
	@Autowired
	private UserNoticeService usernoticeService;
	
	/*@RequestMapping(value="/usernotice/usernotice.do", method=RequestMethod.GET)
	public String shownotice_get(){
		logger.info("공지사항디테일화면");
		
		return "usernotice/usernotice";
		
	}*/
	
	
	@RequestMapping(value="/usernotice/usernotice.do",method=RequestMethod.GET)
	public String shownotice(@RequestParam(value="unoticeNo", defaultValue="0") int unoticeNo, HttpServletRequest request, Model model){
		//1.
		logger.info("글 상세보기, 파라미터 no={}", unoticeNo);
		if(unoticeNo==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/inc_user/serviceCenter.do");

			return "common/message";
		}

		//2.
		UserNoticeVO vo = usernoticeService.selectByNo(unoticeNo);
		logger.info("상세보기 결과, vo={}", vo);

		//파일이 첨부된 경우 파일 정보 구하기

		//3.
		model.addAttribute("vo", vo);

		return "usernotice/usernotice";

	}
}
