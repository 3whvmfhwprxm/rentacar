package com.third.rent.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.user.model.UserService;
import com.third.rent.user.model.UserVO;

@Controller
public class LoginController {
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/inc_user/login.do", method=RequestMethod.GET)
	public String showLogin_get(){
		logger.info("로그인화면 띄우기");
		
		return "inc_user/login";
	}
	
	
	@RequestMapping(value="/inc_user/login.do", method=RequestMethod.POST)
	public String login_post(@RequestParam String userId, @RequestParam String userPwd,
				HttpServletRequest request,HttpServletResponse response, Model model){
		//1
		logger.info("로그인 처리, 파라미터 userId={} userPwd={}",userId,userPwd);
		
		//2
		int result=userService.loginCheck(userId, userPwd);
		logger.info("로그인 처리 결과, 파라미터 result={}",result);
		
		String msg="", url="/inc_user/login.do";
		if(result==userService.LOGIN_OK){
			UserVO vo=userService.selectByUserid(userId);
			
			msg=vo.getUserName()+"님 로그인 되었습니다.";
			url="/inc_user/index.do";
			
			//세션에 저장
			HttpSession session= request.getSession();
			session.setAttribute("userId", userId);
			session.setAttribute("userName", vo.getUserName());
			
		}else if(result==userService.ID_NONE){
			msg="해당 아이디가 존재하지 않습니다.";
		}else if(result==userService.PWD_DISAGREE){
			msg="비밀번호가 일치하지 않습니다";
		}else{
			msg="로그인 체크 실패";
		}
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
