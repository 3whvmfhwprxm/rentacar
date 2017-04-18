<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src='<c:url value="/jquery/jquery-3.1.1.min.js"/>'>
</script>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script type="text/javascript" src='<c:url value="/js/member.js" />'></script>

<script type="text/javascript">
	$(document).ready(function() {
		var panels = $('.user-infos');
		var panelsButton = $('.dropdown-user');
		panels.hide();

		//Click dropdown
		panelsButton.click(function() {
			//get data-for attribute
			var dataFor = $(this).attr('data-for');
			var idFor = $(dataFor);

			//current button
			var currentButton = $(this);
			idFor.slideToggle(400, function() {
				//Completed slidetoggle
				if (idFor.is(':visible')) {
					currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
				} else {
					currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
				}
			})
		});

		$('[data-toggle="tooltip"]').tooltip();

		$('button').click(function(e) {
			e.preventDefault();
			alert("This is a demo.\n :-)");
		});
	
		$("#name").focus();
		
		$("#frm1").submit(function(){
			
			if(!validate_userid($("#CompanyId").val())){
				alert('아이디는 영문대소문자, 숫자, 언더바만 가능합니다');
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
		
		$("#email2").change(function(){
			if($("#email2").val()=="etc"){
				$('#email3').css("visibility","visible");
				$("#email3").val("");
				$("#email3").focus();
			}else{
				$('#email3').css("visibility","hidden");
			}
		});
		
		$("#btnChkCompanyId").click(function(){
			window.open("<c:url value='/administrator/company/checkCompanyId.do?userid="+$("#CompanyId").val()+ "'/>", 'chk',
			'width=400,height=300,left=10,top=10,location=yes,resizable=yes');	
		});	
	});
	
	function validate_userid(userid){
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(userid);
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

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />

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
</head>
<body>
	<div class="divList container">
		<form class="form-horizontal" id="frm1" method="post"
			action='<c:url value="/administrator/company/companyRegister.do" />'>
			<fieldset>
			<legend>Register</legend>
			
			<div class="form-group">
				<label for="CompanyId" class="col-sm-2 control-label">Company Id</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="CompanyId" id="CompanyId"
						placeholder="Company Id">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyName" class="col-sm-2 control-label">Company Name</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="CompanyName" id="CompanyName"
						placeholder="Company Name">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyPwd" class="col-sm-2 control-label">Company Password</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" name="CompanyPwd" id="CompanyPwd"
						placeholder="Company Password">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyPwd" class="col-sm-2 control-label">Password Check</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" name="CompanyPwd2" id="CompanyPwd2"
						placeholder="Company CompanyPwd2">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyNo" class="col-sm-2 control-label">Company No</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="CompanyNo" id="CompanyNo"
						placeholder="Company No">
				</div>
			</div>
			<div class="form-group">
				<label for="comAccNum" class="col-sm-2 control-label">Company Account</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="comAccNum" id="comAccNum"
						placeholder="Company Account">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyTel1" class="col-sm-2 control-label">Company Tel</label>
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
					<input class="form-control" type="text" name="CompanyTel2" id="CompanyTel2"
						maxlength="4" placeholder="Company Tel2">
				</div>
				<div class="col-xs-2">
					<input class="form-control" type="text" name="CompanyTel3" id="CompanyTel3"
						maxlength="4" placeholder="Company Tel3">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyMobile" class="col-sm-2 control-label">Company Mobile</label>
				<div class="col-xs-2">
					<input type="text" class="form-control" name="CompanyMobile1" id="CompanyMobile1"
						placeholder="Company Mobile1">
				</div>
				<div class="col-xs-2">
					<input type="text" class="form-control" name="CompanyMobile2" id="CompanyMobile2"
						placeholder="Company Mobile2">
				</div>
				<div class="col-xs-2">
					<input type="text" class="form-control" name="CompanyMobile3" id="CompanyMobile3"
						placeholder="Company Mobile3">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyFax" class="col-sm-2 control-label">Company Fax</label>
				<div class="col-xs-2">
					<input type="text" class="form-control" name="CompanyFax1" id="CompanyFax1"
						placeholder="Company Fax1">
				</div>
				<div class="col-xs-2">
					<input type="text" class="form-control" name="CompanyFax2" id="CompanyFax2"
						placeholder="Company Fax2">
				</div>
				<div class="col-xs-2">
					<input type="text" class="form-control" name="CompanyFax3" id="CompanyFax3"
						placeholder="Company Fax3">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyAddress" class="col-sm-2 control-label">Company Address</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="CompanyAddress" id="CompanyAddress"
						placeholder="Company Address">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyCeo" class="col-sm-2 control-label">Company Ceo</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="CompanyCeo" id="CompanyCeo"
						placeholder="Company Ceo">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyEmail" class="col-sm-2 control-label">Company Email</label>
				<div class="col-sm-8">
					<input type="email" class="form-control" name="CompanyEmail" id="CompanyEmail"
						placeholder="Company Email">
				</div>
			</div>
			
			<div class="form-group">
				<label for="CompanyEmail" class="col-sm-2 control-label">Company Email</label>
				<div class="col-md-3">
					<input type="email" class="form-control" name="CompanyEmail" id="CompanyEmail"
						placeholder="Company Email">
				</div>
				<div class="col-xs-1">
				@
				</div>
				<div class="col-md-3">	
					<input type="email" class="form-control" name="CompanyEmail" id="CompanyEmail"
						placeholder="Company Email">
				</div>

			</div>
			
			<div class="form-group">
				<label for="CompanyLogo" class="col-sm-2 control-label">Company Logo</label>
				<div class="col-sm-8">
					<input type="file" name="CompanyLogo" id="CompanyLogo" placeholder="file">
				</div>
			</div>
			<div class=form-group>
				<div class="register">
					<a href='<c:url value="/administrator/company/companyList.do"/>'
						data-original-title="Register the Company" data-toggle="tooltip"
						type="button" class="btn btn-primary btn-lg btn-primary"> <i
						class="fa fa-registered" aria-hidden="true"> Register</i>
					</a>
				</div>
			</div>
			</fieldset>
		</form>
	</div>
</body>
</html>