<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	
		$("#name").focus();
		
		$("#btRegister").click(function(){
			if(!validate_CompanyId($("#CompanyId").val())){
				alert('아이디는 영문대소문자, 숫자만 가능합니다');
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
			}else if($("#chkCompanyId").val()!='Y'){
				alert('아이디 중복검사를 해야 합니다.');
				$('#chkCompanyId').focus();
				return false;
			}else if($("#comAccNum").val()!='Y'){
				alert('계좌번호를 입력해야 합니다.');
				$('#comAccNum').focus();
				return false;
			}else if(!validate_tel($("#CompanyTel2").val()) || 
					!validate_tel($("#CompanyTel3").val())){
				alert('대표번호는 숫자를 입력하셔야 합니다');
				$("#CompanyTel2").focus();
				return false;
			}else if(!validate_mobile($("#CompanyMobile2").val()) || 
					!validate_mobile($("#CompanyMobile3").val())){
				alert('휴대폰은 숫자를 입력하셔야 합니다');
				$("#CompanyMobile2").focus();
				return false;
			}else if(!validate_fax($("#CompanyFax2").val()) || 
					!validate_fax($("#CompanyFax3").val())){
				alert('팩스번호는 숫자를 입력하셔야 합니다');
				$("#CompanyFax2").focus();
				return false;
			}else if($("#CompanyAddress").val()==''){
				alert('회사주소를 입력하세요');
				$("#CompanyAddress").focus();
				return false;
			}else if($("#CompanyCeo").val()==''){
				alert('대표자를 입력하세요');
				$("#CompanyCeo").focus();
				return false;
			}else if($("#CompanyEmail1").val()==''){
				alert('이메일을 입력하세요');
				$("#CompanyEmail1").focus();
				return false;
			}
		});
		
		$("#CompanyEmail2").change(function(){
			if($("#CompanyEmail2").val()=="etc"){
				$('#CompanyEmail3').css("visibility","visible");
				$("#CompanyEmail3").val("");
				$("#CompanyEmail3").focus();
			}else{
				$('#CompanyEmail3').css("visibility","hidden");
			}
		});
		
		$("#btnChkId").click(function(){	
			if(!validate_CompanyId($("#CompanyId").val())){
				alert('아이디는 영문대소문자, 숫자만 가능합니다');
				$("#CompanyId").focus();
				return false;
			}
			
			window.open("<c:url value='/administrator/company/checkCompanyId.do?CompanyId="+$("#CompanyId").val()+"'/>",'chk',
			'width=400,height=300,left=10,top=10,location=yes,resizable=yes');
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
		var pattern = new RegExp(/^[a-zA-Z0-9]+$/g);
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
</style>
<title>CompanyRegister</title>
<body>
	<div class="divList container">
		<form class="form-horizontal" id="frm1" name="frm1" method="post"
			action='<c:url value="/administrator/company/companyRegister.do" />'>
			<fieldset>
			<legend>Register</legend>
				<div class="form-group">
					<label for="CompanyId" class="col-sm-2 control-label">
						Company Id </label>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="CompanyId"
							id="CompanyId" placeholder="Company Id">
						<input type="button" value="중복확인" id="btnChkId" title="새창열림">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyName" class="col-sm-2 control-label">
						Company Name
					</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="CompanyName"
							id="CompanyName" placeholder="Company Name">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyPwd" class="col-sm-2 control-label">
						Company Password
					</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="CompanyPwd"
							id="CompanyPwd" placeholder="Company Password">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyPwd" class="col-sm-2 control-label">Password
						Check</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="CompanyPwd2"
							id="CompanyPwd2" placeholder="Company CompanyPwd2">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyNo" class="col-sm-2 control-label">Company
						No</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="CompanyNo"
							id="CompanyNo" placeholder="Company No">
					</div>
				</div>
				<div class="form-group">
					<label for="comAccNum" class="col-sm-2 control-label">Company
						Account</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="comAccNum"
							id="comAccNum" placeholder="Company Account">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyTel1" class="col-sm-2 control-label">Company
						Tel</label>
					<div class="col-xs-2">
						<select class="form-control" name="CompanyTel1" id="CompanyTel1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div>
					<div class="col-xs-2">
						<input class="form-control" type="text" name="CompanyTel2"
							id="CompanyTel2" maxlength="4" placeholder="Company Tel2">
					</div>
					<div class="col-xs-2">
						<input class="form-control" type="text" name="CompanyTel3"
							id="CompanyTel3" maxlength="4" placeholder="Company Tel3">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyMobile" class="col-sm-2 control-label">Company
						Mobile</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyMobile1"
							id="CompanyMobile1" placeholder="Company Mobile1">
					</div>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyMobile2"
							id="CompanyMobile2" placeholder="Company Mobile2">
					</div>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyMobile3"
							id="CompanyMobile3" placeholder="Company Mobile3">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyFax" class="col-sm-2 control-label">Company
						Fax</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyFax1"
							id="CompanyFax1" placeholder="Company Fax1">
					</div>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyFax2"
							id="CompanyFax2" placeholder="Company Fax2">
					</div>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyFax3"
							id="CompanyFax3" placeholder="Company Fax3">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyAddress" class="col-sm-2 control-label">Company
						Address</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="CompanyAddress"
							id="CompanyAddress" placeholder="Company Address">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyCeo" class="col-sm-2 control-label">Company
						Ceo</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="CompanyCeo"
							id="CompanyCeo" placeholder="Company Ceo">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyEmail" class="col-sm-2 control-label">Company
						Email</label>
					<div class="col-md-3">
						<input type="email" class="form-control" name="CompanyEmail1"
							id="CompanyEmail1" placeholder="Company Email1">
					</div>
					<div class="col-xs-2">
						<select class="form-control" name="CompanyEmail2"
							id="CompanyEmail2">
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="etc">직접입력</option>
						</select>
					</div>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyEmail3"
							id="CompanyEmail3" placeholder="Company Email3"
							style="visibility: hidden">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyLogo" class="col-sm-2 control-label">
					Company Logo
					</label>
					<div class="col-sm-2">
						<input type="file" name="CompanyLogo" id="CompanyLogo"
							placeholder="file">	
					</div>
				</div>
				<div class=form-group>
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-8">
							<button class="btn btn-primary btn-lg btn-block" id="btRegister">
								<i class="fa fa-registered" aria-hidden="true"> Register</i>
							</button>
					</div>
				</div>
			</fieldset>
			<input type ="text" name="chkId" id="chkId">
		</form>
	</div>
</body>
</html>