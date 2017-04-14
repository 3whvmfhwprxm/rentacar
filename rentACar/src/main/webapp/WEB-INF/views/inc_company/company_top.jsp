<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.1.min.js'/>"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/css/bootstrap.min.css"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">



.navbar-nav.navbar-right .btn {
	position: relative;
	z-index: 2;
	padding: 4px 20px;
	margin: 10px auto;
	transition: transform 0.3s;
}

.navbar .navbar-collapse {
	position: relative;
	overflow: hidden !important;
}

.navbar .navbar-collapse .navbar-right>li:last-child {
	padding-left: 22px;
}

.navbar .nav-collapse {
	position: absolute;
	z-index: 1;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	margin: 0;
	padding-right: 120px;
	padding-left: 80px;
	width: 100%;
}

.navbar.navbar-default .nav-collapse {
	background-color: #f8f8f8;
}

.navbar.navbar-inverse .nav-collapse {
	background-color: #222;
}

.navbar .nav-collapse .navbar-form {
	border-width: 0;
	box-shadow: none;
}

.nav-collapse>li {
	float: right;
}

.btn.btn-circle {
	border-radius: 50px;
}

.btn.btn-outline {
	background-color: transparent;
}

.navbar-nav.navbar-right .btn:not (.collapsed ) {
	background-color: rgb(111, 84, 153);
	border-color: rgb(111, 84, 153);
	color: rgb(255, 255, 255);
}

.navbar.navbar-default .nav-collapse, .navbar.navbar-inverse .nav-collapse
	{
	height: auto !important;
	transition: transform 0.3s;
	transform: translate(0px, -50px);
}

.navbar.navbar-default .nav-collapse.in, .navbar.navbar-inverse .nav-collapse.in
	{
	transform: translate(0px, 0px);
}

@media screen and (max-width: 767px) {
	.navbar .navbar-collapse .navbar-right>li:last-child {
		padding-left: 15px;
		padding-right: 15px;
	}
	.navbar .nav-collapse {
		margin: 7.5px auto;
		padding: 0;
	}
	.navbar .nav-collapse .navbar-form {
		margin: 0;
	}
	.nav-collapse>li {
		float: none;
	}
	.navbar.navbar-default .nav-collapse, .navbar.navbar-inverse .nav-collapse
		{
		transform: translate(-100%, 0px);
	}
	.navbar.navbar-default .nav-collapse.in, .navbar.navbar-inverse .nav-collapse.in
		{
		transform: translate(0px, 0px);
	}
	.navbar.navbar-default .nav-collapse.slide-down, .navbar.navbar-inverse .nav-collapse.slide-down
		{
		transform: translate(0px, -100%);
	}
	.navbar.navbar-default .nav-collapse.in.slide-down, .navbar.navbar-inverse .nav-collapse.in.slide-down
		{
		transform: translate(0px, 0px);
	}
}
</style>
		<!-- header -->				
		<header>
			<h1><a class="navbar-brand" href="${pageContext.request.contextPath}/login_company/companyMain.do"><img alt="로고 이미지"
				src="${pageContext.request.contextPath}/company_logos/logo.png"/></a></h1>
			<nav style="float: right;">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/inc_user/login.do">로그인</a>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/inc_user/register.do">회원가입</a>				
			</nav>
		</header>
</head>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="navbar-collapse-3">
	<ul class="nav navbar-nav navbar-right">
		
	</ul>
	<div class="collapse nav navbar-nav nav-collapse slide-down"
		id="nav-collapse3">
		<form class="navbar-form navbar-right" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search" />
			</div>
			<button type="submit" class="btn btn-danger">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			</button>
		</form>
	</div>
</div>
<!-- /.navbar-collapse -->
</div>
<!-- /.container -->
</nav>
<!-- /.navbar -->

<!-- Second navbar for profile settings -->
<nav class="navbar navbar-inverse">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar-collapse-4">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div>
			   <a class="navbar-brand" href="${pageContext.request.contextPath}/com_reser/">예약관리</a>
			   <a class="navbar-brand" href="${pageContext.request.contextPath}/com_manage/regist_option.do">차량관리</button></a>
			   <a class="navbar-brand" href="${pageContext.request.contextPath}/#">후기관리</a>
			   <a class="navbar-brand" href="${pageContext.request.contextPath}/#">매출현황/통계</a>
			   <a class="navbar-brand" href="${pageContext.request.contextPath}/#">관리자에게 문의</a>
			</div>

		</div>
	</div>
</nav>

<section>
	