<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		$('#frmEdit').submit(function() {
			if ($("#title").val() == "") {
				alert("제목을 입력하세요");
				$('#title').focus();
				event.preventDefault();
			} else if ($('#name').val().length < 1) {
				alert("이름을 입력하세요");
				$('#name').focus();
				event.preventDefault();
			} else if (!$('#pwd').val()) {
				alert("비밀번호를 입력하세요");
				$('#pwd').focus();
				event.preventDefault();
			}

		});
	});
</script>
<body>
	<div class="divForm">
		<form id="frmEdit" name="frmEdit" method="post"
			action='<c:url value="/com_manage/company_edit.do" />'>

				<fieldset>
					<legend>업체수정</legend>
					<div class="firstDiv">
						<label for="comId">아이디</label> 
						<input type="text" id="comId" name="comId" value="${companyVo.comId}" />
					</div>
					<div>
						<label for="comName">업체명</label> 
						<input type="text" id="comName" name="comName" value="${companyVo.comName}" />
					</div>
					<div>
						<label for="comNum">사업자번호</label> 
						<input type="text" id="comNum" name="comNum" value="${companyVo.comNum}" />
					</div>
					<div>
						<label for="comNum">계좌번호</label> 
						<input type="text" id="comAccNum" name="comAccNum" value="${companyVo.comAccNum}" />
					</div>
					<div>
						<label for="comTel">대표번호</label>
						<input type="text" id="comTel1" name="comTel1" value="${companyVo.comTel1}" />-
						<input type="text" id="comTel2" name="comTel2" value="${companyVo.comTel2}" />-
						<input type="text" id="comTel3" name="comTel3" value="${companyVo.comTel3}" />
					</div>
					<div>
						<label for="comMobile">휴대폰</label> 
						<input type="text" id="comMobile1" name="comMobile1" value="${companyVo.comMobile1}" />-
						<input type="text" id="comMobile2" name="comMobile2" value="${companyVo.comMobile2}" />-
						<input type="text" id="comMobile3" name="comMobile3" value="${companyVo.comMobile3}" />
					</div>
					<div>
						<label for="comFax">팩스번호</label> 
						<input type="text" id="comFax1" name="comFax1" value="${companyVo.comFax1}" />-
						<input type="text" id="comFax2" name="comFax2" value="${companyVo.comFax2}" />-
						<input type="text" id="comFax3" name="comFax3" value="${companyVo.comFax3}" />
					</div>
					<div>
						<label for="comAddress">주소</label> 
						<input type="text" id="comAddress" name="comAddress" value="${companyVo.comAddress}" />
					</div>
					<div>
						<label for="comCeo">대표자</label> 
						<input type="text" id="comCeo" name="comCeo" value="${companyVo.comCeo}" />
					</div>
					<div>
						<label for="comEmail">이메일</label> 
						<input type="text" id="comEmail1" name="comEmail" value="${companyVo.comEmail}" />
					</div>
					<div>
						<label for="comLogo">업체로고</label> 
						<input type="text" id="comLogo" name="comLogo" value="${companyVo.comLogo}" />
					</div>
					
					<div class="center">
						<input type="submit" value="수정" /> 
					</div>
				</fieldset>
		</form>
	</div>
<%@ include file="../inc_company/company_bottom.jsp" %>