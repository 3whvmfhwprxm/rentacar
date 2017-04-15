<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<div class="container">
	<form name="insertReservInfo" id="insertReservInfo" method="post" action="#">
		<!-- 선택한 기간 정보 -->
		<div>
			<p><label>선택하신 예약 기간: ${param.searchStartDate} ~ ${param.searchEndDate}</label></p>
			<input type="hidden" value="${param.searchStartDate}">
			<input type="hidden" value="${param.searchEndDate}">	
		</div>
		
		<!-- 선택한 차에 대한 정보 -->
		<div>
			<p>선택한 차 ID: ${car.ccarCarId }</p>
			<p>선택한 차 모델: ${car.carCode }</p>			
			<p>블랙박스 유무: ${car.ccarBlackboxYn }</p>
			<p>흡연 가능여부: ${car.ccarSmokeYn }</p>
			<p>후방카메라 유무: ${car.ccarRearCameraYn }</p>
			<p>...등</p>
		</div>
		
		<!-- 예약자 및 운전자 입력 정보 -->
		<h4>예약자 정보 입력</h4>
		예약자 이름: <input type="text" name="" id=""><br>
		이메일: <input type="text" name="" id=""><br>
		연락처: <input type="text" name="" id=""><br>
		
		<h4>운전자 정보 입력</h4>
		운전자 이름: <input type="text" name="" id=""><br>
		면허증: <input type="text" name="" id=""><br>
		연락처: <input type="text" name="" id=""><br>
		<input type="submit" value="예약하기">
	</form>
</div>
<%@ include file="bottom.jsp"%>