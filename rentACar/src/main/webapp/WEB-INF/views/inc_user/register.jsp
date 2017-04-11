<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

	<h1>회원가입</h1>
	<form name="frm1" method="post" action='<c:url value="register.do"/>'>
		아이디 : <input type="text" name="userid"><br>
		패스워드 : <input type="text" name="userpwd"><br>
		이름 : <input type="text" name="username"><br>
		이메일 : <input type="text" name="useremail1">
				 <input type="text" name="useremail2"><br>
		연락처 : <input type="text" name="usertel1">
				<input type="text" name="usertel2">
				<input type="text" name="usertel3"><br>
		생년월일 : <input type="text" name="userbirth"><br>
		주소 : <input type="text" name="useraddress"><br>
		성별 : <input type="text" name="usergender"><br>
		면허증 : <input type="text" name="userlicense"><br>
		<input type="submit" name="btn1" value="확인">
		<input type="reset" name="btn2" value="취소">
	</form>
<%@ include file="bottom.jsp" %>