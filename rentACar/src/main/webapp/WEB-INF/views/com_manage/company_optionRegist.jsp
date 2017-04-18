<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		$(".Yn").click(function(){
			if($('#ccarUseYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarBlackboxYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarSmokeYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarRearCameraYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarRearSenceYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarNaviYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarSunRoofYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarBluetoothYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarSmartkeyYn').is(":checked")){
				$(this).val('Y');
			}
			
		});
		
	});
	
</script>
<h2>차량 옵션 등록 페이지</h2>
<br>
<hr>
<h3>차량등록</h3>

<form name="frmCO" method="post"
	action="<c:url value='/com_manage/company_optionRegist.do'/>">
	업체아이디<input type="text" name="comID" id="comID">
	차량번호<input type="text" name="ccarCarId" id="ccarCarId">
	<br><br>     
    <strong>차량등록하기</strong>
     모델코드<input type="text" name="carCode" id="carCode">아래 제조사car_INC, 모델명 선택car_name시 자동입력<br><br><hr>
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
	<input type="checkbox" class = "Yn" name="ccarUseYn" id="ccarUseYn" value="N">사용가능할경우 체크<br><br>
	<h3>옵션등록</h3>
	<input type="checkbox" class="Yn" name="ccarBlackboxYn" id="ccarBlackboxYn">블랙박스 <input
		type="checkbox" class = "Yn" name="ccarSmokeYn" id="ccarSmokeYn">금연차 <input
		type="checkbox" class = "Yn" name="ccarRearCameraYn" id="ccarRearCameraYn">후방카메라 <input
		type="checkbox" class = "Yn" name="ccarRearSenceYn" id="ccarRearSenceYn">후방센서 <br> <input
		type="checkbox" class = "Yn" name="ccarNaviYn" id="ccarNaviYn">네비게이션 <input
		type="checkbox" class = "Yn" name="ccarSunRoofYn" id="ccarSunRoofYn">썬루프 <input
		type="checkbox" class = "Yn" name="ccarBluetoothYn" id="ccarBluetoothYn">블루투스 <input
		type="checkbox" class = "Yn" name="ccarAuxYn" id="ccarAuxYn">AUX <br> <input
		type="checkbox" class = "Yn" name="ccarSmartkeyYn" id="ccarSmartkeyYn">  스마트키 <br>
	<h3>차량가격</h3>
	대여횟수<input type="text" name="ccarRentalcount" id="ccarRentalcount">
	평일예약가격<input type="text" name="ccarNormalPrice" id="ccarNormalPrice"> 주말예약가격<input
		type="text" name="ccarWeekendPrice" id="ccarWeekendPrice">
		 성수기예약가격<input type="text" name="ccarPeakPrice"
		id="ccarPeakPrice"> 극성수기예약가격<input type="text" name="ccarSPeakPrice" id="ccarSPeakPrice"> <br>
		연체료<input type="text" name="ccarArrear" id="ccarArrear">
	<br>
	<hr>
	<input type="submit" value="등록"> <input type="reset" value="취소">
</form>

<br>
<br>
<br>
<hr>
<%@ include file="../inc_company/company_bottom.jsp"%>