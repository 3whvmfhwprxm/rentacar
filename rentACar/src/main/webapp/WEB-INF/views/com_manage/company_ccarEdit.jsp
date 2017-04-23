<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery(".Yn").click(function(){
			if(jQuery('#ccarUseYn').is(":checked")){
				jQuery(this).val('Y');
			}else if(jQuery('#ccarBlackboxYn').is(":checked")){
				jQuery(this).val('Y');
			}else if(jQuery('#ccarSmokeYn').is(":checked")){
				jQuery(this).val('Y');
			}else if(jQuery('#ccarRearCameraYn').is(":checked")){
				jQuery(this).val('Y');
			}else if(jQuery('#ccarRearSenceYn').is(":checked")){
				jQuery(this).val('Y');
			}else if(jQuery('#ccarNaviYn').is(":checked")){
				jQuery(this).val('Y');
			}else if(jQuery('#ccarSunRoofYn').is(":checked")){
				jQuery(this).val('Y');
			}else if(jQuery('#ccarBluetoothYn').is(":checked")){
				jQuery(this).val('Y');
			}else if(jQuery('#ccarSmartkeyYn').is(":checked")){
				jQuery(this).val('Y');
			}
		});
		
	});
	
</script>
<!-- 차량 수정 하기  -->
<div class="divList container">
		<form class="form-horizontal" id="frmCo" method="post"
			action="<c:url value='/com_manage/company_ccarEdit.do'/>" >
			<fieldset>
			<legend>차량 정보 수정</legend>
				<div class="form-group">
					<label for="comId" class="col-sm-2 control-label">업체아이디</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="comId"
							id="comId" value="${map['COM_ID']}">
					</div>
				</div>
				
				<div class="form-group">
					<label for="ccarCarId" class="col-sm-2 control-label">차량번호</label>
					<div class="col-sm-2">
						<select class="form-control" name="area" id="area">
							<option>선택하세요</option>
							<option selected>서울</option>
							<option>경기</option>
							<option>인천</option>
							<option>대구</option>
							<option>대전</option>
							<option>부산</option>
							<option>제주</option>
							<option>강원</option>
							<option>광주</option>
							<option>울산</option>
							<option>충북</option>
							<option>충남</option>
							<option>전남</option>
							<option>전북</option>
							<option>경북</option>
							<option>경남</option>
								
						</select>
					</div>
					<div class="col-sm-2">
						<select class="form-control" name="secondCarNum" id="secondCarNum">
							<option>선택하세요</option>
							<option>하</option>
							<option selected>허</option>
							<option>호</option>
						</select>
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="ccarCarId"
							id="ccarCarId" placeholder="1234" value="${map['CCAR_CAR_ID'] }">
					</div>
				</div>
				
				<div class="form-group">
					<label for="carCode" class="col-sm-2 control-label">모델코드</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="carCode"
							id="carCode" value="${map['CAR_CODE'] }" disabled="true">
							아래 제조사car_INC, 모델명 선택car_name시 자동입력
					</div>
				</div>
				<div class="form-group">
					<label for="com1" class="col-sm-2 control-label">제조사</label>
					<div class="col-xs-2">
						<select class="form-control" name="carInc" id="carInc">
							<option selected>선택하세요</option>
							<c:forEach var="s" items="${slist }">
							<option value="${s.carInc }">${s.carInc }</option>
							</c:forEach>
						</select>
						
					</div>
				</div>
				<div class="form-group">
					<label for="com2" class="col-sm-2 control-label">모델명</label>
					<div class="col-xs-2">
						<select class="form-control" name="carName" id="carName">
							<option value="010">쏘나타</option>
							<option value="011">그렌져</option>
							<option value="016">아반떼</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div>
				</div>
				
	 
				<div class="form-group">
					<label for="ccarUseYn" class="col-sm-2 control-label">차량사용가능여부</label>
					<input type="checkbox" class = "Yn" name="ccarUseYn" id="ccarUseYn" value="${map['CCAR_USE_YN'] }"
					<c:if test="${map['CCAR_USE_YN']=='Y' }">checked</c:if>> 사용가능할경우 체크<br><br>
				</div>
				<div class="form-group">
					<label for="option" class="col-sm-2 control-label">옵션사항</label>
					<input type="checkbox" class = "Yn" name="ccarBlackboxYn" id="ccarBlackboxYn" value="${map['CCAR_BLACKBOX_YN'] }"
						<c:if test="${map['CCAR_BLACKBOX_YN']=='Y' }">checked</c:if>> 블랙박스
					<input type="checkbox" class = "Yn" name="ccarSmokeYn" id="ccarSmokeYn" value="${map['CCAR_SMOKE_YN'] }"
						<c:if test="${map['CCAR_SMOKE_YN']=='Y' }">checked</c:if>> 금연차
					<input type="checkbox" class = "Yn" name="ccarRearCameraYn" id="ccarRearCameraYn" value="${map['CCAR_REAR_CAMERA_YN'] }"
						<c:if test="${map['CCAR_REAR_CAMERA_YN']=='Y' }">checked</c:if>> 후방카메라 
					<input type="checkbox" class = "Yn" name="ccarRearSenceYn" id="ccarRearSenceYn" value="${map['CCAR_REAR_SENCE_YN'] }"
						<c:if test="${map['CCAR_REAR_SENCE_YN']=='Y' }">checked</c:if>> 후방센서 <br> 
					<input type="checkbox" class = "Yn" name="ccarNaviYn" id="ccarNaviYn" value="${map['CCAR_NAVI_YN'] }"
						<c:if test="${map['CCAR_NAVI_YN']=='Y' }">checked</c:if>> 네비게이션
					<input type="checkbox" class = "Yn" name="ccarSunRoofYn" id="ccarSunRoofYn" value="${map['CCAR_SUNROOF_YN'] }"
						<c:if test="${map['CCAR_SUN_ROOF_YN']=='Y' }">checked</c:if>> 썬루프
					<input type="checkbox" class = "Yn" name="ccarBluetoothYn" id="ccarBluetoothYn" value="${map['CCAR_BLUETOOTH_YN'] }"
						<c:if test="${map['CCAR_BLUETOOTH_YN']=='Y' }">checked</c:if>> 블루투스
					<input type="checkbox" class = "Yn" name="ccarAuxYn" id="ccarAuxYn" value="${map['CCAR_AUX_YN'] }"
						<c:if test="${map['CCAR_AUX_YN']=='Y' }">checked</c:if>> AUX
					<input type="checkbox" class = "Yn" name="ccarSmartkeyYn" id="ccarSmartkeyYn" value="${map['CCAR_SMARTKEY_YN'] }"
						<c:if test="${map['CCAR_SMARTKEY_YN']=='Y' }">checked</c:if>> 스마트키
			</div>
				<div class="form-group">
					<label for="ccarNormalPrice" class="col-sm-2 control-label">평일 예약가격</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="ccarNormalPrice"
							id="ccarNormalPrice" value="${map['CCAR_NORMAL_PRICE'] }">
					</div>
				</div>
				<div class="form-group">
					<label for="ccarWeekendPrice" class="col-sm-2 control-label">주말 예약가격</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="ccarWeekendPrice"
							id="ccarWeekendPrice" value="${map['CCAR_WEEKEND_PRICE'] }">
					</div>
				</div>
				<div class="form-group">
					<label for="ccarPeakPrice" class="col-sm-2 control-label">성수기 예약가격</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="ccarPeakPrice"
							id="ccarPeakPrice" value="${map['CCAR_PEAK_PRICE'] }">
					</div>
				</div>
				<div class="form-group">
					<label for="ccarSPeakPrice" class="col-sm-2 control-label">극성수기 예약가격</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="ccarSPeakPrice"
							id="ccarSPeakPrice" value="${map['CCAR_S_PEAK_PRICE'] }">
					</div>
				</div>
					<!-- 대여횟수 -->
					<input type="hidden" name="ccarRentalcount" id="ccarRentalcount" value="${map['CCAR_RENTALCOUNT'] }">
					<!-- 연체료 -->
					<input type="hidden" name="ccarArrear" id="ccarArrear" value="${map['CCAR_ARREAR'] }">
				<div class=form-group>
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-2">
							<button class="btn btn-primary btn-lg btn-block" id="btRegister">
								<i class="fa fa-registered" aria-hidden="true"> 수정하기</i>
							</button>
							<button class="btn btn-danger" id="btReset">
								<i class="fa fa-registered" aria-hidden="true"> 리셋</i>
							</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>



<%@ include file="../inc_company/company_bottom.jsp" %>