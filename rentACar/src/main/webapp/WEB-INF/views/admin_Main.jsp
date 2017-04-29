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

<body class="w3-light-grey">
	<!-- Top container -->
	<div class="w3-bar w3-top w3-large" style="background-color: gray;">
		<span class="w3-bar-item w3-left">
			<a href='<c:url value="/admin_Main.do" />'>
				3조 렌트카
			</a>
		</span>
	</div>
	<!-- z-index: 3; w3-bar" style="" -->
	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
		style=" width: 250px;" id="mySidebar">
		<br>
		<div class="w3-container w3-row">
			<div class="w3-col s4">
				<i class="fa fa-user-o fa-5x" style="width: 46px" aria-hidden="true"></i>
			</div>
			<div class="w3-col s8">
				<span><strong> Mike님 환영합니다.</strong></span><br><br>					
					<span>
					<%-- <c:if test="${sessionScope.Admin_Id!=null}"> --%>
						<a href='<c:url value="/administrator/log/logIn.do" />'>
							<i class="glyphicon glyphicon-log-out"></i> log Out
						</a>
					<%-- </c:if> --%>
					</span>
			</div>
		</div>
		<hr>
		<div class="w3-container" style="background-color: gray;">
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
			
			<a href="#" 
				class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-calendar-check-o"></i>&nbsp; 예약관리
			</a>
				
			<a href="#" class="w3-bar-item w3-button w3-padding">
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
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 250px; margin-top: 43px;">

		<!-- Header -->
		<header class="w3-container" style="padding-top: 5px;">
			<h3>
				<b><i class="fa fa-line-chart" aria-hidden="true"></i>&nbsp; 현황</b>
			</h3>
		</header>
		
		
		<div class="w3-row-padding w3-margin-bottom">
			<a href='<c:url value="/administrator/user/userList.do" />'>
				<div class="w3-quarter">
					<div class="w3-container w3-orange w3-text-white w3-padding-16">
						<div class="w3-left">
							<i class="fa fa-users w3-xxxlarge"></i>
						</div>
						<div class="w3-right">
							<h3>${userCount} 명</h3>
						</div>
						<div class="w3-clear"></div>
						<h4>회원</h4>
					</div>
				</div>
			</a>
			
			<a href='<c:url value="/administrator/user/userList.do" />'>
			<div class="w3-quarter">
				<div class="w3-container w3-red w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-mixcloud w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>${companyCount} 개</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>업체</h4>
				</div>
			</div>
			</a>
			
			<a href='<c:url value="/administrator/user/userList.do" />'>
			<div class="w3-quarter">
				<div class="w3-container w3-blue w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-calendar-check-o w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>${reservationCount} 건</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>예약</h4>
				</div>
			</div>
			</a>
			
			<a href='<c:url value="/administrator/user/userList.do" />'>
			<div class="w3-quarter">
				<div class="w3-container w3-teal w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-credit-card w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>${payinfoCount} 건</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>결제</h4>
				</div>
			</div>
			</a>
		</div>

		<div>
			<!-- HighChart 그래프 -->
			<div id="container" style="width: 100%; height: 450px; margin: 8px 0 8px 0;
				padding: 0 8px;"></div>
			
			<script type="text/javascript">
				Highcharts.chart('container', {
				    chart: {
				        type: 'column'
				    },
				    title: {
				        text: 'Monthly Average Reservation'
				    },
				    xAxis: {
				        categories: [
				            '1월',
				            '2월',
				            '3월',
				            '4월',
				            '5월',
				            '6월',
				            '7월',
				            '8월',
				            '9월',
				            '10월',
				            '11월',
				            '12월'
				        ],
				        crosshair: true
				    },
				    yAxis: {
				        min: 0,
				        title: {
				            text: 'Rainfall (mm)'
				        }
				    },
				    tooltip: {
				        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
				        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
				            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
				        footerFormat: '</table>',
				        shared: true,
				        useHTML: true
				    },
				    plotOptions: {
				        column: {
				            pointPadding: 0.2,
				            borderWidth: 0
				        }
				    },
				    series: [{
				        name: 'Tokyo',
				        data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
				
				    }, {
				        name: 'New York',
				        data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]
				
				    }, {
				        name: 'London',
				        data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]
				
				    }, {
				        name: 'Berlin',
				        data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]
				
				    }]
				});
			</script>
		</div>
	</div>
</body>
</html>