<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<style>
	.divSales{margin: 10px 0;}
	.bodyClass{padding-top: 30px; width: 80%; padding-left: 80px;}
	th{background-color: #EEEEEE;}
</style>
<script>
	$().ready(function(){	
		
		$("#frmSales").submit(function(){
			if($("#startDay").val().length<1){
				alert("조회 시작일 선택하세요");
				$("#startDay").focus();
				return false;
			}else if($("#endDay").val().length<1){
				alert("조회 종료일 선택하세요");
				$("#endDay").focus();
				return false;
			}
		});
	});

</script>
<div class="w3-container bodyClass">
	<div>
		<a href='<c:url value="/admin/sales/salesDay.do" />'>일별 매출</a> | 
		<a href='<c:url value="/admin/sales/salesMonth.do" />'>월별 매출</a> | 
		<a href='<c:url value="/admin/sales/salesTerm.do" />'>기간별 매출</a> | 
	</div>
	<h3>기간별 매출</h3>
	<form name="frmSales" id="frmSales" method="post" action='<c:url value="/admin/sales/salesTerm.do" />'>
		<%@ include file="../../common/dateTerm.jsp" %>
		
		<input type="submit" value="검색">	
	</form>

	<div class="divSales">
		<table class="table table-bordered" summary="기간별 매출액에 관한 표">
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
						<td colspan="2" class="text-center">해당 기간의 매출액이 없습니다.</td>
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