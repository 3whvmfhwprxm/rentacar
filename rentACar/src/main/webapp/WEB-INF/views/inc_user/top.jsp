<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>유저메인</title>
</head>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.1.min.js"/>'></script>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<body>	
	<div>
		<!-- header -->				
		<header>
			<h1><a href="${pageContext.request.contextPath}/inc_user/index.do"><img alt="로고 이미지"
				src="${pageContext.request.contextPath}/company_logos/logo.png"/></a></h1>
			<nav style="float: right;">
				<a href="${pageContext.request.contextPath}/inc_user/login.do">로그인</a>
				<a href="${pageContext.request.contextPath}/inc_user/register.do">회원가입</a>				
			</nav>
		</header>

		<nav>
			<div>
			   <a href="${pageContext.request.contextPath}/inc_user/realTime.do"><button type="button" class="btn btn-default">실시간예약</button></a>
			   <a href="${pageContext.request.contextPath}/inc_user/confirm.do"><button type="button" class="btn btn-default">예약확인</button></a>
			   <a href="${pageContext.request.contextPath}/inc_user/review.do"><button type="button" class="btn btn-default">이용후기</button></a>
			   <a href="${pageContext.request.contextPath}/inc_user/serviceCenter.do"><button type="button" class="btn btn-default">고객센터</button></a>
			   <a href="${pageContext.request.contextPath}/inc_user/benefits.do"><button type="button" class="btn btn-default">이용혜택</button></a>
			</div>
		</nav>
		
		
		<!-- container -->
		<div id="container">

		
		
		
		
		
		
		
		
		
		








