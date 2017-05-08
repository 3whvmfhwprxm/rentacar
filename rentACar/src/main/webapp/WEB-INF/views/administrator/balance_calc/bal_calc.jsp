<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<style>
	.divSales{margin: 10px 0;}
	.bodyClass{padding-top: 30px;}
	th{background-color: #EEEEEE;}
</style>
<script>
	$().ready(function(){
		$.setYear();		
		$.setMonth();		
		
		$("#frmSales").submit(function(){
			if($("#year").val().length<1){
				alert("정산년도를 선택하세요");
				$("#year").focus();
				return false;
			}else if($("#month").val().length<1){
				alert("정산월을 선택하세요");
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
	<%-- <div>
		<a href='<c:url value="/admin/" />'>월별 정산</a> | 
		<a href='<c:url value="/admin/" />'></a> | 
		<a href='<c:url value="/admin/" />'></a> | 
	</div> --%>
	<h3>일별 매출</h3>
	<form name="frmSales" id="frmSales" method="post" action='<c:url value="/admin/balCalc/balCalcShow.do" />'>
		<select name="year" id="year">
			<option value="">선택하세요</option>
		</select> 년
		
		<select name="month" id="month">
			<option value="">선택하세요</option>
		</select> 월
		
		<input type="submit" value="검색">	
	</form>
	
	<div class="divSales">
		<table class="table table-bordered" summary="해당 월의 업체별정산에 관한 표">
			<thead>
				<tr>
					<th></th>
					<th>정산년월</th>
					<th>정산업체명</th>
					<th>예약수</th>
					<th>매출액</th>
					<th>수수료율</th>
					<th>수수료</th>
					<th>정산처리여부</th>
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
							<td class="text-center">${map['PAYDATE'] }</td>
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
</div>