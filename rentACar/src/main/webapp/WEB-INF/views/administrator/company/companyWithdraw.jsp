<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript">
	$().ready(function(){
		$("#pwd").focus();
		
		$("#frmOut").submit(function(){
			if($("#pwd").val()==''){
				alert('비밀번호를 입력하세요');
				$("#pwd").focus();
				return false;
			}
		});		
	});
</script>
	<form name="frmOut" id="frmOut" method="post"
		action="<c:url value='/administrator/company/companyWithdraw.do' />" >
		<fieldset>
			<legend>업체 삭제</legend>
			<div>
				<label for="pwd">비밀번호</label>
				<input type="hidden" name="comId" id="comId" value="${param.comId}">
				<input type="password" name="pwd" id="pwd">
			</div>
			<div class="align_center">
				<input type="submit" value="업체 삭제">
				<input type="reset" value="취소">
			</div>
		</fieldset>
	</form>
<%@ include file="../include/bottom.jsp"%>