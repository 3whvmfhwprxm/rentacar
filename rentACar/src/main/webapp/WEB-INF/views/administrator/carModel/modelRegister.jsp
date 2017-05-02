<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#carCode").focus();
		
		$("#btCarModelRegister").click(function(){
			if($("#carCode").val()==''){
				alert('모델코드를 입력하세요');
				$("#carCode").focus();
				return false;
			}else if($("#carName").val()==''){
				alert('모델명을 입력하세요.');
				$("#carName").focus();
				return false;
			}else if($("#carInc").val()==''){
				alert('제조사 입력하세요.');
				$("#carInc").focus();
				return false;
			}else if($("#carFuel").val()==''){
				alert('연료 종류를 입력하세요.');
				$("#carFuel").focus();
				return false;
			}else if($("#carSize").val()==''){
				alert('승차인원을 입력하세요.');
				$("#carSize").focus();
				return false;
			}else if($("#carImg").val()==''){
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
	
	#check{
		color: red;
		font-weight: bold;
		display: none;
	}
</style>

<div class="w3-row-padding w3-margin-bottom">
	<form class="form-horizontal" id="frm1" name="frm1" method="post"
		action='<c:url value="/administrator/carModel/modelRegister.do" />'>
		<h3>차량모델 등록</h3>
		<hr>
		<div class="form-group">
		    <label for="carCode" class="col-sm-2">차량모델명</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="carCode" name="carCode" placeholder="차량모델명을 입력하세요.">
		    </div>
		    <div class="col-sm-2">
		    	<span id="check"></span>
		    </div>
	 	</div>
	
		<div class="form-group">
			<label for="carName" class="col-sm-2">
				Car Name
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carName"
					id="carName" placeholder="car Name">
			</div>
		</div>
		
		<div class="form-group">
			<label for="carInc" class="col-sm-2">
				Car Inc
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carInc"
					id="carInc" placeholder="car Inc">
			</div>
		</div>
		
		<div class="form-group">
			<label for="carSize" class="col-sm-2">
				Car Size
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carSize"
					id="carSize" placeholder="car Size">
			</div>
		</div>
		
		<div class="form-group">
			<label for="carTrans" class="col-sm-2">
				Car Trans
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carTrans"
					id="carTrans" placeholder="Car Trans">
			</div>
		</div>
		
		<div class="form-group">
			<label for="carType" class="col-sm-2">
				Car Type
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carType"
					id="carType" placeholder="Car Type">
			</div>
		</div>
						
		<div class="form-group">
			<label for="carImg" class="col-sm-2">
				Car Img
			</label>
			<div class="col-sm-2">
				<input type="file" id="carImg" name="carImg"
					placeholder="file">	
			</div>
		</div>
		
		<div class=form-group>
			<label class="col-sm-2 control-label"></label>
			<div class="col-sm-8">
				<button type="submit" class="btn btn-primary btn-lg btn-block" id="btCarModelRegister">
					Register
				</button>
			</div>
		</div>
	</form>
</div>
<%@ include file="../include/bottom.jsp"%>