<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<div class="container">
	<form name="insertReservInfo" id="insertReservInfo" method="post" action="#">
		<!-- 선택한 기간 정보 -->
		<div>
			<p><label>선택하신 예약 기간: ${param.searchStartDate} ~ ${param.searchEndDate}</label></p>
			<!-- 테스트 끝나면 hidden으로 재 설정 -->
			<input type="text" value="${param.searchStartDate}">
			<input type="text" value="${param.searchEndDate}">
			<input type="text" value="${car.ccarCarId }">	
		</div>
		
		<!-- 선택한 차에 대한 정보 -->
		<div>
			<h3>선택하신 차에 대한 정보</h3>
			<p>선택한 차 ID: ${car.ccarCarId }</p>
			<p>선택한 차 모델: ${car.carCode }</p>			
			<p>블랙박스 유무: ${car.ccarBlackboxYn }</p>
			<p>흡연 가능여부: ${car.ccarSmokeYn }</p>
			<p>후방카메라 유무: ${car.ccarRearCameraYn }</p>
			<p>...등</p>
		</div>
		
		<!-- 예약자 및 운전자 입력 정보 -->
		<h4>예약자 정보 입력</h4>
		예약자 이름: <input type="text" name="resUName" id="resUName"><br>
		이메일: <input type="text" name="resUMail1" id="resUMail1">@
		<input type="text" name="resUMail2" id="resUMail2">
		<br>
		연락처: <input type="text" name="resUTel1" id="resUTel1">-
		<input type="text" name="resUTel2" id="resUTel2">-
		<input type="text" name="resUTel3" id="resUTel3">
		<br>
		
		<h4>운전자 정보 입력</h4>
		운전자 이름: <input type="text" name="resDrvName" id="resDrvName"><br>
		면허증: <input type="text" name="resDrvCategory" id="resDrvCategory"><br>
		연락처: <input type="text" name="resDrvTel1" id="resDrvTel1">-
		<input type="text" name="resDrvTel2" id="resDrvTel2">-
		<input type="text" name="resDrvTel3" id="resDrvTel3">
		<br>
		생년월일: <input type="text" name="resDrvBirth" id="resDrvBirth">
		<input type="submit" value="예약하기">
	</form>
</div>
<%@ include file="bottom.jsp"%>