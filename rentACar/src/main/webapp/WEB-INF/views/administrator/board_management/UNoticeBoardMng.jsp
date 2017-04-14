<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
	<div class="container">
	<h1>고객용 공지 게시판 관리</h1>
	<!-- 페이지 처리용 폼 -->
	<form name="frmPage" method="post"
		action='<c:url value="/admin/Board/uNotice.do" />'>
		<input type="hidden" name="currentPage"> 
		<input type="hidden" name="searchCondition" value="${param.searchCondition}"> 
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	</form>
	<!-- 테이블 화면 시작 -->
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
		
		<c:if test="${empty mlist}">
					<tr>
						<td colspan="7" class="align_center">고객용 공지사항이 존재하지 않습니다.</td>
					</tr>
		</c:if>
		
		<c:if test="${!empty unList }">			
				<c:forEach var="vo" items="${unList }">
					<tr <c:if test="${!empty vo.unoticeDeldate }"> class="danger" </c:if>>
						<td>${vo.unoticeNo }</td>
						<td><a href='<c:url value="/admin/Board/uNoticeDetail.do?unoticeNo=${vo.unoticeNo}" />'>${vo.unoticeTitle }</a></td>
						<td>${vo.adminId }</td>
						<td>${vo.unoticeReadcount }</td>
						<td>${vo.unoticeRegdate }</td>
						<td>${vo.unoticeVisible }</td>
						<td>${vo.unoticeDeldate }</td>
					</tr>	
				</c:forEach>				
		</c:if>
		
	</table>
		<div class="divPage container">
			<c:if test="${pagingInfo.firstPage>1 }">
				<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> 
					<img src='${pageContext.request.contextPath}/images/first.JPG' alt="이전블럭으로">
				</a>
			</c:if>
	
			<c:forEach var="i" begin="${pagingInfo.firstPage}"
				end="${pagingInfo.lastPage}">
				<c:if test="${i==pagingInfo.currentPage }">
					<span style="color: blue; font-weight: bold;">${i}</span>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<a href="#" onclick="pageFunc(${i})">[${i}]</a>
				</c:if>
			</c:forEach>
	
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
				<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> 
					<img src='${pageContext.request.contextPath}/images/last.JPG' alt="다음블럭으로">
				</a>
			</c:if>
		</div>	
	</div>
</body>
</html>

	
	
	<div class="divSearch container">
		<form name="frmSearch" method="post"
			action="<c:url value="/administrator/user/userList.do" />">
			<select name="searchCondition">
				<option value="userId"
					<c:if test="${'userId'==param.searchCondition}">
            		selected            	
            	</c:if>>아이디</option>
				<option value="userName"
					<c:if test="${'userName'==param.searchCondition}">
            		selected            	
            	</c:if>>이름</option>
			</select> 
			<input type="text" name="searchKeyword" title="검색어 입력"
				value="${param.searchKeyword}"> 
			<input type="submit" value="검색">
		</form>
	</div>
</body>
</html>