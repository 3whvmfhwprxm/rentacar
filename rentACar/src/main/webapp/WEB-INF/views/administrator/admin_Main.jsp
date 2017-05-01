<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/top.jsp"%>
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
	    	text: '월별 매출'
	    },
	    
	    xAxis:{
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
	    
	    yAxis:{
	    	allowDecimals: true,
	    	min: 0,
	    	title: {
	    		text: '원'
	    	}
	    },
	    
	    tooltip: {
	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	            '<td style="padding:0"><b>{point.y:.1f} 원</b></td></tr>',
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
	        name: '매출',
	        data: [${selectSumPayMoney}-${selectSumPayDiscount}]
	    }]
	});		    
	</script>		
	
	<!-- <script type="text/javascript">
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
	</script> -->
</div>
<%@ include file="include/bottom.jsp"%>