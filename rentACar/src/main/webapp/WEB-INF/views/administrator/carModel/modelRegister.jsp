<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#carCode").focus();

		$("#btCarModelRegister").click(function() {
			if ($("#carCode").val() == '') {
				alert('모델코드를 입력하세요');
				$("#carCode").focus();
				return false;
			} else if ($("#carName").val() == '') {
				alert('모델명을 입력하세요.');
				$("#carName").focus();
				return false;
			} else if ($("#carInc").val() == '') {
				alert('제조사 입력하세요.');
				$("#carInc").focus();
				return false;
			} else if ($("#carTrans").val() == '') {
				alert('변속기를 입력하세요.');
				$("#carTrans").focus();
				return false;
			} else if ($("#carSize").val() == '') {
				alert('승차인원을 입력하세요.');
				$("#carSize").focus();
				return false;
			} else if ($("#carImg").val() == '') {
				alert('이미지을 선택해주세요.');
				return false;
			}
		});
	});
</script>

<style type="text/css">
.register {
	float: left;
	width: 100%;
	margin: 0 auto;
	text-align: center;
	display: inline-block;
}

#check {
	color: red;
	font-weight: bold;
	display: none;
}

.bodyClass {
	padding-top: 30px;
	width: 85%;
	padding-left: 40px;
}
</style>

<div class="bodyClass">
	<form class="form-horizontal" id="frm1" name="frm1" method="post"
		action='<c:url value="/administrator/carModel/modelRegister.do" />'>
		<legend>차량모델 등록</legend>
		<div class="form-group">
			<label for="carCode" class="col-sm-2 control-label">차량모델명</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="carCode" name="carCode"
					placeholder="차량모델명을 입력하세요.">
			</div>
			<div class="col-sm-2">
				<span id="check"></span>
			</div>
		</div>

		<div class="form-group">
			<label for="carName" class="col-sm-2 control-label"> 모델명 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carName" id="carName"
					placeholder="모델명">
			</div>
		</div>

		<div class="form-group">
			<label for="carInc" class="col-sm-2 control-label"> 제조사 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carInc" id="carInc"
					placeholder="제조사">
			</div>
		</div>

		<div class="form-group">
			<label for="carSize" class="col-sm-2 control-label"> 승차인원 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carSize" id="carSize"
					placeholder="승차인원">
			</div>
		</div>

		<div class="form-group">
			<label for="carTrans" class="col-sm-2 control-label"> 변속기 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carTrans"
					id="carTrans" placeholder="Car Trans">
			</div>
		</div>

		<div class="form-group">
			<label for="carType" class="col-sm-2 control-label"> 차량유형 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carType" id="carType"
					placeholder="차량유형">
			</div>
		</div>

		<div class="form-group">
			<label for="carImg" class="col-sm-2 control-label"> 차량 이미지 </label>
			<div class="col-sm-2">
				<input type="file" id="carImg" name="carImg" placeholder="차량 이미지">
			</div>
		</div>

		<div class=form-group>
			<label class="col-sm-2 control-label"></label>
			<div class="col-sm-8">
				<button type="submit" class="btn btn-primary btn-lg btn-block"
					id="btCarModelRegister">모델 등록</button>
			</div>
		</div>
	</form>
</div>
<%@ include file="../include/bottom.jsp"%>