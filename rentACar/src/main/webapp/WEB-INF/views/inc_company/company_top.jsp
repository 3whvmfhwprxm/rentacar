<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>top.jsp</title>
</head>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.1.min.js"/>'></script>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<body>	
	<div>
		<!-- header -->				
		<header>
			<h1><a href="${pageContext.request.contextPath}/login_company/companyMain.do"><img alt="로고 이미지"
				src="${pageContext.request.contextPath}/company_logos/logo.png"/></a></h1>
			<nav style="float: right;">
				<a href="${pageContext.request.contextPath}/inc_user/login.do">로그인</a>
				<a href="${pageContext.request.contextPath}/inc_user/register.do">회원가입</a>				
			</nav>
		</header>

		<nav>
			<div>
			   <a href="${pageContext.request.contextPath}/com_reser/"><button type="button" class="btn btn-default">예약관리</button></a>
			   <a href="${pageContext.request.contextPath}/com_manage/regist_option.do"><button type="button" class="btn btn-danger">차량관리</button></a>
			   <a href="${pageContext.request.contextPath}/#"><button type="button" class="btn btn-default">후기관리</button></a>
			   <a href="${pageContext.request.contextPath}/#"><button type="button" class="btn btn-default">매출현황/통계</button></a>
			   <a href="${pageContext.request.contextPath}/#"><button type="button" class="btn btn-default">관리자에게 문의</button></a>
			</div>
		</nav>
		
		
		<!-- container -->
		<div id="container">

		