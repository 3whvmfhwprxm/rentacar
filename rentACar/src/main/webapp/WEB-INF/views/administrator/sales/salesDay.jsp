<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<style>
	.divSales{margin: 10px 0;}
	.bodyClass{padding-top: 30px; width: 80%; padding-left: 80px;}
	th{background-color: #EEEEEE;}
</style>
<script>
	$().ready(function(){
		$.setYear();		
		$.setMonth();		
		
		$("#frmSales").submit(function(){
			if($("#year").val().length<1){
				alert("년도를 선택하세요");
				$("#year").focus();
				return false;
			}else if($("#month").val().length<1){
				alert("월을 선택하세요");
				$("#month").focus();
				return false;
			}
		});
	});
	
	$.setYear=function(){
		var today=new Date();
		var year=today.getFullYear();	//2017
		for(var i=year; i>=year-5; i--){
			if(i=='${param.year}'){		/* 항상 서버에서 값을 가져올때는 ''로 감싸도록해야한다 */
				$("#year").append("<option value='"+i+"' selected>"+i+"</option>");	
			}else{
				$("#year").append("<option value='"+i+"'>"+i+"</option>");
			}				
		}
	}
	
	$.setMonth=function(){
		for(var i=1; i<=12; i++){
			if(i=='${param.month}'){
				$("#month").append("<option value='"+i+"' selected>"+i+"</option>");	
			}else{
				$("#month").append("<option value='"+i+"'>"+i+"</option>");
			}
		}
	}
	
</script>
<div class="w3-container bodyClass">
	<div>
		<a href='<c:url value="/admin/sales/salesDay.do" />'>일별 매출</a> | 
		<a href='<c:url value="/admin/sales/salesMonth.do" />'>월별 매출</a> | 
		<a href='<c:url value="/admin/sales/salesTerm.do" />'>기간별 매출</a> | 
	</div>
	<h3>일별 매출</h3>
	<form name="frmSales" id="frmSales" method="post" action='<c:url value="/admin/sales/salesDay.do" />'>
		<select name="year" id="year">
			<option value="">선택하세요</option>
		</select> 년
		
		<select name="month" id="month">
			<option value="">선택하세요</option>
		</select> 월
		
		<input type="submit" value="검색">	
	</form>
	
	<div id="container"
			style="width: 100%; height: 450px; margin: 8px 0 8px 0; padding: 0 8px;"></div>
			
	<div class="divSales">
		<table class="table table-bordered" summary="일별 매출액에 관한 표">
			<colgroup>
				<col width="40%">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">매출일</th>
					<th scope="col">매출액</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty slist}">
					<tr>
						<td colspan="2" class="text-center">해당 월의 매출액이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty slist}">
					<c:set var="totalSum" value="0" />
					<c:forEach var="map" items="${slist }">
						<tr>
							<td class="text-center">${map['PAYDATE1']}-${map['PAYDATE2']}-${map['PAYDATE3'] }</td>
							<td class="text-right">
								<fmt:formatNumber pattern="#,###" value="${map['TOTALPAY'] }"  /> 원
							</td>
						</tr>
						<c:set value="${map['TOTALPAY']+totalSum }" var="totalSum" />
					</c:forEach>
					<tr>
						<th class="text-right" colspan="2">매출액 합계</th>
					</tr>
					<tr>
						<td class="text-right" colspan="2">
							<fmt:formatNumber pattern="#,###" value="${totalSum }"  /> 원
						</td>
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
		        text: '일별매출'
		    },
	
		    xAxis: { 
		    	type: 'datetime',
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
		        name: '일별 매출',
		        data: ${listPay}
		    }]
		});
	</script>
</div>