<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btEdit").click(function() {
			if (!validate_CompanyId($("#comId").val())) {
				alert('아이디는 영문대소문자, 숫자만 가능합니다');
				$("#comId").focus();
				return false;
			} else if ($("#comId").val() == '') {
				alert('아이디를 입력하세요.');
				$("#comId").focus();
				return false;
			} else if ($("#comId").val().length < 6) {
				alert('아이디는 6글자 이상이어야합니다.');
				$("#comId").focus();
				return false;
			} else if ($("#CompanyName").val() == '') {
				alert('업체명을 입력하세요');
				$("#CompanyName").focus();
				return false;
			} else if ($("#CompanyNo").val() == '') {
				alert('사업자번호를 입력해야 합니다.');
				$('#CompanyNo').focus();
				return false;
			} else if ($("#comAccNum").val() == '') {
				alert('계좌번호를 입력해야 합니다.');
				$('#comAccNum').focus();
				return false;
			} else if ($("#CompanyTel2").val() == ''
					|| $("#CompanyTel3").val() == '') {
				alert('대표번호를 입력하세요.');
				$("#CompanyTel2").focus();
				return false;
			} else if (!validate_tel($("#CompanyTel2").val()) || !validate_tel($("#CompanyTel3").val())) {
				alert('대표번호는 숫자를 입력하셔야 합니다');
				$("#CompanyTel2").focus();
				return false;
			} else if ($("#CompanyMobile2").val() == '' || $("#CompanyMobile3").val() == '') {
				alert('휴대폰번호를 입력하세요');
				$("#CompanyMobile2").focus();
				return false;
			} else if (!validate_mobile($("#CompanyMobile2").val()) || !validate_mobile($("#CompanyMobile3").val())) {
				alert('휴대폰번호는 숫자를 입력하셔야 합니다');
				$("#CompanyMobile2").focus();
				return false;
			} else if ($("#CompanyFax2").val() == '' || $("#CompanyFax3").val() == '') {
				alert('팩스번호를 입력하세요');
				$("#CompanyFax1").focus();
				return false;
			} else if (!validate_fax($("#CompanyFax2").val()) || !validate_fax($("#CompanyFax3").val())) {
				alert('팩스번호는 숫자를 입력하셔야 합니다');
				$("#CompanyFax1").focus();
				return false;
			} else if ($("#CompanyAddress").val() == '') {
				alert('회사주소를 입력하세요');
				$("#CompanyAddress").focus();
				return false;
			} else if ($("#comReturnPlace").val() == '') {
				alert('인수/반납장소를 입력하세요');
				$("#comReturnPlace").focus();
				return false;
			} else if ($("#CompanyCeo").val() == '') {
				alert('대표자를 입력하세요');
				$("#CompanyCeo").focus();
				return false;
			} else if ($("#CompanyEmail").val() == '') {
				alert('이메일을 입력하세요');
				$("#CompanyEmail").focus();
				return false;
			} else if ($("#CompanyRate").val()<1 || $("#CompanyRate").val()>100) {
				alert('수수료는 1%에서 100% 사이에만 가능합니다.');
				$("#CompanyRate").focus();
				return false;
			} else if ($("#comPwd").val() != '${companyVo.comPwd}') {
				alert('비밀번호를 입력하세요');
				$("#comPwd").focus();
				return false;
			}
		});
		
		$("#comLogo").change(function(str){
			if( $("#comLogo").val() != "" ){
				var ext = $('#comLogo').val().split('.').pop().toLowerCase();
				     if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
						 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
						 $("#comLogo").val("");
						 return;
				     } else {
			            file = $('#comLogo').prop("files")[0];
			            blobURL = window.URL.createObjectURL(file);
			            $('#image_preview img').attr('src', blobURL);
			            $('#image_preview').slideDown();
				     }
			 }
		});
	});
	
	function validate_CompanyId(CompanyId) {
		var pattern = new RegExp(/^[a-zA-Z0-9]*$/g);
		return pattern.test(CompanyId);
	}
	function validate_tel(tel) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
	}

	function validate_mobile(mobile) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(mobile);
	}

	function validate_fax(fax) {
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
	<form class="form-horizontal" id="frm1" name="frm1" method="post" enctype="multipart/form-data"
		action='<c:url value="/administrator/company/companyEdit.do" />'>
		
		<input type="text" name="oldFileName" 
            	value="${companyVo.comLogo}" />
		
		<legend>업체 수정</legend>
		<div class="form-group">
			<label for="comId" class="col-sm-2 control-label"> 업체 아이디
			</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="comId" id="comId"
					value="${companyVo.comId}">
			</div>
		</div>
		
		<div class="form-group">
			<label for="comPwd" class="col-sm-2 control-label"> 업체 비밀번호
			</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="comPwd" id="comPwd">
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
					value="${companyVo.comNum}">
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
				<select class="form-control" id="comMobile1" name="comMobile1">
					<option value="010"
						<c:if test="${userVo.userTel1 == '010'}">            	
            				selected="selected"
            			</c:if>>010</option>
					<option value="011"
						<c:if test="${userVo.userTel1 == '011'}">            	
            				selected="selected"
            			</c:if>>011</option>
					<option value="016"
						<c:if test="${userVo.userTel1 == '016'}">            	
            				selected="selected"
            			</c:if>>016</option>
					<option value="017"
						<c:if test="${userVo.userTel1 == '017'}">            	
            				selected="selected"
            			</c:if>>017</option>
					<option value="018"
						<c:if test="${userVo.userTel1 == '018'}">            	
            				selected="selected"
            			</c:if>>018</option>
					<option value="019"
						<c:if test="${userVo.userTel1 == '019'}">            	
            				selected="selected"
            			</c:if>>019</option>
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
			<label for="comReturnPlace" class="col-sm-2 control-label">
				차량인수, 반납장소 </label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comReturnPlace"
					id="comReturnPlace" value="${companyVo.comReturnPlace}">
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
			<div class="col-sm-1">
				<input type="text" class="form-control" name="comRate"
					id="CompanyRate" value="${companyVo.comRate}">
			</div>
			<div>
				<i class="fa fa-percent" aria-hidden="true"></i>
			</div>
		</div>

		<div class="form-group">
			<label for="CompanyLogo" class="col-sm-2 control-label"> 로고 </label>
			<div class="col-sm-2">
				<input type="file" id="comLogo" name="comlogo">
			</div>
		</div>
		
		<div class="form-group">
			<label for="comLogoImg" class="col-sm-2 control-label"></label>
			<div id="image_preview" class="col-sm-1">
				<img id="comLogoImg" src="#" style="width: 100px; height: 100px;" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="bt" class="col-sm-2 control-label"></label>
			<div class="col-sm-8">
				<button type="submit" class="btn btn-default" id="btEdit">
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