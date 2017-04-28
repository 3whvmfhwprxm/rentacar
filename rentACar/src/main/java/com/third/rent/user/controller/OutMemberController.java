package com.third.rent.user.controller;

import javax.servlet.http.Cookie;
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
@Controller
public class OutMemberController {
	private static final Logger logger=LoggerFactory.getLogger(OutMemberController.class);
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/inc_user/outMember.do", method=RequestMethod.POST)
	public String edit_post(@RequestParam String userPwdmd, HttpSession session, HttpServletResponse response, Model model){
		String userId=(String) session.getAttribute("userId");
		logger.info("회원탈퇴 처리, 파라미터 userid={},userPwdmd={}", userId,userPwdmd);

		int result = userService.loginCheck(userId, userPwdmd);
		String msg="", url="/inc_user/regedit.do";

		if(result==userService.LOGIN_OK){
			int cnt = userService.outMember(userId);
			logger.info("회원탈퇴 결과, cnt={}", cnt);
			if(cnt>0){
				session.invalidate();
				
				//쿠키 삭제
				Cookie ck = new Cookie("ck_userid", userId);
				ck.setPath("/");
				ck.setMaxAge(0); 
				response.addCookie(ck);
				
				msg="회원 탈퇴처리되었습니다.";
				url="/inc_user/index.do";
			}else{
				msg="회원탈퇴 실패";
			}
		}else if(result==userService.PWD_DISAGREE){
			msg="비밀번호가 일치하지 않습니다.";
		}else{
			msg="비밀번호 체크 에러";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
}
