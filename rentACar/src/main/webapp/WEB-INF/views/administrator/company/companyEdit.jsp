<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btCompanyRegister").click(function() {
			if (!$("#CompanyPwd").val()) {
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
		action='<c:url value="/administrator/company/companyEdit.do" />'>
		<legend>업체 수정</legend>
		<div class="form-group">
			<label for="CompanyId" class="col-sm-2 control-label"> 업체 아이디
			</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="comId" id="CompanyId"
					value="${companyVo.comId}" readonly>
			</div>
		</div>

		<div class="form-group">
			<label for="CompanyName" class="col-sm-2 control-label"> 업체
				이름 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comName"
					id="CompanyName" value="${companyVo.comName}">
			</div>
		</div>

		<div class="form-group">
			<label for="CompanyNo" class="col-sm-2 control-label"> 사업자 번호
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comNum" id="CompanyNo"
					value="${companyVo.comNum}" readonly>
			</div>
		</div>

		<div class="form-group">
			<label for="comAccNum" class="col-sm-2 control-label"> 계좌번호 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comAccNum"
					id="comAccNum" value="${companyVo.comAccNum}">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label"> 대표번호 </label>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="comTel1"
					id="CompanyTel1" maxlength="4" value="${companyVo.comTel1}">
			</div>

			<div class="col-xs-2">
				<input class="form-control" type="text" name="comTel2"
					id="CompanyTel2" maxlength="4" value="${companyVo.comTel2}">
			</div>

			<div class="col-xs-2">
				<input class="form-control" type="text" name="comTel3"
					id="CompanyTel3" maxlength="4" value="${companyVo.comTel3}">
			</div>
		</div>
		<div class="form-group">
			<label for="CompanyMobile11" class="col-sm-2 control-label">
				휴대폰 </label>
			<div class="col-xs-2">
				<select class="form-control" id="comMobile1" name="comMobile1"
					value="${companyVo.comMobile1}">
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
					id="CompanyMobile2" value="${companyVo.comMobile2}">
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="comMobile3"
					id="CompanyMobile3" value="${companyVo.comMobile3}">
			</div>
		</div>
		<div class="form-group">
			<label for="CompanyFax" class="col-sm-2 control-label"> 팩스 </label>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="comFax1"
					id="CompanyFax1" value="${companyVo.comFax1}">
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="comFax2"
					id="CompanyFax2" value="${companyVo.comFax2}">
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="comFax3"
					id="CompanyFax3" value="${companyVo.comFax3}">
			</div>
		</div>
		<div class="form-group">
			<label for="CompanyAddress" class="col-sm-2 control-label">
				주소 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comAddress"
					id="CompanyAddress" value="${companyVo.comAddress}">
			</div>
		</div>
		<div class="form-group">
			<label for="CompanyCeo" class="col-sm-2 control-label"> 대표자 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comCeo"
					id="CompanyCeo" value="${companyVo.comCeo}">
			</div>
		</div>
		<div class="form-group">
			<label for="CompanyEmail" class="col-sm-2 control-label"> 이메일
			</label>
			<div class="col-md-8">
				<input type="email" class="form-control" name="comEmail"
					id="CompanyEmail" value="${companyVo.comEmail}">
			</div>
		</div>

		<div class="form-group">
			<label for="CompanyRate" class="col-sm-2 control-label"> 수수료
			</label>
			<div class="col-md-8">
				<input type="text" class="form-control" name="comRate"
					id="CompanyRate" value="${companyVo.comRate}%">
			</div>
		</div>

		<div class="form-group">
			<label for="CompanyLogo" class="col-sm-2 control-label"> 로고 </label>
			<div class="col-sm-2">
				<input type="file" id="CompanyLogo" name="comLogo">
			</div>
		</div>

		<div class="form-group">
			<label for="bt" class="col-sm-2 control-label"></label>
			<div class="col-sm-8">
				<button type="submit" class="btn btn-default">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>수정
				</button>

				<a href='<c:url value="/administrator/company/companyList.do" />'>
					<button type="button" id="bt2" class="btn btn-default">
						<i class="fa fa-list-ul" aria-hidden="true"></i>목록
					</button>
				</a>
			</div>
		</div>
	</form>
</div>
<%@ include file="../include/bottom.jsp"%>