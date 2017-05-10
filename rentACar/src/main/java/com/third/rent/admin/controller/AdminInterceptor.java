package com.third.rent.admin.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.third.rent.user.controller.LoginInterceptor;

@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		logger.info("관리자 로그인 확인 - 인터셉터");
		
		String uri=request.getRequestURI();
		
		if(uri.indexOf("/administrator/log/logIn.do")!=-1){			
			return true;
		}
		
		HttpSession session = request.getSession();
		String comId = (String) session.getAttribute("Admin_Id");
		if(comId==null || comId.isEmpty()){
			request.setAttribute("msg", "관리자 메뉴를 사용하시려면 먼저 로그인 하셔야 합니다.");
			request.setAttribute("url", "/administrator/log/logIn.do");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
			dispatcher.forward(request, response);
			
			return false;
		}		
		return true;		
	}

}
