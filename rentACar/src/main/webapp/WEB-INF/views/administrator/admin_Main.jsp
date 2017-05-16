<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/top.jsp"%>

<style>
.bodyStyle {
	padding-left: 40px;
	width: 95%;
}
</style>

<div class="bodyStyle">
	<!-- Header -->
	<header class="w3-container" style="padding-top: 5px;">
		<h3>
			<b><i class="fa fa-check" aria-hidden="true"></i>&nbsp;관리 정보 현황</b>
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
						<h3>${userCount}명</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>회원</h4>
				</div>
			</div>
		</a> <a href='<c:url value="/administrator/company/companyList.do" />'>
			<div class="w3-quarter">
				<div class="w3-container w3-red w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-mixcloud w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>${companyCount}개</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>업체</h4>
				</div>
			</div>
		</a> <a href='<c:url value="/admin/reserv/reservInfo.do" />'>
			<div class="w3-quarter">
				<div class="w3-container w3-blue w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-calendar-check-o w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>${reservationCount}건</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>예약</h4>
				</div>
			</div>
		</a> <a href='<c:url value="/admin/payInfo.do" />'>
			<div class="w3-quarter">
				<div class="w3-container w3-teal w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-credit-card w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>${payinfoCount}건</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>결제</h4>
				</div>
			</div>
		</a>
	</div>

	<div class="w3-container">
		<h3>
			<b> <i class="fa fa-line-chart" aria-hidden="true"></i> <a
				href='<c:url value="/admin/sales/salesMonth.do" />'> &nbsp;2017년 매출 </a>
			</b>
		</h3>
		<!-- HighChart 그래프 -->
		<div id="container"
			style="width: 100%; height: 450px; margin: 8px 0 8px 0; padding: 0 8px;"></div>

		<div class="divSales">
			<table class="table table-bordered" summary="월별 매출액에 관한 표">
				<colgroup>
					<col width="40%">
					<col width="*">
				</colgroup>
				<thead>
					<tr class="info">
						<th scope="col" class="text-center">매출월</th>
						<th scope="col" class="text-center">매출액</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty slist}">
						<tr>
							<td colspan="2" class="text-center">해당 년도의 매출액이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty slist}">
						<c:set var="totalSum" value="0" />
						<c:forEach var="map" items="${slist }">
							<tr>
								<td class="text-center">${map['PAYDATE'] }월</td>
								<td class="text-right"><fmt:formatNumber pattern="#,###"
										value="${map['TOTALPAY'] }" /> 원</td>
							</tr>
							<c:set value="${map['TOTALPAY']+totalSum }" var="totalSum" />
						</c:forEach>
						<tr class="info">
							<th class="text-right" colspan="2">매출액 합계</th>
						</tr>
						<tr>
							<td class="text-right" colspan="2"><fmt:formatNumber
									pattern="#,###" value="${totalSum }" /> 원</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
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
	 	    	line: {
	 	            dataLabels: {
	 	                enabled: true
	 	            },
	 	            enableMouseTracking: true
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
			<b> <i class="fa fa-credit-card"></i> <a
				href='<c:url value="/admin/payInfo.do" />'>
					&nbsp;최근 결제 10건 </a>
			</b>
		</h3>
		<div class="row">
			<div class="col-md-12">
				<br>
				<table class="table table-hover" style="text-align: center;">
					<thead>
						<tr class="info">
							<th scope="col" style="text-align: center;">결제번호</th>
							<th scope="col" style="text-align: center;">예약번호</th>
							<th scope="col" style="text-align: center;">결제자 연락처</th>
							<th scope="col" style="text-align: center;">결제방법</th>
							<th scope="col" style="text-align: center;">결제금액</th>
							<th scope="col" style="text-align: center;">결제일시</th>
							<th scope="col" style="text-align: center;">진행상태</th>
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
</div>
<%@ include file="include/bottom.jsp"%>