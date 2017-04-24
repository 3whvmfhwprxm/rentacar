<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	
		$("#CompanyId").focus();
		
		$("#btCompanyRegister").click(function(){
			if(!validate_CompanyId($("#CompanyId").val())){
				alert('아이디는 영문대소문자, 숫자만 가능합니다');
				$("#CompanyId").focus();
				return false;
			}else if($("#CompanyId").val()==''){
				alert('아이디를 입력하세요.');
				$("#CompanyId").focus();
				return false;
			}else if($("#CompanyId").val().length<6){
				alert('아이디는 6글자 이상이어야합니다.');
				$("#CompanyId").focus();
				return false;
			}else if($("#CompanyName").val()==''){
				alert('업체명을 입력하세요');
				$("#CompanyName").focus();
				return false;
			}else if(!$("#CompanyPwd").val()){
				alert('비밀번호를 입력하세요');
				$("#CompanyPwd").focus();
				return false;
			}else if($("#CompanyPwd").val()!=$("#CompanyPwd2").val()){
				alert('비밀번호가 일치하지 않습니다');
				$("#CompanyPwd2").focus();
				return false;
			}else if($("#CompanyNo").val()==''){
				alert('사업자번호를 입력해야 합니다.');
				$('#CompanyNo').focus();
				return false;
			}else if($("#comAccNum").val()==''){
				alert('계좌번호를 입력해야 합니다.');
				$('#comAccNum').focus();
				return false;
			}else if($("#CompanyTel2").val()=='' || 
					$("#CompanyTel3").val()==''){
				alert('대표번호를 입력하세요.');
				$("#CompanyTel2").focus();
					return false;
			}else if(!validate_tel($("#CompanyTel2").val()) || 
					!validate_tel($("#CompanyTel3").val())){
				alert('대표번호는 숫자를 입력하셔야 합니다');
				$("#CompanyTel2").focus();
				return false;
			}else if($("#CompanyMobile2").val()=='' || 
					$("#CompanyMobile3").val()==''){
				alert('휴대폰번호를 입력하세요');
				$("#CompanyMobile2").focus();
				return false;
			}else if(!validate_mobile($("#CompanyMobile2").val()) || 
					!validate_mobile($("#CompanyMobile3").val())){
				alert('휴대폰번호는 숫자를 입력하셔야 합니다');
				$("#CompanyMobile2").focus();
				return false;
			}else if($("#CompanyFax2").val()=='' || 
					$("#CompanyFax3").val()==''){
				alert('팩스번호를 입력하세요');
				$("#CompanyFax1").focus();
				return false;
			}else if(!validate_fax($("#CompanyFax2").val()) || 
					!validate_fax($("#CompanyFax3").val())){
				alert('팩스번호는 숫자를 입력하셔야 합니다');
				$("#CompanyFax1").focus();
				return false;
			}else if($("#CompanyAddress").val()==''){
				alert('회사주소를 입력하세요');
				$("#CompanyAddress").focus();
				return false;
			}else if($("#CompanyCeo").val()==''){
				alert('대표자를 입력하세요');
				$("#CompanyCeo").focus();
				return false;
			}
		});
		
		
		$("#CompanyId").keyup(function(){
			if(!validate_CompanyId($("#CompanyId").val())){
				$("#check").html('아이디는 영문이나 숫자만 입력하셔야 합니다.');
				$("#check").show();
			}else if($("#CompanyId").val()==''){
				$("#check").html('아이디를 입력하세요');
				$("#chkId").val("");
				$("#check").show();
			}else if($("#CompanyId").val().length<6){
				$("#check").html('아이디는 6글자 이상이어야합니다.');
				$("#chkId").val("");
				$("#check").show();
			}else{
				$.ajax({
					url:'<c:url value="/administrator/company/CheckCompanyId.do" />',
					type:'post',
					data:'CompanyId='+$("#CompanyId").val(),
					dataType:'json',
					success:function(res){
						var msg = "";
						var chkId = "";
						
						if(res){
							//아이디가 이미 존재
							msg = "해당 아이디가 이미 존재합니다.";
						}else{
							msg = "해당 아이디 사용가능";
							chkId = "Y";
						}
						$("#check").html(msg);
						$("#chkId").val(chkId);
						$("#check").show();
					},
					error:function(xhr, status, error){
						alert("error: "+error);
					}
				});
			}
		});
		
		var panels = $('.user-infos');
		var panelsButton = $('.dropdown-user');
		panels.hide();
		panelsButton.click(function() {
			var dataFor = $(this).attr('data-for');
			var idFor = $(dataFor);
			var currentButton = $(this);
			idFor.slideToggle(400, function() {
				if (idFor.is(':visible')) {
					currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
				} else {
					currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
				}
			})
		});
		$('[data-toggle="tooltip"]').tooltip();
	});
		
	function validate_CompanyId(CompanyId){
		var pattern = new RegExp(/^[a-zA-Z0-9]*$/g);
		return pattern.test(CompanyId);		
	}
	function validate_tel(tel){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
	}
	
	function validate_mobile(mobile){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(mobile);
	}
	
	function validate_fax(fax){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(fax);
	}
	
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
	action='<c:url value="/administrator/company/companyRegister.do" />'>
	<fieldset>
	<legend>Register</legend>
		<div class="form-group">
			<label for="CompanyId" class="col-sm-2 control-label">
				Company Id </label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="comId"
					id="CompanyId" placeholder="Company Id">		
				
			</div>
			<div class="col-sm-4">
				<span id="check"></span>
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyName" class="col-sm-2 control-label">
				Company Name
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comName"
					id="CompanyName" placeholder="Company Name">
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyPwd" class="col-sm-2 control-label">
				Company Password
			</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" name="comPwd"
					id="CompanyPwd" placeholder="Company Password">
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyPwd" class="col-sm-2 control-label">
				Password Check
			</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" name="comPwd2"
					id="CompanyPwd2" placeholder="Check Company Password">
			</div>
		</div>
		<div class="form-group">
			<label for="CompanyNo" class="col-sm-2 control-label">
				Company No
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comNum"
					id="CompanyNo" placeholder="Company No">
			</div>
		</div>
		
		<div class="form-group">
			<label for="comAccNum" class="col-sm-2 control-label">
				Company Account
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comAccNum"
					id="comAccNum" placeholder="Company Account">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">
				Company Tel
			</label>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="comTel1"
					id="CompanyTel1" maxlength="4" placeholder="Company Tel1">
			</div>
			
			<div class="col-xs-2">
				<input class="form-control" type="text" name="comTel2"
					id="CompanyTel2" maxlength="4" placeholder="Company Tel2">
			</div>
			
			<div class="col-xs-2">
				<input class="form-control" type="text" name="comTel3"
					id="CompanyTel3" maxlength="4" placeholder="Company Tel3">
			</div>
		</div>
		<div class="form-group">
			<label for="CompanyMobile11" class="col-sm-2 control-label">
				Company Mobile
			</label>
			<div class="col-xs-2">
				<select class="form-control" id="comMobile1" name="comMobile1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="comMobile2"
					id="CompanyMobile2" placeholder="Company Mobile2">
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="comMobile3"
					id="CompanyMobile3" placeholder="Company Mobile3">
			</div>
		</div>
		<div class="form-group">
			<label for="CompanyFax" class="col-sm-2 control-label">
				Company Fax
			</label>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="comFax1"
					id="CompanyFax1" placeholder="Company Fax1">
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="comFax2"
					id="CompanyFax2" placeholder="Company Fax2">
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="comFax3"
					id="CompanyFax3" placeholder="Company Fax3">
			</div>
		</div>
		<div class="form-group">
			<label for="CompanyAddress" class="col-sm-2 control-label">
				Company Address
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comAddress"
					id="CompanyAddress" placeholder="Company Address">
			</div>
		</div>
		<div class="form-group">
			<label for="CompanyCeo" class="col-sm-2 control-label">
				Company Ceo
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comCeo"
					id="CompanyCeo" placeholder="Company Ceo">
			</div>
		</div>
		<div class="form-group">
			<label for="CompanyEmail" class="col-sm-2 control-label">
				Company Email</label>
			<div class="col-md-8">
				<input type="email" class="form-control" name="comEmail"
					id="CompanyEmail" placeholder="Company Email">
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyLogo" class="col-sm-2 control-label">
				Company Logo
			</label>
			<div class="col-sm-2">
				<input type="file" id="CompanyLogo" name="comLogo"
					placeholder="file">	
			</div>
		</div>
		
		<div class=form-group>
			<label class="col-sm-2 control-label"></label>
			<div class="col-sm-8">
				<button type="submit" class="btn btn-primary btn-lg btn-block" id="btCompanyRegister">
					Register
				</button>
			</div>
		</div>
	</fieldset>
</form>
<%@ include file="../include/bottom.jsp"%>