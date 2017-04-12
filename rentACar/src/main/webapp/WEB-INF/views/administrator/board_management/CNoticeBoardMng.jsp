<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>업체용 공지 게시판 관리</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성관리자</th>
			<th>조회수</th>
			<th>등록일</th>
			<th>노출여부</th>
			<th>삭제여부</th>
		</tr>
		<c:if test="${!empty cnList }">			
				<c:forEach var="vo" items="${cnList }">
					<tr>
						<td>${vo.cnoticeNo }</td>
						<td>${vo.cnoticeTitle }</td>
						<td>${vo.adminId }</td>
						<td>${vo.cnoticeReadcount }</td>
						<td>${vo.cnoticeRegdate }</td>
						<td>${vo.cnoticeVisible }</td>
						<td>${vo.cnoticeDeldate }</td>
					</tr>	
				</c:forEach>
		</c:if>
	</table>
</body>
</html>