<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {		
		$("#btCompanyRegister").click(function(){
			if(!$("#CompanyPwd").val()){
				alert('비밀번호를 입력하세요');
				$("#CompanyPwd").focus();
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

<form class="form-horizontal" id="frm1" name="frm1" method="post"
	action='<c:url value="/administrator/company/companyEdit.do" />'>
	<fieldset>
	<legend>CarModel Edit</legend>
		<div class="form-group">
			<label for="carCode" class="col-sm-2 control-label">
				Car Code </label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="carCode"
					id="carCode" value="${carVo.carCode}">		
			</div>
		</div>
		
		<div class="form-group">
			<label for="carName" class="col-sm-2 control-label">
				Car Name
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carName"
					id="carName" value="${carVo.carName}">
			</div>
		</div>
		
		<div class="form-group">
			<label for="carInc" class="col-sm-2 control-label">
				Car Inc
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carInc"
					id="carInc" value="${carVo.carInc}">
			</div>
		</div>
		
		<div class="form-group">
			<label for="carSize" class="col-sm-2 control-label">
				Car Size
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carSize"
					id="carSize" value="${carVo.carSize}">
			</div>
		</div>
		
		<div class="form-group">
			<label for="carTrans" class="col-sm-2 control-label">
				Car Trans
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carTrans"
					id="carTrans" value="${carVo.carTrans}">
			</div>
		</div>
		
		<div class="form-group">
			<label for="carType" class="col-sm-2 control-label">
				Car Type
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="carType"
					id="carType" value="${carVo.carType}">
			</div>
		</div>
		
		<div class="form-group">
			<label for="carImg" class="col-sm-2 control-label">
				Car Img
			</label>
			<div class="col-sm-2">
				<input type="text" id="carImg" name="carImg"
					value="${carVo.carImg}">	
				<input type="file" id="carImg" name="carImg">	
			</div>
		</div>
		
		<div class="center">
			<button type="submit" class="btn btn-default">
				<i class="fa fa-pencil-square-o" aria-hidden="true"></i>수정
			</button>
			
            <a href='<c:url value="/administrator/carModel/modelList.do" />'
				type="button" class="btn btn-default"> 
				<i class="fa fa-list-ul" aria-hidden="true"></i>목록
			</a>
        </div>
	</fieldset>
</form>
<%@ include file="../include/bottom.jsp"%>