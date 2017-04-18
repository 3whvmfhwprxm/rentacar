<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<!-- 차량 수정 하기  -->
<h2>차량정보 수정하기</h2>
		<form name="frmCO" method="post"
	action="<c:url value='/com_manage/company_optionRegist.do'/>">
	업체아이디<input type="text" name="comID" id="comID" value="${map['COM_ID']}" disabled="true">
	차량번호<input type="text" name="ccarCarId" id="ccarCarId" value="${map['CCAR_CAR_ID'] }">
	<br><br>     
    <strong>차량등록하기</strong>
     모델코드<input type="text" name="carCode" id="carCode" value="${map['CAR_CODE'] }" disabled="true">아래 제조사car_INC, 모델명 선택car_name시 자동입력<br><br><hr>
    제조사<select>
    	<option>현대</option>
    	<option>기아</option>
    	<option>르노삼성</option>
    	<option>쉐보레</option>
    	<option>BMW</option>
    </select>
    모델명<select>
    	<option>아반떼</option>
    	<option>쏘나타</option>
    	<option>그렌져</option>
    </select><br><hr>
	<strong>차량사용가능여부</strong><br>
	<input type="checkbox" class = "Yn" name="ccarUseYn" id="ccarUseYn" value="${map['CCAR_USE_YN'] }"		
	 <c:if test="${map['CCAR_USE_YN']=='Y' }">checked</c:if>> 사용가능할경우 체크<br><br>
	
	<strong>옵션사항</strong><br>
<input type="checkbox" class = "Yn" name="ccarBlackboxYn" id="ccarBlackboxYn" value="${map['CCAR_BLACKBOX_YN'] }"
				<c:if test="${map['CCAR_BLACKBOX_YN']=='Y' }">checked</c:if>> 블랙박스
			<input type="checkbox" class = "Yn" name="ccarSmokeYn" id="ccarSmokeYn" value="${map['CCAR_SMOKE_YN'] }"
				<c:if test="${map['CCAR_SMOKE_YN']=='Y' }">checked</c:if>> 금연
			<input type="checkbox" class = "Yn" name="ccarRearCameraYn" id="ccarRearCameraYn" value="${map['CCAR_REAR_CAMERA_YN'] }"
				<c:if test="${map['CCAR_REAR_CAMERA_YN']=='Y' }">checked</c:if>> 후방카메라 
			<input type="checkbox" class = "Yn" name="ccarRearSenceYn" id="ccarRearSenceYn" value="${map['CCAR_REAR_SENCE_YN'] }"
				<c:if test="${map['CCAR_REAR_SENCE_YN']=='Y' }">checked</c:if>> 후방센서 <br> 
			<input type="checkbox" class = "Yn" name="ccarNaviYn" id="ccarNaviYn" value="${map['CCAR_NAVI_YN'] }"
				<c:if test="${map['CCAR_NAVI_YN']=='Y' }">checked</c:if>> 네비게이션
			<input type="checkbox" class = "Yn" name="ccarSunRoofYn" id="ccarSunRoofYn" value="${map['CCAR_SUNROOF_YN'] }"
				<c:if test="${map['CCAR_SUNROOF_YN']=='Y' }">checked</c:if>> 썬루프
			<input type="checkbox" class = "Yn" name="ccarBluetoothYn" id="ccarBluetoothYn" value="${map['CCAR_BLUETOOTH_YN'] }"
				<c:if test="${map['CCAR_BLUETOOTH_YN']=='Y' }">checked</c:if>> 블루투스
			<input type="checkbox" class = "Yn" name="ccarAuxYn" id="ccarAuxYn" value="${map['CCAR_AUX_YN'] }"
				<c:if test="${map['CCAR_AUX_YN']=='Y' }">checked</c:if>> AUX <br>
			<input type="checkbox" class = "Yn" name="ccarSmartkeyYn" id="ccarSmartkeyYn" value="${map['CCAR_SMARTKEY_YN'] }"
				<c:if test="${map['CCAR_SMARTKEY_YN']=='Y' }">checked</c:if>> 스마트키<br>

	<h3>차량가격</h3>
	대여횟수<input type="text" name="ccarRentalcount" id="ccarRentalcount" value="${map['CCAR_RENTALCOUNT'] }">회<br>
	평일예약가격<input type="text" name="ccarNormalPrice" id="ccarNormalPrice" value="${map['CCAR_NORMAL_PRICE'] }">원<br>
	주말예약가격<input type="text" name="ccarWeekendPrice" id="ccarWeekendPrice" value="${map['CCAR_WEEKEND_PRICE'] }">원<br>
	성수기예약가격<input type="text" name="ccarPeakPrice" id="ccarPeakPrice" value="${map['CCAR_PEAK_PRICE'] }">원<br>
	극성수기예약가격<input type="text" name="ccarSPeakPrice" id="ccarSPeakPrice" value="${map['CCAR_S_PEAK_PRICE'] }">원<br>
	연체료<input type="text" name="ccarArrear" id="ccarArrear" value="${map['CCAR_ARREAR'] }">원
	<br>
	<hr>
	<input type="reset" value="취소">
	<input type="submit" value="수정하기">
</form>
		</tr>
		<tr>
			<td>차량등록일자</td>
			<td>${map['COMCAR_REGDATE'] }</td>
			<td>차량유형</td>
			<td>${map['CAR_TYPE'] }</td>
		</tr>
		<tr>
			<td>평일 예약가격</td>
			<td colspan="3">${map['CCAR_NORMAL_PRICE'] } 원</td>
		</tr>
		<tr>
			<td>주말 예약가격</td>
			<td colspan="3">${map['CCAR_WEEKEND_PRICE'] } 원</td>
		</tr>
		<tr>
			<td>성수기 예약가격</td>
			<td colspan="3">${map['CCAR_PEAK_PRICE'] } 원</td>
		</tr>
		<tr>
			<td>극성수기 예약가격</td>
			<td colspan="3">${map['CCAR_S_PEAK_PRICE'] } 원</td>
		</tr>
		<tr>
			<td>차량사용가능여부</td>
			<td colspan="3">
		</tr>
		<tr>
			<td>옵션사항</td>
			
		</tr>

<%@ include file="../inc_company/company_bottom.jsp" %>