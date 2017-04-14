<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topBottom/top.jsp" %>
	<div class="container">
	<h1>서비스센터 공지 게시판 관리</h1>
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
		<c:if test="${!empty scnList }">			
				<c:forEach var="vo" items="${scnList }">
					<tr <c:if test="${!empty vo.scnoticeDeldate }"> class="danger" </c:if>>
						<td>${vo.scnoticeNo }</td>
						<td>${vo.scnoticeTitle }</td>
						<td>${vo.adminId }</td>
						<td>${vo.scnoticeReadcount }</td>
						<td>${vo.scnoticeRegdate }</td>
						<td>${vo.scnoticeVisible }</td>
						<td>${vo.scnoticeDeldate }</td>
					</tr>	
				</c:forEach>
		</c:if>
	</table>
	</div>
</body>
</html>