<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

	<h1>회원정보수정</h1>
	<form name="frm1" method="post" action='<c:url value="/inc_user/regedit.do"/>'>
		아이디 : <span>${vo.userName}</span><br>
		이름 : <span>${sessionScope.userId}</span><br>
		패스워드 : <input type="text" name="userPwd"><br>
		이메일 : <input type="text" name="userEmail1" value="${vo.userEmail1 }">
				 <input type="text" name="userEmail2" value="${vo.userEmail2 }"><br>
		연락처 : <input type="text" name="userTel1" value="${vo.userTel1 }">
				<input type="text" name="userTel2" value="${vo.userTel2 }">
				<input type="text" name="userTel3" value="${vo.userTel3 }"><br>
		생년월일 : <input type="text" name="userBirth" value="${vo.userBirth }"><br>
		주소 : <input type="text" name="userAddress" value="${vo.userAddress }"><br>
		성별 : <input type="text" name="userGender" value="${vo.userGender }"><br>
		면허증 : <input type="text" name="userLicense" value="${vo.userLicense }"><br>
		<input type="submit" name="btn1" value="수정">
		<input type="reset" name="btn2" value="취소">
	</form>
<%@ include file="bottom.jsp" %>