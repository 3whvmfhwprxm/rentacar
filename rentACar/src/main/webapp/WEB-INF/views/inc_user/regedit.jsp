<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		$("#frm1").submit(function(){
			if(!$("#userPwd").val()){
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
				alert('면허증을 입력하세요');
				$("#userLicense").focus();
				return false;
			}
		});
	});
</script>


	<h1>회원정보수정</h1>
	<form id="frm1" name="frm1" method="post" action='<c:url value="/inc_user/regedit.do"/>'>
		아이디 : <span>${vo.userName}</span><br>
		이름 : <span>${sessionScope.userId}</span><br>
		패스워드 : <input id="userPwd" type="text" name="userPwd"><br>
		이메일 : <input id="userEmail1" type="text" name="userEmail1" value="${vo.userEmail1 }">
				 <input id="userEmail2" type="text" name="userEmail2" value="${vo.userEmail2 }"><br>
		연락처 : <input id="userTel1" type="text" name="userTel1" value="${vo.userTel1 }">
				<input id="userTel2" type="text" name="userTel2" value="${vo.userTel2 }">
				<input id="userTel3" type="text" name="userTel3" value="${vo.userTel3 }"><br>
		생년월일 : <input id="userBirth" type="text" name="userBirth" value="${vo.userBirth }"><br>
		주소 : <input id="userAddress" type="text" name="userAddress" value="${vo.userAddress }"><br>
		성별 : <input id="userGender" type="text" name="userGender" value="${vo.userGender }"><br>
		면허증 : <input id="userLicense" type="text" name="userLicense" value="${vo.userLicense }"><br>
		<input type="submit" name="btn1" value="수정">
		<input type="reset" name="btn2" value="취소">
	</form>
<%@ include file="bottom.jsp" %>