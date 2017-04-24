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
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.1.min.js'/>"/>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/company_ep.css"/>'/>



<script type="text/javascript"
	src="${pageContext.request.contextPath}/css/bootstrap.min.css"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
#img1{
	margin-bottom: 50px
}

</style>
<!-- header -->

<nav style="float: right;">
		<a class="navbar-brand"
		href="${pageContext.request.contextPath}/inc_user/login.do">로그인</a> 
		<a class="navbar-brand"
		href="${pageContext.request.contextPath}/inc_user/register.do">회원가입</a>
</nav>

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
				<a class="navbar-brand" href='<c:url value="/com_reser/"/>'>| 예약관리 |</a>
				<a class="navbar-brand"
					href='<c:url value="/com_manage/company_optionRegist.do"/>'>| 차량관리 |</a> 
				<a class="navbar-brand"
					href='<c:url value="/com_manage/company_epilogue.do"/>'>| 후기관리 |</a> 
				<a class="navbar-brand" href='<c:url value="/com_manage/company_revenue.do"/>'>| 매출현황/통계 |</a>
				<a class="navbar-brand" href='<c:url value="/com_manage/company_announcement.do"/>'>| 공지사항 |</a>
			</div>

		</div>
	</div>
</nav>

<section>