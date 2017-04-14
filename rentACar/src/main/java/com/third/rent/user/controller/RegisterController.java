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

import com.third.rent.user.model.UserService;
import com.third.rent.user.model.UserVO;

@Controller
public class RegisterController {
	private static final Logger logger=LoggerFactory.getLogger(RegisterController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/inc_user/register.do", method=RequestMethod.GET)
	public String insertLogin_get(){
		logger.info("회원가입화면 띄우기");
		
		return "inc_user/register";
	}
	
	@RequestMapping(value="/inc_user/register.do",method=RequestMethod.POST)
	public String join(@ModelAttribute UserVO userVo,@RequestParam(value="userEmail3", required=false) String userEmail3, Model model){
		//1
		logger.info("회원가입처리, 파라미터 UserVO={}",userVo);
		//2
		//휴대폰 입력하지 않은 경우 처리
		String userTel1=userVo.getUserTel1();
		String userTel2=userVo.getUserTel2();
		String userTel3=userVo.getUserTel3();
		if(userTel2==null||userTel2.isEmpty()||userTel3==null||userTel3.isEmpty()){
			userVo.setUserTel1("");
			userVo.setUserTel2("");
			userVo.setUserTel3("");
		}
		
		//이메일 입력하지 않은 경우 처리
		String userEmail1=userVo.getUserEmail1();
		String userEmail2=userVo.getUserEmail2();
		
		if(userEmail1==null||userEmail1.isEmpty()){
			userVo.setUserEmail2("");
		}else{
			//직접입력인 경우
			if(userEmail2.equals("etc")){
				if(userEmail3!=null && userEmail3.isEmpty()){
					userVo.setUserEmail2(userEmail3);
				}else{
					userVo.setUserEmail1("");
					userVo.setUserEmail2("");
				}
			}
		}
		
		int cnt=userService.insertUser(userVo);
		String msg="", url="";
		if(cnt>0){
			msg="회원가입되었습니다";
			url="/inc_user/index.do";
		}else{
			msg="회원가입 실패";
			url="/inc_user/register.do";
		}
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	
	
}
