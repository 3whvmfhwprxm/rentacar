<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<script type="text/javascript">
	$().ready(function(){
		$("#adminPwd").focus();		
		
		$("#AdminEditfrm").submit(function(){
			if(!$("#adminPwd").val()){
				alert('비밀번호를 입력하세요');
				$("#adminPwd").focus();
				return false;
			}else if($("#adminPwd").val()!=$("#adminPwd2").val()){
				alert('비밀번호가 일치하지 않습니다');
				$("#adminPwd2").focus();
				return false;
			}else if(!validate_hp($("#adminTel2").val()) || !validate_hp($("#adminTel3").val())){
				alert('숫자만 입력하셔야 합니다.');
				$("#adminTel2").focus();
				return false;
			}else if($("#adminAuthcode").val()=='0'){
				alert('관리자 등급을 선택해주세요');
				$("#adminAuthcode").focus();
				return false;
			}
			
		});
	});	
	function validate_hp(hp){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(hp);
		/*  정규식  /^[0-9]*$/g
		0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 
		(^는 시작, $는 끝을 의미)
		닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복  
		return 값이 true면 정규식을 통과 false면 정규식을 통과하지못했음을 의미
		*/
	}
</script>
<div class="divList container">
	<form class="form-horizontal" name="AdminEditfrm" id="AdminEditfrm" method="post" action="<c:url value='/admin/Mng/adminEdit.do' />">
	<fieldset>
		<legend>관리자 정보 수정</legend>
		<div class="form-group">
			<label class="col-sm-2 control-label">등록일</label>
			<div class="col-sm-4">
				<span class="form-control">${avo.adminRegdate }</span>			
			</div>
		</div>
		<div class="form-group">
				<label class="col-sm-2 control-label">관리자 ID</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" 
						name="adminId" id="adminId" disabled="true" value="${avo.adminId }">					
				</div>
				<label id="checkID" class="control-label"></label>
		</div>
		<div class="form-group">	
				<label class="col-sm-2 control-label">관리자 PWD</label>
				<div class="col-sm-2">
					<input type="password" class="form-control" name="adminPwd" id="adminPwd" style="ime-mode:inactive">				
				</div>
		</div>
		<div class="form-group">	
				<label class="col-sm-2 control-label">관리자 PWD 확인</label>
				<div class="col-sm-2">
					<input type="password" class="form-control" name="adminPwd2" id="adminPwd2" style="ime-mode:inactive">				
				</div>
		</div>
		<div class="form-group">	
				<label class="col-sm-2 control-label">관리자 이름</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="adminName" id="adminName" disabled="true" value="${avo.adminName }">				
				</div>
		</div>
		<div class="form-group">	
				<label class="col-sm-2 control-label">연락처</label>
				<div class="col-sm-2">
					<select class="form-control" name="adminTel1" id="adminTel1">
						<option value="010" <c:if test="${avo.adminTel1==010}"> selected </c:if> >010</option>
						<option value="011" <c:if test="${avo.adminTel1==011}"> selected </c:if> >011</option>
						<option value="016" <c:if test="${avo.adminTel1==016}"> selected </c:if> >016</option>
						<option value="017" <c:if test="${avo.adminTel1==017}"> selected </c:if> >017</option>
						<option value="019" <c:if test="${avo.adminTel1==019}"> selected </c:if> >019</option>
					</select>			
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="adminTel2" id="adminTel2" value="${avo.adminTel2}">		
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="adminTel3" id="adminTel3" value="${avo.adminTel3}">		
				</div>
		</div>
		<div class="form-group">	
				<label class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-2">
					<input type="email" class="form-control" name="adminEmail" id="adminEmail" 
						style="ime-mode:inactive" required="required" value="${avo.adminEmail}">				
				</div>
		</div>
		<div class="form-group">	
			<label class="col-sm-2 control-label">관리자 등급</label>
			<div class="col-sm-2">
				<select class="form-control" name="adminAuthcode" id="adminAuthcode">
					<option value="0">선택</option>
				    <c:forEach var="auth" items="${authlist }">
				    	<option value="${auth.authCode }" <c:if test="${avo.adminAuthcode==auth.authCode}"> selected </c:if>>${auth.authName }</option>
				    </c:forEach>
				</select>
			</div>
		</div>
	<div class=form-group>
		<label class="col-sm-2 control-label"></label>		
		<div class="col-sm-6">
			<input class="btn btn-primary btn-lg btn-block" type="submit" value="관리자 정보 수정" name="btsubmit" id="btsubmit" >
		</div>
	</div>	
	</fieldset>
	<input type="hidden" name="adminId" value="${avo.adminId }">
	</form>
</div>
</body>
</html>