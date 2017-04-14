<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<div class="container">
	<h1>업체용 공지 게시판 관리</h1>
	<table class="table table-bordered table-hover">
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
					<tr <c:if test="${!empty vo.cnoticeDeldate }"> class="danger" </c:if>>
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
</div>
</body>
</html>