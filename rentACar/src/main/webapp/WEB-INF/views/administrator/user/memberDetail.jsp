<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>글 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">제목</span> <span>${reBoardVo.title}</span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span>${reBoardVo.name}</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span>${reBoardVo.regdate}</span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span>${reBoardVo.readcount}</span>
		</div>
		<div>
			<span class="sp1">첨부파일</span> 
			<span>
				<a href
					="<c:url value='/reBoard/download.do?no=${reBoardVo.no}&fileName=${reBoardVo.fileName}'/>">
				${fileInfo}</a>
				<span style="color:blue">${downInfo}</span>
			</span>
		</div>

		<c:set var="newLine" value="\r\n" />
		<div class="lastDiv">			
			<p class="content">${fn:replace(reBoardVo.content, newLine, "<br>")}</p>
		</div>
		<div class="center">
			<a href='<c:url value="/administrator/user/memberEdit.do?userId=${vo.userId}"/>'>수정</a> |
        	<a href='<c:url value="/administrator/user/memberDelete.do?userId=${vo.userId}"/>'>삭제</a> ||
        	<a href='<c:url value="/administrator/user/memberList.do"/>'>목록</a>			
		</div>
	</div>
</body>
</html>