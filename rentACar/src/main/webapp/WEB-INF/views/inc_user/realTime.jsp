<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(function() {
	    $("#searchStartDate, #searchEndDate").datepicker({
	        dateFormat: 'yy-mm-dd'
	    });
	});
</script>
<!-- 1.
예약시작날짜, 예약종료날짜
예약시작시간, 예약종료시간
차종류(소형,중형,대형)
조건을 입력받는 화면 보여주기

2.
위의 조건을 입력받고 '검색'을 누르면(post) 조건에 해당하는 리스트를 가져와서 보여준다
이때 검색시 예약정보 테이블에서 예약시작날짜/예약종료날짜/예약시작시간/예약종료시간 -->
<h1>실시간 예약하기(예약가능차량 검색 조회/선택)</h1>

<!-- 예약 가능 차 기본 옵션 검색 폼 -->
<div>
	<form name="searchForm" id="searchForm" method="post" action='<c:url value="/inc_user/realTime.do" />'>
		<label for="from">대여일: </label> 
		<input type="text" id="searchStartDate" name="searchStartDate"> 
		<label for="to">반납일: </label> 
		<input type="text" id="searchEndDate" name="searchEndDate"> 
		차종: <input type="text" id="carType" name="carType">
		<p><input type="submit" value="조건에 맞는 차량 찾기"></p>
	</form>
</div>
<!-- 예약 가능 차 리스트 표시 시작 -->
<div>
	<c:if test="${!empty clist }">	
		<table>			
			<tr>
				<th>업체보유차량 ID</th>
				<th>모델코드</th>
				<th>업체 ID</th>
				<th>평일예약가격(1일)</th>
				<th>주말예약가격(1일)</th>
				<th>성수기예약가격(1일)</th>
				<th>극성수기예약가격(1일)</th>
				<th>연체료</th>
			</tr>
			<c:forEach var="car" items="${clist }">
				<tr>
					<td>${car.ccarCarId }</td>
					<td>${car.carCode }</td>
					<td>${car.comID }</td>
					<td>${car.ccarNormalPrice }</td>
					<td>${car.ccarWeekendPrice }</td>
					<td>${car.ccarPeakPrice }</td>
					<td>${car.ccarSPeakPrice }</td>
					<td>${car.ccarArrear }</td>
				</tr>
			</c:forEach>
		</table>	
	</c:if>
</div>
<!-- 예약 가능 차 리스트 표시 종료 -->

<%@ include file="bottom.jsp"%>








