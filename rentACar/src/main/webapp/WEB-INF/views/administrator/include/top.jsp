<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<title>관리자 페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-3.1.1.min.js">
</script>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>

<script src="https://code.highcharts.com/modules/exporting.js"></script>

<script>
	// Get the Sidebar
	var mySidebar = document.getElementById("mySidebar");
	
	// Get the DIV with overlay effect
	var overlayBg = document.getElementById("myOverlay");
	
	// Toggle between showing and hiding the sidebar, and add overlay effect
	function w3_open() {
	    if (mySidebar.style.display === 'block') {
	        mySidebar.style.display = 'none';
	        overlayBg.style.display = "none";
	    } else {
	        mySidebar.style.display = 'block';
	        overlayBg.style.display = "block";
	    }
	}
	
	// Close the sidebar with the close button
	function w3_close() {
	    mySidebar.style.display = "none";
	    overlayBg.style.display = "none";
	}
</script>

<style>
	html, body, h1, h2, h3, h4, h5{
		font-family: "Raleway", sans-serif
	}
	
	a{
		text-decoration: none !important;
	}
</style>

<body class="w3">
	<!-- Top container -->
	<div class="w3-bar w3-top w3-large" style="background-color: skyblue;">
		<span class="w3-bar-item w3-left">
			<a href='<c:url value="/administrator/admin_Main.do" />'>
				<i class="fa fa-heart" aria-hidden="true"></i> 3조 렌트카
			</a>
		</span>
		
		
		
		<span class="w3-bar-item w3-right">
			<c:if test="${sessionScope.Admin_Id!=null}">			
				<span>					
					<a href='<c:url value="/administrator/log/logout.do" />'>
						<i class="glyphicon glyphicon-log-out"></i> 로그아웃
					</a>				
				</span>
			</c:if>
			<c:if test="${sessionScope.Admin_Id==null}">
				<a href='<c:url value="/administrator/log/logIn.do" />'>
					<i class="glyphicon glyphicon-log-in"></i> 로그인
				</a>	
			</c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<span>					
				<a href='<c:url value="/user/index.do" />'>
					<i class="fa fa-eye" aria-hidden="true"></i> 홈페이지 바로가기
				</a>				
			</span>
		</span>
	</div>

	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
		style=" width: 250px;" id="mySidebar">
		<br>
		<div class="w3-container w3-row">
			<c:if test="${sessionScope.Admin_Id!=null}">
				<div class="w3-col s4">
					<i class="fa fa-user-o fa-5x" style="width: 46px" aria-hidden="true"></i>
				</div>
				<div class="w3-col s8">
						<span><strong>${sessionScope.Admin_Id}님 환영합니다.</strong></span>	
				</div>
			</c:if>
			
			<c:if test="${sessionScope.Admin_Id==null}">
				<div class="w3-col s4">
					<img alt="로그아웃시 이미지" style="width: 220px; height: 90px"
						src='<c:url value="/images/racoon.jpg" />'>
				</div>
			</c:if>
		</div>
		<hr>
		<div class="w3-container" style="background-color: skyblue;">
			<h5>
				<i class="fa fa-home"></i>&nbsp; 메뉴
			</h5>
		</div>
		
		<div class="w3-bar-block">
			<a href="<c:url value="/administrator/user/userList.do" />" 
				class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-users fa-fw"></i>&nbsp; 회원
			</a>
			
			<a href="<c:url value="/administrator/company/companyList.do" />" 
				class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-mixcloud"></i>&nbsp; 업체
			</a>
			
			<a href="<c:url value="/administrator/carModel/modelList.do" />" 
				class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-car"></i>&nbsp; 차량모델관리
			</a>
			
			<a href="<c:url value="/admin/reserv/reservInfo.do" />" 
				class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-calendar-check-o"></i>&nbsp; 예약관리
			</a>
				
			<a href="<c:url value="/admin/payInfo.do" />" class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-credit-card"></i>&nbsp; 결재내역관리
			</a>
			
			<a href="#" 
				class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-line-chart"></i>&nbsp; 통계/정산
			</a>
			
			<a href="#" 
				class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-list"></i>&nbsp; 게시판관리
			</a>
			
			<a href="#" 
				class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-gift"></i>&nbsp; 이벤트관리
			</a>
			
			<a href="<c:url value="/admin/Mng/adminList.do" />" 
				class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-cogs"></i>&nbsp; 관리자관리
			</a><br><br>
		</div>
	</nav>
	
	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay">
	</div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 250px; margin-top: 43px;">