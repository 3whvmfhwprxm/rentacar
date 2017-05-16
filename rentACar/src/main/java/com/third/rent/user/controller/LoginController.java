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
		logger.info("회원 비밀번호 찾기 파라미터 userId={}, userEmail={}", userId, userEmail);
		UserVO userVo = new UserVO();
		userVo.setUserId(userId);
		userVo.setUserEmail(userEmail);
		
		/*String result = userService.selectSearchpwd(userVo);*/
		
		//id, email과 일치하는 회원정보가 있는지 확인
		int count=userService.returnUserCount(userVo);
		logger.info("id, email과 일치하는 회원 정보 검색 결과 count={}",count);
		
		String url="/user/index.do", msg="";
		
		if(count>0){
			String userNewPwd="";
			
			//랜덤하게 8자리 패스워드를 생성
			//char 값 33(!)~122(z) 랜덤 8개
			for (int i=0; i<8; i++) {
				char randomChar=(char)(int)(Math.random()*122+33);
				userNewPwd+=randomChar;
			}
			logger.info("새로 생성된 패스워드 값 userNewPwd={}", userNewPwd);
			userVo.setUserPwd(userNewPwd);
			
			userService.updateNewRandomPwd(userVo);
			
			String subject="[3조 렌터카]"+userId+"님의 비밀번호 문의에 대한 답변입니다.";
			String content="새로운 비밀번호 [ "+userNewPwd+" ] - 접속하셔서 비밀번호를 수정해주세요";
			String receiver=userEmail;
			String sender="admin@herbmall.com";
			
			try {
				emailSender.sendEmail(subject, content, receiver, sender);
				logger.info("이메일 발송 성공");
				msg="새로운 비밀번호가 이메일로 전송되었습니다.";
			} catch (MessagingException e) {
				logger.info("이메일 발송 실패");
				e.printStackTrace();
				msg="새로운 비밀번호를 이메일로 전송중 실패하였습니다.";
			}
		}else{
			msg="해당 ID와 Email에 해당하는 회원정보가 존재하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}














