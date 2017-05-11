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
		
		$("#carImg").change(function(str){
			if( $("#carImg").val() != "" ){
				var ext = $('#carImg').val().split('.').pop().toLowerCase();
				     if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
						 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
						 $("#carImg").val("");
						 return;
				     } else {
			            file = $('#carImg').prop("files")[0];
			            blobURL = window.URL.createObjectURL(file);
			            $('#image_preview1 img').attr('src', blobURL);
			            $('#image_preview1').slideDown();
				     }
			 }

		});
		
		$("#carImg2").change(function(str){
			if( $("#carImg2").val() != "" ){
				var ext = $('#carImg2').val().split('.').pop().toLowerCase();
				     if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
						 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
						 $("#carImg2").val("");
						 return;
				     } else {
			            file = $('#carImg2').prop("files")[0];
			            blobURL = window.URL.createObjectURL(file);
			            $('#image_preview2 img').attr('src', blobURL);
			            $('#image_preview2').slideDown();
				     }
			 }

		});
		
		$("#carImg3").change(function(str){
			if( $("#carImg3").val() != "" ){
				var ext = $('#carImg3').val().split('.').pop().toLowerCase();
				     if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
						 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
						 $("#carImg3").val("");
						 return;
				     } else {
			            file = $('#carImg3').prop("files")[0];
			            blobURL = window.URL.createObjectURL(file);
			            $('#image_preview3 img').attr('src', blobURL);
			            $('#image_preview3').slideDown();
				     }
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
			<label for="carImg" class="col-sm-2 control-label"> 차량 이미지1 </label>
			<div class="col-sm-2">
				<input type="file" id="carImg" name="carImg" placeholder="차량 이미지1">
			</div>
		</div>
		
		<div class="form-group">
			<label for="carImg2" class="col-sm-2 control-label"> 차량 이미지2 </label>
			<div class="col-sm-2">
				<input type="file" id="carImg2" name="carImg2" placeholder="차량 이미지2">
			</div>
		</div>
		
		<div class="form-group">
			<label for="carImg3" class="col-sm-2 control-label"> 차량 이미지3 </label>
			<div class="col-sm-2">
				<input type="file" id="carImg3" name="carImg3" placeholder="차량 이미지3">
			</div>
		</div>
		
		<div class="form-group">
			<label for="carImage" class="col-sm-2 control-label"></label>
			<div id="image_preview1" class="col-sm-1">
				<img id="carImage" src="#" style="width: 100px; height: 100px;" />
			</div>
			<div id="image_preview2" class="col-sm-1">
				<img id="carImage" src="#" style="width: 100px; height: 100px;"/>
			</div>
			<div id="image_preview3" class="col-sm-1">
				<img id="carImage" src="#" style="width: 100px; height: 100px;"/>
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