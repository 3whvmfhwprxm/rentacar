<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$().ready(function(){
		$("input[name=insertUserInfo]").click(function(){
			$.setReservInfo();
		});
		
		$("input[name=insertDrvInfo]").click(function(){
			$.setDrvInfo();
		});
		
		$("#resDrvBirth").datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	yearRange: "1900:2020" ,
	    	changeYear: true,
	    	changeMonth: true
	    });
		
		$("#insertReservInfo").submit(function(){
			if($("#resUName").val()==''){
				alert("예약자 이름을 입력해주세요");
				$("#resUName").focus();
				return false;
			}else if($("#resUMail").val()==''){
				alert("예약자 이메일을 입력해주세요");
				$("#resUMail").focus();
				return false;
			}else if($("#resUTel2").val()=='' || $("#resUTel3").val()==''){
				alert("예약자 전화번호를 입력해주세요");
				$("#resUTel3").focus();
				return false;
			}else if($("#resDrvName").val()==''){
				alert("운전자 이름을 입력해주세요");
				$("#resDrvName").focus();
				return false;
			}else if($("#resDrvTel2").val()=='' || $("#resDrvTel3").val()==''){
				alert("운전자 전화번호를 입력해주세요");
				$("#resDrvTel3").focus();
				return false;
			}else if($("#resDrvBirth").val()==''){
				alert("운전자 생년월일을 입력해주세요");
				$("#resDrvBirth").focus();
				return false;
			} 
		});
	});
	
	$.setReservInfo=function(){
		if($("#insertUserInfo2").is(":checked")){
			//기존 회원 정보 입력을 선택
			$("#resUName").val("${uvo.userName}");
			$("#resUMail").val("${uvo.userEmail}");
			$("#resUTel1").val("${uvo.userTel1}");
			$("#resUTel2").val("${uvo.userTel2}");
			$("#resUTel3").val("${uvo.userTel3}");
			
		}else{
			//직접 입력을 선택
			$("#resUName").val("");
			$("#resUMail").val("");
			$("#resUTel1").val("010");
			$("#resUTel2").val("");
			$("#resUTel3").val("");
		}
	}
	
	$.setDrvInfo=function(){
		if($("#insertDrvInfo2").is(":checked")){
			//기존 회원 정보 입력을 선택
			$("#resDrvName").val("${uvo.userName}");
			$("#resDrvCategory").val("${uvo.userLicense}");
			$("#resDrvTel1").val("${uvo.userTel1}");
			$("#resDrvTel2").val("${uvo.userTel2}");
			$("#resDrvTel3").val("${uvo.userTel3}");
			$("#resDrvBirth").val("${uvo.userBirth}");
			
		}else{
			//직접 입력을 선택
			$("#resDrvName").val("");
			$("#resDrvCategory").val("");
			$("#resDrvTel1").val("010");
			$("#resDrvTel2").val("");
			$("#resDrvTel3").val("");
			$("#resDrvBirth").val("");
		}
	}
</script>
<style type="text/css">
	.fontStyle1{color: #0033FF; font-weight: bold;}
</style>
<div class="container">
	<br>
	<form class="form-horizontal" name="insertReservInfo" id="insertReservInfo" method="post" action="<c:url value='/inc_user/reservation.do' />">
		<fieldset>
			<legend>예약자 정보 입력</legend>
		<!-- 선택한 기간 정보 -->
		<h4>예약하신 내용</h4>
		<div class="form-group">
				<span class="fontStyle1">선택하신 예약 기간: ${param.searchStartDate} ${param.startHour}:${param.startMin} 
				~ ${param.searchEndDate} ${param.endHour}:${param.endMin}</span>
				<!-- 테스트 끝나면 hidden으로 재 설정 -->
				<input type="hidden" name="searchStartDate" value="${param.searchStartDate}">
				<input type="hidden" name="startHour" value="${param.startHour}">
				<input type="hidden" name="startMin" value="${param.startMin}">
				<input type="hidden" name="searchEndDate" value="${param.searchEndDate}">
				<input type="hidden" name="endHour" value="${param.endHour}">
				<input type="hidden" name="endMin" value="${param.endMin}">
				<input type="hidden" name="ccarCarId" value="${car.ccarCarId }">	
		</div>
		
		<!-- 선택한 차에 대한 정보 -->
		<div class="form-group">
			<p>선택한 차 ID: ${car.ccarCarId }</p>
			<p>선택한 차 모델: ${car.carCode }</p>			
			<p>블랙박스 유무: ${car.ccarBlackboxYn }</p>
			<p>흡연 가능여부: ${car.ccarSmokeYn }</p>
			<p>후방카메라 유무: ${car.ccarRearCameraYn }</p>
			<p>...등</p>
		</div>
		
		<!-- 예약자 및 운전자 입력 정보 -->
		<h4>예약자 정보 입력</h4>
		<p>
			<input type="radio" name="insertUserInfo" id="insertUserInfo1" checked>
			<label for="insertUserInfo1">직접 입력</label>
						
			<input type="radio" name="insertUserInfo" id="insertUserInfo2"> 
			<label for="insertUserInfo2">회원과 동일 정보 입력</label>			
		</p>
		<div class="form-group">			
			<label class="col-sm-2 control-label">예약자 이름</label>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resUName" id="resUName">
			</div>
		</div>
		<div class="form-group">			
			<label class="col-sm-2 control-label">이메일</label>
			<div class="col-xs-2">
				<input class="form-control" type="email" name="resUMail" id="resUMail">
			</div>
		</div>
		<div class="form-group">			
			<label class="col-sm-2 control-label">연락처</label>
			<div class="col-xs-2">
				<select class="form-control" name="resUTel1" id="resUTel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select>			
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resUTel2" id="resUTel2">
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resUTel3" id="resUTel3">
			</div>
		</div>
		<br>
		
		<h4>운전자 정보 입력</h4>
		<p>			
			<input type="radio" name="insertDrvInfo" id="insertDrvInfo1" checked>
			<label for="insertDrvInfo1">직접 입력</label>
						
			<input type="radio" name="insertDrvInfo" id="insertDrvInfo2"> 
			<label for="insertDrvInfo2">회원과 동일 정보 입력</label>			
		</p>
		<div class="form-group">			
			<label class="col-sm-2 control-label">운전자 이름</label>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resDrvName" id="resDrvName">
			</div>
		</div>
		<div class="form-group">			
			<label class="col-sm-2 control-label">면허증</label>
			<div class="col-xs-2">
				<select class="form-control" id="resDrvCategory" name="resDrvCategory" >	           			
	           			<option value="1종 보통">1종 보통</option>
	           			<option value="1종 소형">1종 소형</option>
	           			<option value="1종 대형">1종 대형</option>
	           			<option value="1종 특수">1종 특수</option>
	           			<option value="2종 보통">2종 보통</option>
	           			<option value="2종 소형">2종 소형</option>
	           	</select>
			</div>
		</div>
		<div class="form-group">			
			<label class="col-sm-2 control-label">연락처</label>
			<div class="col-xs-2">
				<select class="form-control" name="resDrvTel1" id="resDrvTel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select>			
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resDrvTel2" id="resDrvTel2">
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resDrvTel3" id="resDrvTel3">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">생년월일</label>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resDrvBirth" id="resDrvBirth">
			</div>
		</div>
		
		<div class=form-group>
			<label class="col-sm-2 control-label"></label>		
			<div class="col-sm-6">
				<input class="btn btn-primary btn-lg btn-block" type="submit" value="예약하기" name="btsubmit" id="btsubmit" >
			</div>
		</div>	
		</fieldset>
	</form>
	<br>
	<br>
</div>
<%@ include file="bottom.jsp"%>