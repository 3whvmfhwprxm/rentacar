<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<div class="container">
	<h1>고객용 공지 게시판 관리</h1>
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
		<c:if test="${!empty unList }">			
				<c:forEach var="vo" items="${unList }">
					<tr>
						<td>${vo.unoticeNo }</td>
						<td>${vo.unoticeTitle }</td>
						<td>${vo.adminId }</td>
						<td>${vo.unoticeReadcount }</td>
						<td>${vo.unoticeRegdate }</td>
						<td>${vo.unoticeVisible }</td>
						<td>${vo.unoticeDeldate }</td>
					</tr>	
				</c:forEach>
		</c:if>
	</table>
	</div>
</body>
</html>