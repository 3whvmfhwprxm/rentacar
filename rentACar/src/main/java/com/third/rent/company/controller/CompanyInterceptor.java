package com.third.rent.company.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.HandlerInstantiator;
import org.codehaus.jackson.map.JsonDeserializer;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.KeyDeserializer;
import org.codehaus.jackson.map.MapperConfig;
import org.codehaus.jackson.map.SerializationConfig;
import org.codehaus.jackson.map.introspect.Annotated;
import org.codehaus.jackson.map.jsontype.TypeIdResolver;
import org.codehaus.jackson.map.jsontype.TypeResolverBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.third.rent.user.controller.LoginInterceptor;

@Component
public class CompanyInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		logger.info("로그인 확인 - 인터셉터");
		
		HttpSession session = request.getSession();
		String comId = (String) session.getAttribute("comId");
		if(comId==null || comId.isEmpty()){
			request.setAttribute("msg", "먼저 로그인하세요!!");
			request.setAttribute("url", "/login_company/com_login.do");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
			dispatcher.forward(request, response);
			
			return false;
		}		
		return true;		
	}

}
