<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<script type="text/javascript">
	$().ready(function(){
		$("#adminId").focus();		
		
		$("#AdminInsertfrm").submit(function(){
			if($("#name").val()==''){
				alert('이름을 입력하세요');
				$("#name").focus();
				return false;
			}else if($("#adminId").val().length<1){
				alert('아이디를 입력하세요');
				$("#adminId").focus();
				return false;
			}else if(!validate_userid($("#adminId").val())){
				alert('아이디는 영문이나 숫자만 입력하셔야 합니다.');
				$("#adminId").focus();
				return false;
			}else if(!$("#adminPwd").val()){
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
			}else if($("#chkId").val()!='Y'){
				alert('아이디 중복검사를 해야 합니다.');
				$("#btnChkId").focus();
				return false;
			}
			
		});
		
		//아이디 중복확인-ajax 방식으로
		$("#adminId").keyup(function(){
			if(!validate_userid($("#adminId").val()) || $("#adminId").val().length<3){
				//유효성 검사를 통과하지 못한 경우
				$("#checkID").html('영문,숫자 5자리 이상 입력하세요');
				$("#chkId").val("");
				$("#checkID").show();				
			}else{				
				$.ajax({
					url:'<c:url value="/admin/Mng/ajaxCheckId.do" />',
					type:'post',
					data:'adminId='+$("#adminId").val(),
					success:function(res){						
						var msg="";
						var chkId="";
						if(res){
							msg='존재하는 ID입니다.';
						}else{
							msg='사용 가능한 ID입니다.';
							chkId="Y";
						}
						$("#checkID").html(msg);
						$("#chkId").val(chkId);
						$("#checkID").show();
					},
					error:function(xhr, status, error){
						alert("error:"+error);
					}
				});
			}			
		});
	});


	function validate_userid(userid){
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(userid);		
	    /*
	   	정규식  /^[a-zA-Z0-9_]+$/g
		a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 
		숫자나 _로 시작하거나 끝나야 한다는 의미
		닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 
		그 이상 반복된다는 의미
		return 값이 true면 정규식을 통과 false면 정규식을 통과하지못했음을 의미
	    */
	}
	
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
<style type="text/css">
#checkID{color: red; font-weight: bold;display: none;}	
</style>
<div class="divList container">
	<form class="form-horizontal" name="AdminInsertfrm" id="AdminInsertfrm" method="post" action="<c:url value='/admin/Mng/adminJoin.do' />">
	<fieldset>
		<legend>새 관리자 추가</legend>
		<div class="form-group">
				<label class="col-sm-2 control-label">관리자 ID</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="adminId" id="adminId" style="ime-mode:inactive">					
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
					<input type="password" class="form-control" name="adminName" id="adminName" style="ime-mode:inactive">				
				</div>
		</div>
		<div class="form-group">	
				<label class="col-sm-2 control-label">연락처</label>
				<div class="col-sm-2">
					<select class="form-control" name="adminTel1" id="adminTel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>			
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="adminTel2" id="adminTel2">		
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="adminTel3" id="adminTel3">		
				</div>
		</div>
		<div class="form-group">	
				<label class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-2">
					<input type="email" class="form-control" name="adminEmail" id="adminEmail" style="ime-mode:inactive" required="required">				
				</div>
		</div>
		<div class="form-group">	
			<label class="col-sm-2 control-label">관리자 등급</label>
			<div class="col-sm-2">
				<select class="form-control" name="adminAuthcode" id="adminAuthcode">
					<option value="0">선택</option>
				    <option value="1">관리자</option>
					<option value="2">부관리자</option>
					<option value="3">상담장</option>
					<option value="4">상담사</option>
					<option value="5">기타</option>
				</select>
			</div>
		</div>
	<div class=form-group>
		<label class="col-sm-2 control-label"></label>		
		<div class="col-sm-6">
			<input class="btn btn-primary btn-lg btn-block" type="submit" value="관리자 등록" name="btsubmit" id="btsubmit" >
		</div>
	</div>	
	</fieldset>
	<input type ="hidden" name="chkId" id="chkId">
	</form>
</div>
</body>
</html>