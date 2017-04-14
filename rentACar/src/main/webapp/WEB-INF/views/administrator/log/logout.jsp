<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	
	request.setAttribute("msg", "로그아웃되었습니다.");
	request.setAttribute("url", "logIn.do");
%>
<jsp:forward page="../../common/message.do"></jsp:forward>

