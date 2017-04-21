package com.third.rent.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.third.rent.user.model.UserService;
import com.third.rent.user.model.UserVO;

@Controller
public class RegEditController {
	private static final Logger logger=LoggerFactory.getLogger(RegEditController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/inc_user/regedit.do", method=RequestMethod.GET)
	public String userEdit_get(HttpSession session, Model model){
		String userId=(String)session.getAttribute("userId");
		logger.info("수정화면 보여주기 userId={}",userId);
		
		//로그인되었는지 체크
		if(userId==null || userId.isEmpty()){
			model.addAttribute("msg", "먼저 로그인하세요");
			model.addAttribute("url", "/inc_user/login.do");
			return "common/message";
		}
		UserVO vo=userService.selectByUserid(userId);
		logger.info("수정화면, 회원정보조회 vo={}",vo);
		model.addAttribute("vo", vo);
		return "inc_user/regedit";
	}
	
	@RequestMapping(value="/inc_user/regedit.do",method=RequestMethod.POST)
	public String userEdit_post(@ModelAttribute UserVO vo, HttpSession session, Model model){
		logger.info("회원수정, 파라미터 vo={}",vo);
		String userId=(String)session.getAttribute("userId");
		vo.setUserId(userId);
		
		//휴대폰 입력하지 않은 경우 처리
		String userTel1=vo.getUserTel1();
		String userTel2=vo.getUserTel2();
		String userTel3=vo.getUserTel3();
		if(userTel2==null||userTel2.isEmpty()||userTel3==null||userTel3.isEmpty()){
			vo.setUserTel1("");
			vo.setUserTel2("");
			vo.setUserTel3("");
		}

		

		
		int result=userService.loginCheck(vo.getUserId(), vo.getUserPwd());
		String msg="", url="/inc_user/regedit.do";
		if(result==userService.LOGIN_OK){
			int cnt=userService.updateUser(vo);
			logger.info("회원수정 결과, cnt={}", cnt);
			if(cnt>0){
				msg="회원정보수정 성공";
			}else{
				msg="회원정보수정 실패";
			}
		}else if(result==userService.PWD_DISAGREE){
			msg="비밀번호가 일치하지 않습니다";
		}else{
			msg="비밀번호가 체크 에러";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}














