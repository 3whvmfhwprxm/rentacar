<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<!-- 차량 상세보기  -->
<h2>차량 상세 정보</h2>
<table border="1">
		<tr>
			<td>차량번호</td>
			<td>${map['CCAR_CAR_ID'] }</td>
			<td>모델코드</td>
			<td>${map['CAR_CODE'] }</td>
		</tr>
		<tr>
			<td>모델명</td>
			<td>${map['CAR_NAME'] }</td>
			<td>제조사</td>
			<td>${map['CAR_INC'] }</td>
		</tr>
		<tr>
			<td>연료타입</td>
			<td>${map['CAR_FUEL'] }</td>
			<td>승차인원</td>
			<td>${map['CAR_SIZE'] } 명</td>
		</tr>
		<tr>
			<td>출시년도</td>
			<td>${map['CAR_YEAR'] }</td>
			<td>변속기</td>
			<td>${map['CAR_TRANS'] }</td>
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
			<input type="checkbox" class = "Yn" name="ccarUseYn" id="ccarUseYn" disabled="true" value="${map['CCAR_USE_YN'] }"		
			 <c:if test="${map['CCAR_USE_YN']=='Y' }">checked</c:if>> 사용가능할경우 체크</td>
		</tr>
		<tr>
			<td>옵션사항</td>
			<td colspan="3">
			<input type="checkbox" class = "Yn" name="ccarBlackboxYn" id="ccarBlackboxYn" disabled="true" value="${map['CCAR_BLACKBOX_YN'] }"
				<c:if test="${map['CCAR_BLACKBOX_YN']=='Y' }">checked</c:if>> 블랙박스
			<input type="checkbox" class = "Yn" name="ccarSmokeYn" id="ccarSmokeYn" disabled="true" value="${map['CCAR_SMOKE_YN'] }"
				<c:if test="${map['CCAR_SMOKE_YN']=='Y' }">checked</c:if>> 금연
			<input type="checkbox" class = "Yn" name="ccarRearCameraYn" id="ccarRearCameraYn" disabled="true" value="${map['CCAR_REAR_CAMERA_YN'] }"
				<c:if test="${map['CCAR_REAR_CAMERA_YN']=='Y' }">checked</c:if>> 후방카메라 
			<input type="checkbox" class = "Yn" name="ccarRearSenceYn" id="ccarRearSenceYn" disabled="true" value="${map['CCAR_REAR_SENCE_YN'] }"
				<c:if test="${map['CCAR_REAR_SENCE_YN']=='Y' }">checked</c:if>> 후방센서 <br> 
			<input type="checkbox" class = "Yn" name="ccarNaviYn" id="ccarNaviYn" disabled="true" value="${map['CCAR_NAVI_YN'] }"
				<c:if test="${map['CCAR_NAVI_YN']=='Y' }">checked</c:if>> 네비게이션
			<input type="checkbox" class = "Yn" name="ccarSunRoofYn" id="ccarSunRoofYn" disabled="true" value="${map['CCAR_SUNROOF_YN'] }"
				<c:if test="${map['CCAR_SUNROOF_YN']=='Y' }">checked</c:if>> 썬루프
			<input type="checkbox" class = "Yn" name="ccarBluetoothYn" id="ccarBluetoothYn" disabled="true" value="${map['CCAR_BLUETOOTH_YN'] }"
				<c:if test="${map['CCAR_BLUETOOTH_YN']=='Y' }">checked</c:if>> 블루투스
			<input type="checkbox" class = "Yn" name="ccarAuxYn" id="ccarAuxYn" disabled="true" value="${map['CCAR_AUX_YN'] }"
				<c:if test="${map['CCAR_AUX_YN']=='Y' }">checked</c:if>> AUX <br>
			<input type="checkbox" class = "Yn" name="ccarSmartkeyYn" id="ccarSmartkeyYn" disabled="true" value="${map['CCAR_SMARTKEY_YN'] }"
				<c:if test="${map['CCAR_SMARTKEY_YN']=='Y' }">checked</c:if>> 스마트키<br>
			 </td>
			
		</tr>
		
</table>	
	
<button><a href="<c:url value='/com_manage/company_ccarList.do' />" />목록</button>
<button><a href="<c:url value='/com_manage/company_ccarEdit.do?ccarCarId=${map["CCAR_CAR_ID"] }' />" />수정</button>
<%@ include file="../inc_company/company_bottom.jsp" %>