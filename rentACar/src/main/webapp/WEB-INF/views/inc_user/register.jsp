<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#frm1").submit(function(){
			if(!validate_userId($("#userId").val())){
				alert('아이디는 영문대소문자, 숫자, 언더바만 가능합니다');
				$("#userId").focus();
				return false;
			}else if(!$("#userName").val()){
				alert('이름을 입력하세요');
				$("#userName").focus();
				return false;
			}else if(!$("#userPwd").val()){
				alert('패스워드를 입력하세요');
				$("#userPwd").focus();
				return false;
			}else if(!$("#userEmail1").val()){
				alert('이메일주소를 입력하세요');
				$("#userEmail1").focus();
				return false;
			}else if(!$("#userEmail2").val()){
				alert('이메일주소를 입력하세요');
				$("#userEmail2").focus();
				return false;
			}else if(!$("#userTel1").val()){
				alert('전화번호를 입력하세요');
				$("#userTel1").focus();
				return false;
			}else if(!$("#userTel2").val()){
				alert('전화번호를 입력하세요');
				$("#userTel2").focus();
				return false;
			}else if(!$("#userTel3").val()){
				alert('전화번호를 입력하세요');
				$("#userTel3").focus();
				return false;
			}else if(!$("#userBirth").val()){
				alert('생년월일을 입력하세요');
				$("#userBirth").focus();
				return false;
			}else if(!$("#userAddress").val()){
				alert('주소를 입력하세요');
				$("#userAddress").focus();
				return false;
			}else if(!$("#userGender").val()){
				alert('성별을 입력하세요');
				$("#userGender").focus();
				return false;
			}else if(!$("#userLicense").val()){
				alert('면허증 종류를 입력하세요');
				$("#userLicense").focus();
				return false;
			}
		});
		$("#btnChkId").click(function(){
			window.open("<c:url value='/inc_user/checkUserid.do?userId="+$("#userId").val()+ "'/>", 'chk',
			'width=400,height=300,left=10,top=10,location=yes,resizable=yes');
		});
	});

	function validate_userId(userId){
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(userId); //true이면 정규식을 만족,
									 //false이면 에러 
	    /*
	   	정규식  /^[a-zA-Z0-9_]+$/g
		a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 
		숫자나 _로 시작하거나 끝나야 한다는 의미
		닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 
		그 이상 반복된다는 의미
	    */
	}

	function validate_hp(hp){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(hp);
		/*  정규식  /^[0-9]*$/g
		0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 
		(^는 시작, $는 끝을 의미)
		닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복  */
	}
	
	
</script>

	<form id="frm1" name="frm1" class="form-horizontal form-label-left" novalidate method="post" action='<c:url value="/inc_user/register.do"/>'>
		  <br>
          <div class="row">
            <label class="control-label col-md-2" for="name">아이디 <span class="required">*</span>
            </label>
            <div class="col-md-3">
              <input id="userId" name="userId" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) hong" required="required" type="text">
            </div>
            <div class="col-md-3">
            	<input type="button" value="중복확인" id="btnChkId" title="새창열림">
            </div>
          </div><br>
          
          <div class="row">
            <label class="control-label col-md-2" for="name">이름 <span class="required">*</span>
            </label>
            <div class="col-md-3">
              <input id="userName" name="userName" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) 홍길동" required="required" type="text">
            </div>
          </div><br>
          
          <div class="row">
            <label class="control-label col-md-2" for="name">비밀번호 <span class="required">*</span>
            </label>
            <div class="col-md-3">
              <input id="userPwd" name="userPwd" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" type="password">
            </div>
          </div><br>
          
          <div class="row">
            <label class="control-label col-md-2" for="name">이메일 <span class="required">*</span>
            </label>
            <div class="col-md-2">
              <input id="userEmail1" name="userEmail1" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) hong" required="required" type="text">
            </div>
            <div class="col-md-2">
              <input id="userEmail2" name="userEmail2" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) naver.com" required="required" type="text">
            </div>
          </div><br>
          
          <div class="row">
            <label class="control-label col-md-2" for="name">연락처 <span class="required">*</span>
            </label>
            <div class="col-md-2">
              <input id="userTel1" name="userTel1" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) 010" required="required" type="text">
            </div>
            <div class="col-md-2">
              <input id="userTel2" name="userTel2" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" type="text">
            </div>
            <div class="col-md-2">
              <input id="userTel3" name="userTel3" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" type="text">
            </div>
          </div><br>
          
          <div class="row">
            <label class="control-label col-md-2" for="name">생년월일 <span class="required">*</span>
            </label>
            <div class="col-md-3">
              <input id="userBirth" name="userBirth" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) 910310" required="required" type="text">
            </div>
          </div><br>
          
          <div class="row">
            <label class="control-label col-md-2" for="name">주소 <span class="required">*</span>
            </label>
            <div class="col-md-3">
              <input id="userAddress" name="userAddress" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) 서울시 영등포구 당산동" required="required" type="text">
            </div>
          </div><br>
          
          <div class="row">
            <label class="control-label col-md-2" for="name">성별 <span class="required">*</span>
            </label>
            <div class="col-md-3">
              <input id="userGender" name="userGender" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) 남 or 여" required="required" type="text">
            </div>
          </div><br>
          
          <div class="row">
            <label class="control-label col-md-2" for="name">면허증 <span class="required">*</span>
            </label>
            <div class="col-md-3">
              <input id="userLicense" name="userLicense" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) 1종보통" required="required" type="text">
            </div>
          </div><br>
          
          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
              <button type="reset" class="btn btn-primary" name="btn2">Cancel</button>
              <button type="submit" class="btn btn-success" name="btn1">Submit</button>
              <input type ="hidden" name="chkId" id="chkId">
            </div>
          </div>
        </form>
	
	
	
<%@ include file="bottom.jsp" %>