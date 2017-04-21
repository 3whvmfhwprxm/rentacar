package com.third.rent.user.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		logger.info("로그인 확인 - 인터셉터");
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		if(userId==null || userId.isEmpty()){
			request.setAttribute("msg", "먼저 로그인하세요!!");
			request.setAttribute("url", "/inc_user/login.do");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
			dispatcher.forward(request, response);
			
			return false;
		}		
		return true;		
	}

}










