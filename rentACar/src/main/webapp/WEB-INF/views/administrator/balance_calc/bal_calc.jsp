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
		
		$("input[name='chkAll']").click(function(){				
			$("tbody input[type=checkbox]").prop("checked", this.checked);
		});
		
		$("#btCancelMulti").click(function(){	
			if($('tbody input:checkbox:checked').length==0){
				alert("정산처리할 대상을 하나라도 선택하셔야 합니다");
				return;
			}else if(confirm("정말로 정산처리하시겠습니까?")){
				$("#frmReservList").attr("action","<c:url value='/admin/reserv/reservMultiCancel.do' />");
				$("#frmReservList").submit();	
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
		<a href='<c:url value="/admin/" />'>업체별 정산</a> | 
		<a href='<c:url value="/admin/" />'></a> | 
	</div> --%>
	<h3>정산내역</h3>
	<form name="frmSales" id="frmSales" method="post" action='<c:url value="/admin/balCalc/balCalcShow.do" />'>
		<select name="year" id="year">
			<option value="">선택하세요</option>
		</select> 년
		
		<select name="month" id="month">
			<option value="">선택하세요</option>
		</select> 월
		
		<input type="submit" value="검색">	
	</form>
	
	<form name="frmBalanceCalc" id="frmBalanceCalc" method="post">
		
		<!-- 테이블 화면 시작 -->
		<div class="divSales">
			<table class="table table-bordered" summary="해당 월의 업체별정산에 관한 표">
				<thead>
					<tr>
						<th><input type="checkbox" name="chkAll"></th>
						<th>정산업체명</th>
						<th>예약건수</th>
						<th>매출액</th>
						<th>수수료율</th>
						<th>수수료</th>
						<th>정산처리여부</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty blist}">
						<tr>
							<td colspan="7" class="text-center">해당 월의 정산내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty blist}">
						<c:set value="0" var="YesSumSales"/>
						<c:set value="0" var="YesSumCommission"/>
						<c:set value="0" var="NoSumSales"/>
						<c:set value="0" var="NoSumCommission"/>
						<c:set value="0" var="i"/>
						<c:forEach var="map" items="${blist }">
							<tr>
								<td></td>
								<td class="text-center">${map['COM_NAME'] }</td>
								<td class="text-center">${map['BAL_RESERV_CNT'] }</td>
								<td class="text-right">
									<fmt:formatNumber pattern="#,###" value="${map['BAL_SALES'] }"  /> 원
								</td>
								<td class="text-right">${map['COM_RATE'] } % </td>
								<td class="text-right">
									<fmt:formatNumber pattern="#,###" value="${map['BAL_COMMISSION'] }"  /> 원
								</td>
								<td class="text-center">
									<c:if test="${empty map['BAL_DECISION_DATE']}">
										정산처리 전
										<c:set value="${map['BAL_SALES']+NoSumSales }" var="NoSumSales" />
										<c:set value="${map['BAL_COMMISSION']+NoSumCommission }" var="NoSumCommission" />
									</c:if>
									<c:if test="${!empty map['BAL_DECISION_DATE']}">
										<fmt:formatDate value="${map['BAL_DECISION_DATE'] }" pattern="yyyy-MM-dd HH:mm"/>에 정산처리
										<c:set value="${map['BAL_SALES']+YesSumSales }" var="YesSumSales" />
										<c:set value="${map['BAL_COMMISSION']+YesSumCommission }" var="YesSumCommission" />
									</c:if>
								</td>								
							</tr>
							
						</c:forEach>
						<tr>
							<th class="text-right" colspan="4"> 정산 안된 매출 금액 합계 </th>
							<th class="text-right" colspan="3"> 정산 안된 수수료 금액 합계 </th>
						</tr>
						<tr>
							<td class="text-right" colspan="4">
								<fmt:formatNumber pattern="#,###" value="${NoSumSales }"  /> 원
							</td>
							<td class="text-right" colspan="3">
								<fmt:formatNumber pattern="#,###" value="${NoSumCommission }"  /> 원
							</td>
						</tr>
						<tr>
							<th class="text-right" colspan="4"> 정산된 매출 금액 합계 </th>
							<th class="text-right" colspan="3"> 정산된 수수료 금액 합계 </th>
						</tr>
						<tr>
							<td class="text-right" colspan="4">
								<fmt:formatNumber pattern="#,###" value="${YesSumSales }"  /> 원
							</td>
							<td class="text-right" colspan="3">
								<fmt:formatNumber pattern="#,###" value="${YesSumCommission }"  /> 원
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</form>
</div>