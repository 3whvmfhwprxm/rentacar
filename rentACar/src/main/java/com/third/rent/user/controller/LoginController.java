package com.third.rent.user.controller;

import javax.mail.MessagingException;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.rent.email.EmailSender;
import com.third.rent.user.model.UserService;
import com.third.rent.user.model.UserVO;

@Controller
public class LoginController {
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping(value="/user/login.do", method=RequestMethod.GET)
	public String showLogin_get(){
		logger.info("로그인화면 띄우기");
		
		return "user/login";
	}
	
	
	@RequestMapping(value="/user/login.do", method=RequestMethod.POST)
	public String login_post(@RequestParam String userId, @RequestParam String userPwd, @RequestParam(required=false) String chkSaveId,
				HttpServletRequest request,HttpServletResponse response, Model model){
		//1
		logger.info("로그인 처리, 파라미터 userId={} userPwd={}",userId,userPwd);
		logger.info("파라미터 chkSaveId={}", chkSaveId);
		
		//2
		int result=userService.loginCheck(userId, userPwd);
		logger.info("로그인 처리 결과, 파라미터 result={}",result);
		
		String msg="", url="/user/login.do";
		if(result==userService.LOGIN_OK){
			UserVO vo=userService.selectByUserid(userId);
			
			msg=vo.getUserName()+"님 로그인 되었습니다.";
			url="/user/index.do";
			
			//세션에 저장
			HttpSession session= request.getSession();
			session.setAttribute("userId", userId);
			session.setAttribute("userName", vo.getUserName());
			session.setAttribute("userLicense", vo.getUserLicense());
			
			//쿠키에 저장
			Cookie ck = new Cookie("ck_userId", userId);
			ck.setPath("/");
			//아이디 저장하기를 체크한 경우
			if(chkSaveId!=null){
				ck.setMaxAge(1000*24*60*60); //1000일
				response.addCookie(ck);
			}else{
				ck.setMaxAge(0); //쿠키 삭제
				response.addCookie(ck);
			}
			
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
	
	@RequestMapping("/user/userAjaxCheckId.do")
	@ResponseBody
	public boolean userAjaxCheckId(@RequestParam String userId){
		logger.info("ajax-아이디 중복확인, 파라미터 userid={}",userId);
		
		int result=userService.duplicateUserid(userId);
		logger.info("아이디 중복확인, result={}",result);
		
		boolean bool=false;
		if(result==UserService.EXIST_ID){
			//아이디가 이미 존재하는 경우
			bool=true;
		}
		return bool;
	}
	
	@RequestMapping(value="/user/userseachid.do")
	@ResponseBody
	/*public String userseachid(@ModelAttribute UserVO vo, Model model){*/
	public UserVO userseachid(@RequestParam String userName, @RequestParam String userEmail, Model model){
		logger.info("아이디 찾기");
		UserVO userVo = new UserVO();
		userVo.setUserName(userName);
		userVo.setUserEmail(userEmail);
		String result = userService.selectSearchid(userVo);
		logger.info("결과 result = {}",result);
		
		UserVO vo = new UserVO();
		vo.setUserId(result);
		
		return vo;
	}
	
	@RequestMapping(value="/user/userseachpwd.do")
	public String userseachpwd(@RequestParam String userId, @RequestParam String userEmail, Model model){
		logger.info("비밀번호 찾기");
		UserVO userVo = new UserVO();
		userVo.setUserId(userId);
		userVo.setUserEmail(userEmail);
		String result = userService.selectSearchpwd(userVo);
		logger.info("결과 result = {}",result);
		
		UserVO vo = new UserVO();
		vo.setUserPwd(result);
		logger.info("이메일 발송 처리");
		String subject="비밀번호 문의에 대한 답변입니다.";
		String content="찾으실 비밀번호 [ "+vo.getUserPwd()+" ]";
		String receiver="horo7777@gmail.com";
		String sender="admin@herbmall.com";
		
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("이메일 발송 성공");
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패");
			e.printStackTrace();
		}
		
		return "redirect:/user/index.do";
	}
	
	
	
}














