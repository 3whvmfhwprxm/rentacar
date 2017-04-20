<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<style type="text/css">
	table tr th{
		background-color: yellow;
	}

</style>
<!-- 업체 차량 조회 -->
<h2>차량 현황</h2>
<table border="1" width=100%>
	<tr>
		<th>차량번호</th>
		<th>차량모델코드</th>
		<th>모델명</th>
		<th>옵션</th>
		<th>차량사용가능여부</th>
		<th>차량상태변경</th>
		<th>차량상태</th>
		<th>차량상태변경버튼</th>
	</tr>
	
            <%-- <c:forEach var="map" items="${authList}">
            	<option value="${map['AUTHCODE'] }">${map['AUTHNAME']}</option>
            </c:forEach>
            --%>
	
	<!-- 반복시작 -->
	<c:forEach var="map" items="${cclist }">
		<tr>
			<td><a href="<c:url value='/com_manage/company_ccarDetail.do?ccarCarId=${map["CCAR_CAR_ID"] }' /> " />${map['CCAR_CAR_ID']}</td>
			<td>${map['CAR_CODE'] }</td>
			<td>${map['CAR_NAME'] }</td>
			<td><a href="#">옵션상세보기</a></td>
			<td>${map['CCAR_USE_YN'] }</td>
			<td><button>여부변경</button></td>
			<td></td>
			<td><button>상태변경</button></td>
		</tr>
	</c:forEach>
	 <!-- 반복끝 -->  
</table>


<%@ include file="../inc_company/company_bottom.jsp" %>