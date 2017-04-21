<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업체 상세정보</title>
<script type="text/javascript"
	src='<c:url value="/jquery/jquery-3.1.1.min.js"/>'>
</script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
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
</script>

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		<div
			class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">${companyDetail.comName}</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class=" col-md-9 col-lg-9 ">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>아이디</td>
										<td>${companyDetail.comId}</td>
									</tr>
									<tr>
										<td>사업자 번호</td>
										<td>${companyDetail.comNum}</td>
									</tr>
									<tr>
										<td>대표번호</td>
										<td>${companyDetail.comTel1}-${companyDetail.comTel2}-${companyDetail.comTel3}</td>
									</tr>
									<tr>
										<td>휴대폰</td>
										<td>${companyDetail.comMobile1}-${companyDetail.comMobile2}-${companyDetail.comMobile3}</td>
									</tr>
									<tr>
										<td>팩스번호</td>
										<td>${companyDetail.comFax1}-${companyDetail.comFax2}-${companyDetail.comFax3}</td>
									</tr>
									<tr>
										<td>주소</td>
										<td>${companyDetail.comFax1}-${companyDetail.comFax2}-${companyDetail.comFax3}}</td>
									</tr>
									<tr>
										<td>대표자</td>
										<td>${companyDetail.comCeo}</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>${companyDetail.comEmail1}@${companyDetail.comEmail2}</td>
									</tr>
									<tr>
										<td>업체로고</td>
										<td>${companyDetail.comLogo}</td>
									</tr>
									<tr>
										<td>등록일</td>
										<td>${companyDetail.comRegdate}</td>
									</tr>
									<tr>
										<td>탈퇴일</td>
										<td>${companyDetail.comOutdate}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="panel-footer">
						<a href='<c:url value="/administrator/company/companyList.do"/>'
							data-original-title="Move userList" data-toggle="tooltip"
							type="button" class="btn btn-primary btn-lg btn-primary">
							<i class="fa fa-list" aria-hidden="true"></i>목록
						</a> 
						<a href='<c:url value="/administrator/company/companyEdit.do?comId=${companyDetail.comId}"/>'
							data-original-title="Edit this user" data-toggle="tooltip"
							type="button" class="btn btn-primary btn-lg btn-warning">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i>수정
						</a> 
						<a href="<c:url value='/administrator/company/companyWithdraw.do?comId=${companyDetail.comId}'/>"
							data-original-title="Remove this user" data-toggle="tooltip"
							type="button" class="btn btn-primary btn-lg btn-danger"> 
							<i class="fa fa-times" aria-hidden="true"></i>삭제
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>