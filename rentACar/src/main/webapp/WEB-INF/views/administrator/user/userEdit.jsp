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
		action='<c:url value="/administrator/user/userEdit.do" />'>
		<legend>회원 수정</legend>
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label"> 회원 아이디 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="userId" id="userId"
					value="${userVo.userId}" readonly>
			</div>
		</div>

		<div class="form-group">
			<label for="userName" class="col-sm-2 control-label"> 회원 이름 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="userName"
					id="userName" value="${userVo.userName}">
			</div>
		</div>

		<div class="form-group">
			<label for="userEmail" class="col-sm-2 control-label"> 회원 이메일
			</label>
			<div class="col-sm-8">
				<input type="email" class="form-control" name="userEmail"
					id="userEmail" value="${userVo.userEmail}">
			</div>
		</div>

		<div class="form-group">
			<label for="userTel1" class="col-sm-2 control-label"> 휴대폰 </label>
			<div class="col-xs-2">
				<select class="form-control" id="userTel1" name="userTel1"
					value="${userVo.userTel1}">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="userTel2"
					id="userTel2" value="${userVo.userTel2}">
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="userTel3"
					id="userTel3" value="${userVo.userTel3}">
			</div>
		</div>

		<div class="form-group">
			<label for="userBirth" class="col-sm-2 control-label"> 생일 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="userBirth"
					id="userBirth" value="${userVo.userBirth}">
			</div>
		</div>

		<div class="form-group">
			<label for="userAddress" class="col-sm-2 control-label"> 주소 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="userAddress"
					id="userAddress" value="${userVo.userAddress}">
			</div>
		</div>
		
		<div class="form-group">
			<label for="userGender" class="col-sm-2 control-label"> 성별 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="userGender"
					id="userGender" value="${userVo.userGender}">
			</div>
		</div>

		<div class="form-group">
			<label for="userLicense" class="col-sm-2 control-label">
				운전면허증 </label>
			<div class="col-sm-2">
				<select class="form-control" name="userLicense" id="userLicense"
					title="운전면허">
					<option value="1종 대형">1종 대형</option>
					<option value="1종 보통">1종 보통</option>
					<option value="1종 소형">1종 소형</option>
					<option value="1종 특수">1종 특수</option>
					<option value="2종 보통">2종 보통</option>
					<option value="2종 소형">2종 소형</option>
					<option value="원동기장치/자전거">원동기장치/자전거</option>
				</select>
			</div>
			<%-- <div class="col-sm-8">
				<input type="text" class="form-control" name="userLicense"
					id="userLicense" value="${userVo.userLicense}">
			</div> --%>
		</div>

		<div class="form-group">
			<label for="bt" class="col-sm-2 control-label"></label>
			<div class="col-sm-8">
				<button type="submit" id="bt1" class="btn btn-default">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>수정
				</button>

				<a href='<c:url value="/administrator/user/userInList.do" />'>
					<button type="button" id="bt2" class="btn btn-default">
						<i class="fa fa-list-ul" aria-hidden="true"></i>목록
					</button>
				</a>
			</div>
		</div>
	</form>
</div>
<%@ include file="../include/bottom.jsp"%>