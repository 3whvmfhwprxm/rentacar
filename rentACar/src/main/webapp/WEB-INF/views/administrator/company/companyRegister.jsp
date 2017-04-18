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
	});
</script>

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
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
		<form class="form-horizontal">
			<div class="form-group">
				<label for="CompanyId" class="col-sm-2 control-label">Company
					Id</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="CompanyId"
						placeholder="Company Id">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyName" class="col-sm-2 control-label">Company
					Name</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="CompanyName"
						placeholder="Company Name">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyPwd" class="col-sm-2 control-label">Company
					Password</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="CompanyPwd"
						placeholder="Company Password">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyNo" class="col-sm-2 control-label">Company
					No</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="CompanyNo"
						placeholder="Company No">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyTel" class="col-sm-2 control-label">Company
					Tel</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="CompanyTel"
						placeholder="Company Tel">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyMobile" class="col-sm-2 control-label">Company
					Mobile</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="CompanyMobile"
						placeholder="Company Mobile">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyFax" class="col-sm-2 control-label">Company
					Fax</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="CompanyFax"
						placeholder="Company Fax">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyAddress" class="col-sm-2 control-label">Company
					Address</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="CompanyAddress"
						placeholder="Company Address">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyCeo" class="col-sm-2 control-label">Company
					Ceo</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="CompanyCeo"
						placeholder="Company Ceo">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyEmail" class="col-sm-2 control-label">Company
					Email</label>
				<div class="col-sm-8">
					<input type="email" class="form-control" id="CompanyEmail"
						placeholder="Company Email">
				</div>
			</div>
			<div class="form-group">
				<label for="CompanyLogo" class="col-sm-2 control-label">Company
					Logo</label>
				<div class="col-sm-8">
					<input type="file" id="CompanyLogo" placeholder="file">
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
		</form>

	</div>
</body>
</html>