package com.third.rent.admin_LogState.controller;

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

import com.third.rent.admin.model.AdminVO;
import com.third.rent.admin_LogState.model.admin_LogService;

@Controller
@RequestMapping("/administrator")
public class LogController {
	private static final Logger logger
		= LoggerFactory.getLogger(LogController.class);
	
	@Autowired
	private admin_LogService adminLogService;
	
	@RequestMapping(value="/log/logIn.do", method=RequestMethod.GET)
	public String logIn_get(){
		logger.info("로그인화면 보여주기");
		return "administrator/log/logIn";
	}
	
	@RequestMapping(value="/log/logIn.do", method=RequestMethod.POST)
	public String login_post(@RequestParam String Admin_Id,
			@RequestParam String pwd, @RequestParam(required=false) String chkSaveId,
			HttpServletRequest request, HttpServletResponse response,
			Model model){
		//1
		logger.info("로그인 처리, 파라미터 Admin_Id={}, pwd={}", Admin_Id, pwd);
		logger.info("파라미터 chkSaveId={}", chkSaveId);
		
		//2
		int result = adminLogService.loginCheck(Admin_Id, pwd);
		logger.info("로그인 처리결과, result={}", result);
		
		String msg = "", url = "/administrator/log/logIn.do";
		if(result==admin_LogService.LOGIN_OK){
			AdminVO vo = adminLogService.selectByAdminId(Admin_Id);
			msg = vo.getAdminName()+"님 로그인되었습니다.";
			url = "/administrator/admin_Main.do";
			
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(60*60);
			session.setAttribute("Admin_Id", Admin_Id);
			session.setAttribute("AdminName", vo.getAdminName());
			
			Cookie ck = new Cookie("ck_admin_Id", Admin_Id);
			ck.setPath("/");
			if(chkSaveId!=null){
				ck.setMaxAge(1000*24*60*60);
				response.addCookie(ck);
			}else{
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
		}else if(result==admin_LogService.ID_NONE){
			msg = "해당아이디가 존재하지 않습니다.";
		}else if(result==admin_LogService.PWD_DISAGREE){
			msg = "비밀번호가 일치하지 않습니다.";
		}else{
			msg = "로그인 체크 실패";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/log/logout.do")
	public String logout(HttpSession session){
		logger.info("로그아웃 처리, 파라미터");
		
		session.invalidate();
		
		return "redirect:/administrator/log/logIn.do";
	}
}
