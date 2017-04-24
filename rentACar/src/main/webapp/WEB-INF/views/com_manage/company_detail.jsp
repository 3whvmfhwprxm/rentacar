<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
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
<style>
.col-md-offset-3{
	margin-left: 15%;
}
</style>
<br>
	<div class="container">
		<div
			class="col-lg-8 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">${companyVo.comName}</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12 ">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>아이디</td>
										<td>${companyVo.comId}</td>
									</tr>
									<tr>
										<td>사업자 번호</td>
										<td>${companyVo.comNum}</td>
									</tr>
									<tr>
										<td>대표자</td>
										<td>${companyVo.comCeo}</td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td>${companyVo.comCeo}</td>
									</tr>
									<tr>
										<td>비밀번호 확인</td>
										<td>${companyVo.comCeo}</td>
									</tr>
									<tr>
										<td>대표번호</td>
										<td><input type="text" name="comTel1" id="comTel1" value="${companyVo.comTel1}">
										<input type="text" name="comTel2" id="comTel2" value="${companyVo.comTel2}">
										<input type="text" name="comTel3" id="comTel3" value="${companyVo.comTel3}"></td>
									</tr>
									<tr>
										<td>휴대폰</td>
										<td><input type="text" name="comMobile1" id="comMobile1" value="${companyVo.comMobile1}">
										<input type="text" name="comMobile2" id="comMobile2" value="${companyVo.comMobile2}">
										<input type="text" name="comMobile3" id="comMobile3" value="${companyVo.comMobile3}"></td>
									</tr>
									<tr>
										<td>팩스번호</td>
										<td><input type="text" name="comFax1" id="comFax1" value="${companyVo.comFax1}">
										<input type="text" name="comFax2" id="comFax2" value="${companyVo.comFax2}">
										<input type="text" name="comFax3" id="comFax3" value="${companyVo.comFax3}"></td>
									</tr>
									<tr>
										<td>주소</td>
										<td><input type="text" name="comAddress" id="comAddress" value="${companyVo.comAddress}"></td>
									</tr>
									<tr>
										<td>이메일</td>
										<td><input type="text" name="comEmail" id="comEmail" value="${companyVo.comEmail}"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="panel-footer">
						<a href='<c:url value="/com_manage/company_dtail.do?comId=${companyVo.comId}"/>'
							data-original-title="Edit this user" data-toggle="tooltip"
							type="button" class="btn btn-primary btn-lg btn-warning">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i>수정
						</a> 
						<%-- <a href="<c:url value='/administrator/company/companyWithdraw.do?comId=${companyVo.comId}'/>"
							data-original-title="Remove this user" data-toggle="tooltip"
							type="button" class="btn btn-primary btn-lg btn-danger"> 
							<i class="fa fa-times" aria-hidden="true"></i>삭제
						</a> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../inc_company/company_bottom.jsp" %>