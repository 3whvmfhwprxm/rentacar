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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/???"/>
<script type="text/javascript">

</script>

</head>
<body>
	<!-- 상단 띠 이미지 영역-->
	<div id="topImg" class="top_Img" style="background:url(${pageContext.request.contextPath}/images/bg_top1.PNG)  repeat-x">
		&nbsp;
	</div>

	<div id="wrap">
		<!-- header -->				
		<header id="header">
			<h1><a href="${pageContext.request.contextPath}/index.jsp"><img alt="로고 이미지" src="${pageContext.request.contextPath}/images/???" height="95px" /></a></h1>
		
			<!-- 상단 오른쪽 로그인 메뉴 -->			
			<nav id="headerRight">
				<ul class="views">		
					<!-- 로그인된 경우 -->			
					<c:if test="${!empty sessionScope.userid }">
						<li><a href="${pageContext.request.contextPath}/login_company/com_logout.do">로그아웃</a></li>
						<li><a href="${pageContext.request.contextPath}/???/memberEdit.do">업체정보수정</a></li>	            
						<li><a href="${pageContext.request.contextPath}/???/memberOut.do">업체탈퇴</a></li>
					</c:if>		            
					<!-- 로그인 안된 경우 -->
					<c:if test="${empty sessionScope.userid }">
						<li><a href="${pageContext.request.contextPath}/login_company/com_login.do">로그인</a></li>
						<li><a href="${pageContext.request.contextPath}/???/agreement.do">회원가입</a></li>	            
					</c:if>
				</ul>				
			</nav>
		</header>

		<nav id="top_navi">
			<div id='cssmenu'>
				<ul>			   
				   <li><a href="#"><span>예약정보</span></a></li>
				   <li><a href="#"><span>차량관리</span></a></li>
				   <li><a href="#"><span>업체후기</span></a></li>
				   <li><a href="#"><span>통계</span></a></li>
				   <li><a href="#"><span>관리자 문의</span></a></li>
				</ul>
			</div>
		</nav>
		<!-- 라인 이미지 영역-->
		<div id="topLine" class="top_Line" style="background:url(${pageContext.request.contextPath}/images/line6.jpg)  repeat-x;font-size:7px">
			&nbsp;
		</div>
		<!-- container -->
		<div id="container">
			<nav>
				<dl id="leftNavi">
					<!-- category list -->
					<dt></dt>
					<dd><a href="default.jsp"></a></dd>
					<dd><a href="default.jsp"></a></dd>
					<dd><a href="default.jsp"></a></dd>
					<dd><a href="default.jsp"></a></dd>
				</dl>
			</nav>
			<section id="contents">
</body>
</html>