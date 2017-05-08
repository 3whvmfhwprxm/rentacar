package com.third.rent.company.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.rent.admin_LogState.model.admin_LogService;
import com.third.rent.company.model.CompanyService;
import com.third.rent.company.model.CompanyVO;
import com.third.rent.email.EmailSender;
import com.third.rent.user.model.UserVO;

@Controller
@RequestMapping("/login_company")
public class CompanyController {
	
	@Autowired
	private CompanyService comService;
	
	@Autowired
	private EmailSender emailSender;
	
	private static final Logger logger
		= LoggerFactory.getLogger(CompanyController.class);
	
	@RequestMapping("/companyMain.do")
	public String company(){
		logger.info("업체메인화면 보여주기");
		
		return "login_company/companyMain";
	}
	
	@RequestMapping(value="/com_login.do", method=RequestMethod.GET)
	public String loginPage_get(){
		logger.info("로그인 화면 보여주기");
		
		return "login_company/com_login";
	}
	@RequestMapping(value="/com_login.do", method=RequestMethod.POST)
	public String login_post(HttpServletRequest request,@RequestParam String comId,
			@RequestParam String comPwd,@ModelAttribute CompanyVO companyVo,
			Model model, HttpServletResponse response,
			 @RequestParam(required=false) String chkSaveId) {
		// 1
		logger.info("로그인 처리, 파라미터 com_Id={}, com_Pwd={}", comId, comPwd);

		// 2
		int result = comService.loginCheck( comId, comPwd);
		logger.info("로그인 처리결과, result={}", result);

		String msg = "";
		String url = "";
		if (result == admin_LogService.LOGIN_OK) {
			CompanyVO vo = comService.selectBycomId(comId);
			msg = vo.getComName() + "님 로그인되었습니다.";
			url = "../com_manage/company_ccarList.do";

			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(60 * 60);
			session.setAttribute("comId", comId);
			session.setAttribute("comName", vo.getComName());
			
			model.addAttribute("companyVo", companyVo);
			
			Cookie ck = new Cookie("ck_comId", comId);
			ck.setPath("/");
			if (chkSaveId != null) {
				ck.setMaxAge(1000 * 24 * 60 * 60);
				response.addCookie(ck);
			} else {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}

		} else if (result == comService.PWD_DISAGREE) {
			msg = "비밀번호가 일치하지 않습니다.";
		} else {
			msg = "로그인 체크 실패";
		}

		// 3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	@RequestMapping(value="/companyseachid.do")
	@ResponseBody
	public CompanyVO userseachid(@RequestParam String comName, @RequestParam String comEmail, Model model){
		logger.info("아이디 찾기");
		CompanyVO companyVo = new CompanyVO();
		companyVo.setComName(comName);
		companyVo.setComEmail(comEmail);
		String result = comService.selectSearchid(companyVo);
		logger.info("결과 result = {}",result);
		
		CompanyVO vo = new CompanyVO();
		vo.setComId(result);
		
		return vo;
	}
	
	@RequestMapping(value="/companyseachpwd.do")
	public String userseachpwd(@RequestParam String comIdSeach, @RequestParam String comEmailSeach, Model model){
		logger.info("비밀번호 찾기");
		CompanyVO companyVo = new CompanyVO();
		companyVo.setComId(comIdSeach);
		companyVo.setComEmail(comEmailSeach);
		String result = comService.selectSearchpwd(companyVo);
		logger.info("결과 result = {}",result);
		
		CompanyVO vo = new CompanyVO();
		vo.setComPwd(result);
		logger.info("이메일 발송 처리");
		String subject="비밀번호 문의에 대한 답변입니다.";
		String content="찾으실 비밀번호 [ "+vo.getComPwd()+" ]";
		String receiver="horo7777@gmail.com";
		String sender="admin@herbmall.com";
		
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("이메일 발송 성공");
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패");
			e.printStackTrace();
		}
		
		return "redirect:/login_company/com_login.do";
	}
	

	@RequestMapping("com_logout.do")
	public String logout(HttpSession session){
		logger.info("로그아웃 처리, 파라미터");
		
		session.invalidate();
		
		return "redirect:/login_company/com_login.do";
	}
}
