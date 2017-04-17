<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<!-- 차량 상세보기  -->
<h2>차량 상세 정보</h2>
<table border="1">
	<!-- 반복시작 -->
		<tr>
			<td>모델코드</td>
			<td>${map['CAR_CODE'] }</td>
		</tr>
		<tr>
			<td>차량번호</td>
			<td>${map['CCAR_CAR_ID'] }</td>
		</tr>
		<tr>
			<td>모델명123</td>
			<td></td>
		</tr>
		<tr>
			<td>제조사</td>
			<td></td>
		</tr>
		<tr>
			<td>연료</td>
			<td></td>
		</tr>
		<tr>
			<td>승차인원</td>
			<td></td>
		</tr>
		<tr>
			<td>출시년도</td>
			<td></td>
		</tr>
		<tr>
			<td>변속기</td>
			<td></td>
		</tr>
		<tr>
			<td>등록일</td>
			<td></td>
		</tr>
		<tr>
			<td>차량유형</td>
			<td></td>
		</tr>
	<!--  반복끝 -->
</table>
<button><a href="<c:url value='/com_manage/company_ccarList.do' />" />목록</button>
<%@ include file="../inc_company/company_bottom.jsp" %>