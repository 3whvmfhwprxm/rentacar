<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#CompanyId").focus();
		
		$("#btCompanyRegister").click(function(){
			if(!validate_CompanyId($("#CompanyId").val())){
				alert('아이디는 영문대소문자, 숫자만 가능합니다');
				$("#CompanyId").focus();
				return false;
			}else if($("#CompanyId").val()==''){
				alert('아이디를 입력하세요.');
				$("#CompanyId").focus();
				return false;
			}else if($("#CompanyId").val().length<6){
				alert('아이디는 6글자 이상이어야합니다.');
				$("#CompanyId").focus();
				return false;
			}else if($("#CompanyName").val()==''){
				alert('업체명을 입력하세요');
				$("#CompanyName").focus();
				return false;
			}else if(!$("#CompanyPwd").val()){
				alert('비밀번호를 입력하세요');
				$("#CompanyPwd").focus();
				return false;
			}else if($("#CompanyPwd").val()!=$("#CompanyPwd2").val()){
				alert('비밀번호가 일치하지 않습니다');
				$("#CompanyPwd2").focus();
				return false;
			}else if($("#CompanyNo").val()==''){
				alert('사업자번호를 입력해야 합니다.');
				$('#CompanyNo').focus();
				return false;
			}else if($("#comAccNum").val()==''){
				alert('계좌번호를 입력해야 합니다.');
				$('#comAccNum').focus();
				return false;
			}else if($("#CompanyTel2").val()=='' || 
					$("#CompanyTel3").val()==''){
				alert('대표번호를 입력하세요.');
				$("#CompanyTel2").focus();
					return false;
			}else if(!validate_tel($("#CompanyTel2").val()) || 
					!validate_tel($("#CompanyTel3").val())){
				alert('대표번호는 숫자를 입력하셔야 합니다');
				$("#CompanyTel2").focus();
				return false;
			}else if($("#CompanyMobile2").val()=='' || 
					$("#CompanyMobile3").val()==''){
				alert('휴대폰번호를 입력하세요');
				$("#CompanyMobile2").focus();
				return false;
			}else if(!validate_mobile($("#CompanyMobile2").val()) || 
					!validate_mobile($("#CompanyMobile3").val())){
				alert('휴대폰번호는 숫자를 입력하셔야 합니다');
				$("#CompanyMobile2").focus();
				return false;
			}else if($("#CompanyFax2").val()=='' || 
					$("#CompanyFax3").val()==''){
				alert('팩스번호를 입력하세요');
				$("#CompanyFax1").focus();
				return false;
			}else if(!validate_fax($("#CompanyFax2").val()) || 
					!validate_fax($("#CompanyFax3").val())){
				alert('팩스번호는 숫자를 입력하셔야 합니다');
				$("#CompanyFax1").focus();
				return false;
			}else if($("#CompanyAddress").val()==''){
				alert('회사주소를 입력하세요');
				$("#CompanyAddress").focus();
				return false;
			}else if($("#CompanyCeo").val()==''){
				alert('대표자를 입력하세요');
				$("#CompanyCeo").focus();
				return false;
			}
		});
		
		
		$("#CompanyId").keyup(function(){
			if(!validate_CompanyId($("#CompanyId").val())){
				$("#check").html('아이디는 영문이나 숫자만 입력하셔야 합니다.');
				$("#check").show();
			}else if($("#CompanyId").val()==''){
				$("#check").html('아이디를 입력하세요');
				$("#chkId").val("");
				$("#check").show();
			}else if($("#CompanyId").val().length<6){
				$("#check").html('아이디는 6글자 이상이어야합니다.');
				$("#chkId").val("");
				$("#check").show();
			}else{
				$.ajax({
					url:'<c:url value="/administrator/company/CheckCompanyId.do" />',
					type:'post',
					data:'CompanyId='+$("#CompanyId").val(),
					dataType:'json',
					success:function(res){
						var msg = "";
						var chkId = "";
						
						if(res){
							//아이디가 이미 존재
							msg = "해당 아이디가 이미 존재합니다.";
						}else{
							msg = "해당 아이디 사용가능";
							chkId = "Y";
						}
						$("#check").html(msg);
						$("#chkId").val(chkId);
						$("#check").show();
					},
					error:function(xhr, status, error){
						alert("error: "+error);
					}
				});
			}
		});
	});
	
	function goPopup(){
		window.open("../zipcode/jusoPopup.do","pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
		
	function jusoCallBack(addrDetail){
		document.frm1.comAddress.value 
			= addrDetail;
	}
	
	function validate_CompanyId(CompanyId){
		var pattern = new RegExp(/^[a-zA-Z0-9]*$/g);
		return pattern.test(CompanyId);		
	}
	function validate_tel(tel){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
	}
	
	function validate_mobile(mobile){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(mobile);
	}
	
	function validate_fax(fax){
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
	
	#check{
		color: red;
		font-weight: bold;
		display: none;
	}
</style>

<div class="w3-container" >
	<form class="form-horizontal" id="frm1" name="frm1" method="post"
		action='<c:url value="/administrator/company/companyRegister.do" />'>
	<h3>업체 등록</h3>
		<div class="form-group">
			<label for="CompanyId" class="col-sm-2 control-label">
				업체 아이디
			</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="comId"
					id="CompanyId" placeholder="업체 아이디">		
				
			</div>
			<div class="col-sm-4">
				<span id="check"></span>
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyName" class="col-sm-2 control-label">
				업체 이름
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comName"
					id="CompanyName" placeholder="업체 이름">
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyPwd" class="col-sm-2 control-label">
				비밀번호
			</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" name="comPwd"
					id="CompanyPwd" placeholder="비밀번호">
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyPwd2" class="col-sm-2 control-label">
				비밀번호 확인
			</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" name="comPwd2"
					id="CompanyPwd2" placeholder="비밀번호 확인">
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyNo" class="col-sm-2 control-label">
				사업자 번호
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comNum"
					id="CompanyNo" placeholder="사업자 번호">
			</div>
		</div>
		
		<div class="form-group">
			<label for="comAccNum" class="col-sm-2 control-label">
				계좌번호
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comAccNum"
					id="comAccNum" placeholder="계좌번호">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">
				대표번호
			</label>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="comTel1"
					id="CompanyTel1" maxlength="4" placeholder="대표번호1">
			</div>
			
			<div class="col-xs-2">
				<input class="form-control" type="text" name="comTel2"
					id="CompanyTel2" maxlength="4" placeholder="대표번호2">
			</div>
			
			<div class="col-xs-2">
				<input class="form-control" type="text" name="comTel3"
					id="CompanyTel3" maxlength="4" placeholder="대표번호3">
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyMobile11" class="col-sm-2 control-label">
				휴대폰
			</label>
			<div class="col-xs-2">
				<select class="form-control" id="comMobile1" name="comMobile1">
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
					id="CompanyMobile2" placeholder="휴대폰2">
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="comMobile3"
					id="CompanyMobile3" placeholder="휴대폰3">
			</div>
		</div>
		<div class="form-group">
			<label for="CompanyFax" class="col-sm-2 control-label">
				팩스
			</label>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="comFax1"
					id="CompanyFax1" placeholder="팩스 번호1">
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="comFax2"
					id="CompanyFax2" placeholder="팩스 번호2">
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="comFax3"
					id="CompanyFax3" placeholder="팩스 번호3">
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyAddress" class="col-sm-2 control-label">
				주소
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="comAddress"
					id="CompanyAddress" placeholder="회사 주소" readonly="readonly">
			</div>
			<div class="col-sm-2">
				<input type="button" class="btn btn-default" value="주소찾기" onClick="goPopup()">
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyCeo" class="col-sm-2 control-label">
				대표자
			</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="comCeo"
					id="CompanyCeo" placeholder="대표자">
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyEmail" class="col-sm-2 control-label">
				이메일</label>
			<div class="col-md-8">
				<input type="email" class="form-control" name="comEmail"
					id="CompanyEmail" placeholder="이메일을 정확히 입력해주세요. ex)asd@naver.com">
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyRate" class="col-sm-2 control-label">
				수수료</label>
			<div class="col-md-8">
				<input type="text" class="form-control" name="comRate"
					id="CompanyRate" placeholder="수수료(기본 3%)">
			</div>
		</div>
		
		<div class="form-group">
			<label for="CompanyLogo" class="col-sm-2 control-label">
				업체 로고
			</label>
			<div class="col-sm-2">
				<input type="file" id="CompanyLogo" name="comLogo"
					placeholder="업체 로고">	
			</div>
		</div>
		
		<div class=form-group>
			<label class="col-sm-2 control-label"></label>
			<div class="col-sm-8">
				<button type="submit" class="btn btn-primary btn-lg btn-block" id="btCompanyRegister">
					업체 등록
				</button>
			</div>
		</div>
	</form>
</div>
<%@ include file="../include/bottom.jsp"%>