<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp"%>
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
		
		jQuery("#btRegister").click(function(){
			if(!jQuery("#comId").val()){
				alert("업체아이디를 입력에러, 로그인처리가 정상적으로 되지 않았습니다.");
				jQuery("#comId").focus();
				return false;
			}else if(!jQuery('#carCode').val()){
				alert("모델코드가 입력되지않았습니다. 제조사,모델명을 선택해주세요.");
				jQuery("#carCode").focus();
				return false;
			}else if(!jQuery('#ccarCarId').val() || jQuery('#ccarCarId').val().length!=4){
				alert("차량 차대번호를 입력하세요. 4자리 입니다.");
				jQuery("#ccarCarId").focus();
				return false;
			}else if(!jQuery('#ccarNormalPrice').val()){
				alert("차량 렌탈 평일 가격을 입력하세요.");
				jQuery("#ccarNormalPrice").focus();
				return false;
			}else if(!jQuery('#ccarWeekendPrice').val()){
				alert("차량 렌탈 주말 가격을 입력하세요.");
				jQuery("#ccarWeekendPrice").focus();
				return false;
			}else if(!jQuery('#ccarPeakPrice').val()){
				alert("차량 렌탈 성수기 가격을 입력하세요.");
				jQuery("#ccarPeakPrice").focus();
				return false;
			}else if(!jQuery('#ccarSPeakPrice').val()){
				alert("차량 렌탈 극 성수기 가격을 입력하세요.");
				jQuery("#ccarSPeakPrice").focus();
				return false;
			}
		
		});
		
		var areaNm = jQuery("#area").val(); 
		var carMiddleNm = jQuery("#carMiddelNum").val();
		var carLastNm = jQuery("#ccarCarId").val();
		var carNo = areaNm+carMiddleNm+carLastNm;
		//차량번호 중복확인 - ajax 방식으로
		$("#userid").keyup(function(){
			if($("#ccarCarId").val().length<3){
				//유효성 검사를 통과하지 못한경우
				$("#error").html('4자리 이상이어야 합니다.');
				$("chkCarId").val("");
				$("#error").show();
			}else{
				//유효성 검사를 통과하면 아이디 중복검사한다.
				$.ajax({
					url:'<c:url value="/com_manage/checkCarId.do" />',
					type:'post',
					data:'ccarCarId'= CarNo,
					success:function(res){
						var msg="";
						var chkId="";
						if(res){
							//차량번호 존재
							msg="해당 차대번호는 이미 존재합니다!";
						}else{
							msg="해당 차대번호 사용 가능합니다!"
							chkId="Y";
						}
						$("#error").html(msg);
						$("#chkCarId").val(chkId);
						$("#error").show();
					},
					error:function(xhr, status, error){
						alert("error:"+error)
					}
				});
			}
			
			
		});
	});
	
	
	
</script>
<style type="text/css">
	#error{
		color: red;
		font-weight: bold;
		display: none;
	}	

</style>
<div class="divList container">
		<form class="form-horizontal" id="frmRg" method="post"
			action="<c:url value='/com_manage/company_optionRegist.do'/>">
			<fieldset>
			<legend>차량 등록</legend>
				<div class="form-group">
					<label for="comId" class="col-sm-2 control-label">업체아이디</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="comId"
							id="comId" placeholder="로그인시 자동입력">
					</div>
				</div>
				<div class="form-group">
					<label for="carCode" class="col-sm-2 control-label">모델코드</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="carCode"
							id="carCode" placeholder="제조사,모델명 선택시 자동입력">
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
					<label for="ccarCarId" class="col-sm-2 control-label">차량번호</label>
					<div class="col-sm-2">
						<select class="form-control" name="area" id="area">
							<option>선택하세요</option>
							<option value="서울" selected>서울</option>
							<option value="경기" >경기</option>
							<option value="인천" >인천</option>
							<option value="대구" >대구</option>
							<option value="대전" >대전</option>
							<option value="부산" >부산</option>
							<option value="제주" >제주</option>
							<option value="강원" >강원</option>
							<option value="광주" >광주</option>
							<option value="울산" >울산</option>
							<option value="충북" >충북</option>
							<option value="충남" >충남</option>
							<option value="전남" >전남</option>
							<option value="전북" >전북</option>
							<option value="경북" >경북</option>
							<option value="경남" >경남</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select class="form-control" name="carMiddleNum" id="carMiddleNum">
							<option>선택하세요</option>
							<option value="하">하</option>
							<option value="허" selected>허</option>
							<option value="호">호</option>
						</select>
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="ccarCarId"
							id="ccarCarId" placeholder="1234">
						<span id="error"></span>
						<input type="text" name="chkCarId" id="chkCarId">
					</div>
				</div>
				<div class="form-group">
					<label for="ccarUseYn" class="col-sm-2 control-label">차량사용가능여부</label>
					<input type="checkbox" class = "Yn" name="ccarUseYn" id="ccarUseYn" value="N">사용가능할경우 체크
				</div>
				<div class="form-group">
					<label for="option" class="col-sm-2 control-label">옵션등록</label>
					<input type="checkbox" class="Yn" name="ccarBlackboxYn" id="ccarBlackboxYn">블랙박스
					<input type="checkbox" class = "Yn" name="ccarSmartkeyYn" id="ccarSmartkeyYn">스마트키
					<input type="checkbox" class = "Yn" name="ccarSmokeYn" id="ccarSmokeYn">금연차
					<input type="checkbox" class = "Yn" name="ccarRearCameraYn" id="ccarRearCameraYn">후방카메라
					<input type="checkbox" class = "Yn" name="ccarRearSenceYn" id="ccarRearSenceYn">후방센서 <br>
					<input type="checkbox" class = "Yn" name="ccarNaviYn" id="ccarNaviYn">네비게이션 
					<input type="checkbox" class = "Yn" name="ccarSunRoofYn" id="ccarSunRoofYn">썬루프 
					<input type="checkbox" class = "Yn" name="ccarBluetoothYn" id="ccarBluetoothYn">블루투스 
					<input type="checkbox" class = "Yn" name="ccarAuxYn" id="ccarAuxYn">AUX <br>
				</div>
				<div class="form-group">
					<label for="ccarNormalPrice" class="col-sm-2 control-label">평일 예약가격</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="ccarNormalPrice"
							id="ccarNormalPrice" placeholder="50000">
					</div>
				</div>
				<div class="form-group">
					<label for="ccarWeekendPrice" class="col-sm-2 control-label">주말 예약가격</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="ccarWeekendPrice"
							id="ccarWeekendPrice" placeholder="70000">
					</div>
				</div>
				<div class="form-group">
					<label for="ccarPeakPrice" class="col-sm-2 control-label">성수기 예약가격</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="ccarPeakPrice"
							id="ccarPeakPrice" placeholder="100000">
					</div>
				</div>
				<div class="form-group">
					<label for="ccarSPeakPrice" class="col-sm-2 control-label">극성수기 예약가격</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="ccarSPeakPrice"
							id="ccarSPeakPrice" placeholder="150000">
					</div>
				</div>
					<!-- 대여횟수 -->
					<input type="hidden" name="ccarRentalcount" id="ccarRentalcount" value="0">
					<!-- 연체료 -->
					<input type="hidden" name="ccarArrear" id="ccarArrear" value="0">
				<div class=form-group>
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-2">
							<button class="btn btn-primary btn-lg btn-block" id="btRegister">
								<i class="fa fa-registered" aria-hidden="true"> 등록하기</i>
							</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>





















<br>
<br>
<br>
<hr>
<%@ include file="../inc_company/company_bottom.jsp"%>