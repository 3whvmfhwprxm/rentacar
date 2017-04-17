<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/regicss.css"/> --%>
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

	<h1>회원가입</h1>
	<form id="frm1" name="frm1" method="post" action='<c:url value="/inc_user/register.do"/>'>
		아이디 : <input id="userId" type="text" name="userId">
				<input type="button" value="중복확인" id="btnChkId" title="새창열림"><br>
		이름 : <input id="userName" type="text" name="userName"><br>
		패스워드 : <input id="userPwd" type="text" name="userPwd"><br>
		이메일 : <input id="userEmail1" type="text" name="userEmail1">
				 <input id="userEmail2" type="text" name="userEmail2"><br>
		연락처 : <input id="userTel1" type="text" name="userTel1">
				<input id="userTel2" type="text" name="userTel2">
				<input id="userTel3" type="text" name="userTel3"><br>
		생년월일 : <input id="userBirth" type="text" name="userBirth"><br>
		주소 : <input id="userAddress" type="text" name="userAddress"><br>
		성별 : <input id="userGender" type="text" name="userGender"><br>
		면허증 : <input id="userLicense" type="text" name="userLicense"><br>
		<input type="submit" name="btn1" value="확인">
		<input type="reset" name="btn2" value="취소">
		<input type ="hidden" name="chkId" id="chkId">
	</form>
	
	
	
<%@ include file="bottom.jsp" %>