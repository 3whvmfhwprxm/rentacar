<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_user/top.jsp" %>
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
			}else if(!$("#userEmail").val()){
				alert('이메일주소를 입력하세요');
				$("#userEmail1").focus();
				return false;
			}else if(!validate_userTel2($("#userTel2").val())&&$("#userTel2").val().length!=4){
				alert('전화번호를 입력하세요');
				$("#userTel2").focus();
				return false;
			}else if(!validate_userTel3($("#userTel3").val())&&$("#userTel3").val().length!=4){
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
		//아이디 중복확인-ajax 방식으로
		$("#userId").keyup(function() {
			if(!validate_userId($("#userId").val())||$("#userId").val().length<4){
				//유효성 검사를 통과하지 못한 경우
				$("#error").html('ID는 4자리 이상 영대소문자, 숫자, 언더바만 가능.');
				$("#chkId").val("");
				$("#error").show();
			}else{
				//유효성 검사를 통과하면 아이디 중복검사한다
				$.ajax({
					url:'<c:url value="/user/userAjaxCheckId.do"/>',
					type:'post',
					data:'userId='+$("#userId").val(),
					success:function(res){
						var msg="";
						var chkId="";
						if(res){
							//아이디가 이미 존재
							msg="해당 아이디는 이미 존재합니다.";
						}else{
							msg="해당 아이디 사용 가능합니다.";
							chkId="Y";
						}
						$("#error").html(msg);
						$("#chkId").val(chkId);
						$("#chkId").show();
					},
					error:function(){
						alert("error:"+error)
					}
				});
			}
		});

		function validate_userId(userId){
			var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
			return pattern.test(userId); 
		}
	
		function validate_userTel2(userTel2){
			var pattern = new RegExp(/^[0-9]*$/g);
			return pattern.test(hp);
		}
		function validate_userTel3(userTel3){
			var pattern = new RegExp(/^[0-9]*$/g);
			return pattern.test(hp);
		}
	});
	
	function juso(){
		window.open("../userzipcode/jusoPopup.do","pop", "width=570,height=420, scrollbars=yes, resizable=yes");
	}
		
	function jusoCallBack(addrDetail){
		document.frm1.userAddress.value=addrDetail;
	}
</script>
<style type="text/css">
	#error{
		color: red;
		font-weight: bold;
		display: none;
	}
	#frm1 {
		text-align: center;
	}
</style>
<div class="container">
	<div class="col-xs-12 col-sm-8 col-sm-offset-2"><br>
		<div class="join-tab mt-20">
					<img src="<c:url value="/user_img/tab_join_step_02.gif"/>" alt="step2" />
		</div>
		<form id="frm1" name="frm1" class="form-horizontal" novalidate method="post" action='<c:url value="/user/register.do"/>'>
			  <br>
	          <div class="row">
	            <label class="control-label col-md-3" for="name">아이디 <span class="required">*</span>
	            </label>
	            <div class="col-md-4">
	              <input id="userId" name="userId" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) hong" required="required" type="text">
	            </div>
	            <div class="col-md-5">
	            	<span id="error"></span>
	            </div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">이름 <span class="required">*</span>
	            </label>
	            <div class="col-md-4">
	              <input id="userName" name="userName" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) 홍길동" required="required" type="text">
	            </div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">비밀번호 <span class="required">*</span>
	            </label>
	            <div class="col-md-4">
	              <input id="userPwd" name="userPwd" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" type="password">
	            </div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">이메일 <span class="required">*</span>
	            </label>
	            <div class="col-md-4">
	              <input id="userEmail" name="userEmail" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) hong@naver.com" required="required" type="email">
	            </div>
	          </div><br>
	          
	            <div class="row">
	            	<label class="control-label col-md-3" for="name">연락처 <span class="required">*</span>
	           		</label>
	           		<div class="col-md-2">
	             		<select id="userTel1" name="userTel1" class="form-control" name="name">
	             			<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
	             		</select>
	           		</div>
	            <div class="col-md-2">
	              <input id="userTel2" name="userTel2" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" type="text">
	            </div>
	            <div class="col-md-2">
	              <input id="userTel3" name="userTel3" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" type="text">
	            </div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">생년월일 <span class="required">*</span>
	            </label>
	            <div class="col-md-4">
	              <input id="userBirth" name="userBirth" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) 910310" required="required" type="text">
	            </div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">주소 <span class="required">*</span>
	            </label>
	            <div class="col-md-4">
	              <input id="userAddress" name="userAddress" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) 서울시 영등포구 당산동" required="required" type="text">
	            </div>
	            <div class="col-sm-2">
					<input type="button" class="btn btn-default" value="주소찾기" onClick="juso()">
				</div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">성별 <span class="required">*</span>
	            </label>
	              <div class="col-md-2">
	           		<select id="userGender" name="userGender" class="form-control" name="name">
	           			<option value="남자">남자</option>
	           			<option value="여자">여자</option>
	           		</select>
	            </div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">면허증 <span class="required">*</span>
	            </label>
	           	<div class="col-md-3">
	           		<select id="userLicense" name="userLicense" class="form-control" name="name">
	           			<option value="1종 대형">1종 대형</option>
	           			<option value="1종 보통">1종 보통</option>
	           			<option value="1종 소형">1종 소형</option>
	           			<option value="1종 특수">1종 특수</option>
	           			<option value="2종 보통">2종 보통</option>
	           			<option value="2종 소형">2종 소형</option>
	           		</select>
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
	</div>
</div>
	
	
<%@ include file="../inc_user/bottom.jsp" %>