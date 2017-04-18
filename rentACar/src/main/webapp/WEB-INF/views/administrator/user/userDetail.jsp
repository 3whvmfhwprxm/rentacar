<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 상세정보</title>
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
			if (idFor
					.is(':visible')) {
				currentButton
						.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
			} else {
				currentButton
						.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
			}
		})
	});
});
</script>

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">

<style type="text/css">
.user-row {
	margin-bottom: 14px;
}

.user-row:last-child {
	margin-bottom: 0;
}

.dropdown-user {
	margin: 13px 0;
	padding: 5px;
	height: 100%;
}

.dropdown-user:hover {
	cursor: pointer;
}

.table-user-information>tbody>tr {
	border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information>tbody>tr:first-child {
	border-top: 0;
}

.table-user-information>tbody>tr>td {
	border-top: 0;
}

.toppad {
	margin-top: 20px;
}
</style>
</head>
<body>
<div class="container">
	<div
		class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">${userVo.userName}</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class=" col-md-9 col-lg-9 ">
						<table class="table table-user-information">
							<tbody>
								<tr>
									<td>아이디</td>
									<td>${userVo.userId}</td>
								</tr>
								<tr>
									<td>성별</td>
									<td>${userVo.userGender}</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td>${userVo.userTel1}-${userVo.userTel2}-${userVo.userTel3}</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td>${userVo.userEmail1}@${userVo.userEmail1}</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>${userVo.userAddress}</td>
								</tr>
								<tr>
									<td>생일</td>
									<td>${userVo.userBirth}</td>
								</tr>
								<tr>
									<td>면허증</td>
									<td>${userVo.userLicense}</td>
								</tr>
								<tr>
									<td>가입일</td>
									<td>${userVo.userRegdate}</td>
								</tr>
								<tr>
									<td>탈퇴일</td>
									<td>${userVo.userOutdate}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>