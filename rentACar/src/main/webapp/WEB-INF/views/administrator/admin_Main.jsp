<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/top.jsp"%>

<!-- Header -->
<header class="w3-container" style="padding-top: 5px;">
	<h3>
		<b><i class="fa fa-check" aria-hidden="true"></i>&nbsp; 현황</b>
	</h3>
</header>

<div class="w3-row-padding w3-margin-bottom">
	<a href='<c:url value="/administrator/user/userInList.do" />'>
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
	
	<a href='<c:url value="/administrator/company/companyList.do" />'>
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
	
	<a href='<c:url value="/admin/reserv/reservInfo.do" />'>
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
	
	<a href='<c:url value="/admin/payInfo.do" />'>
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

<div class="w3-container">
	<h3>
		<b>
			<i class="fa fa-line-chart" aria-hidden="true"></i>
			<a href='<c:url value="/administrator/highChart/sales.do" />'>
				차트
			</a>
		</b>
	</h3>
	<!-- HighChart 그래프 -->
	<div id="container" style="width: 100%; height: 450px; margin: 8px 0 8px 0;
		padding: 0 8px;"></div>
	<script type="text/javascript">
		Highcharts.chart('container', {
			chart: {
		        type: 'line'
		    },
		    
		    title: {
		        text: '월별매출'
		    },
	
		    xAxis: { 
		    	categories: ${listMonth}
		    },
		       
		    yAxis: {
		        title: {
		            text: '원'
		        }
		    },
		    
		    legend: {
		        layout: 'vertical',
		        align: 'right',
		        verticalAlign: 'middle'
		    },
	
	 	    plotOptions: {
		        series: {
		            pointStart: 1
		        }
		    },
	
		    series: [{
		        name: '월별 매출',
		        data: ${listPay}
		    }]
		});
	</script>
</div>

<div class="w3-container">
	<h3>
		<b>
			<i class="fa fa-credit-card"></i>
			<a href='<c:url value="/administrator/payInfo/payInfoList.do" />'>
				결제
			</a>
		</b>
	</h3>
	<div class="row">
		<div class="col-md-12">
			<br>
			<table class="table table-hover" style="text-align: center;">
				<thead>			
					<tr class="info">
						<th scope="col">결제번호</th>
						<th scope="col">예약번호</th>
						<th scope="col">결제자 연락처</th>
						<th scope="col">결제방법</th>
						<th scope="col">결제금액</th>			
						<th scope="col">결제일시</th>
						<th scope="col">진행상태</th>
					</tr>
				</thead>

				<tbody>
					<c:if test="${empty PayInfoList}">
						<tr>
							<td colspan="7">데이터가 존재하지 않습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${!empty PayInfoList}">
					<c:forEach var="vo" items="${PayInfoList}">
						<tr>
							<td><a
								href='<c:url value="/administrator/payInfo/payInfoList.do" />'>
									${vo.payNo}</a></td>
							<td>${vo.reservNum}</td>
							<td>${vo.userTel1}-${vo.userTel2}-${vo.userTel3}</td>
							<td>${vo.payMethod}</td>
							<td>${vo.payMoney}</td>
							<td>${vo.payRegdate}</td>
							<td>${vo.payCondition}</td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="include/bottom.jsp"%>