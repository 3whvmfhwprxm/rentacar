<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원목록 상세보기</title>
</head>
<body>
	<h2>회원목록 상세보기</h2>
	<div class="divForm">
		<c:forEach var="vo" items="${mDetail}">
			<div>
				<span>아이디</span> <span>${vo.userId}</span>
			</div>
			<div>
				<span>이름</span> <span>${vo.userName}</span>
			</div>
			<div>
				<span>이메일</span> <span>${vo.userEmail1}@${vo.userEmail1}</span>
			</div>
			<div>
				<span>전화번호</span> <span>${vo.userTel1}-${vo.userTel2}-${vo.userTel3}</span>
			</div>
			<div>
				<span>생일</span> <span>${vo.userBirth}</span>
			</div>
			<div>
				<span>주소</span> <span>${vo.userAddress}</span>
			</div>
			<div>
				<span>성별</span> <span>${vo.userGender}</span>
			</div>
			<div>
				<span>면허증</span> <span>${vo.userLicense}</span>
			</div>
			<div>
				<span>가입일</span> <span>${vo.userRegdate}</span>
			</div>
			<div>
				<span>탈퇴일</span> <span>${vo.userOutdate}</span>
			</div>
		</c:forEach>
		<div class="center">
        	<a href='<c:url value="/administrator/user/userList.do"/>'>목록</a>			
		</div>
		
	</div>
</body>
</html>