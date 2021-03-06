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
	<h1>상담사 공지 게시판 관리</h1>
	<!-- 페이지 처리용 폼 -->
	<form name="frmPage" method="post" action='<c:url value="/admin/Board/scNotice.do" />'>
		<input type="text" name="currentPage"> 
		<input type="text" name="searchCondition" value="${param.searchCondition}"> 
		<input type="text" name="searchKeyword" value="${param.searchKeyword}">
	</form>
	<!-- 테이블 화면 시작 -->
	<table class="table table-hover">		
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성관리자</th>
			<th>조회수</th>
			<th>등록일</th>
			<th>노출여부</th>
			<th>삭제여부</th>
		</tr>
		
		<c:if test="${empty scnList}">
					<tr>
						<td colspan="7" class="align_center">상담사 공지사항이 존재하지 않습니다.</td>
					</tr>
		</c:if>
		
		<c:if test="${!empty scnList }">			
				<c:forEach var="vo" items="${scnList }">
					<tr <c:if test="${!empty vo.scnoticeDeldate }"> class="danger" </c:if>>
						<td>${vo.scnoticeNo }</td>
						<td><a href='<c:url value="/admin/Board/scNoticeDetail.do?scnoticeNo=${vo.scnoticeNo}" />'>${vo.scnoticeTitle }</a></td>
						<td>${vo.adminId }</td>
						<td>${vo.scnoticeReadcount }</td>
						<td>${vo.scnoticeRegdate }</td>
						<td>${vo.scnoticeVisible }</td>
						<td>${vo.scnoticeDeldate }</td>
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
	
			<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
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
		<div class="divSearch container">
			<form name="frmSearch" method="post"
				action="<c:url value="/admin/Board/scNotice.do" />">
				<select name="searchCondition">
				
					<option value="scnotice_title"
						<c:if test="${'scnotice_title'==param.searchCondition}">
	            		selected            	
	            	</c:if>>제목</option>
	            	
					<option value="scnotice_content"
						<c:if test="${'scnotice_content'==param.searchCondition}">
	            		selected            	
	            	</c:if>>내용</option>
	            	
	            	<option value="admin_id"
						<c:if test="${'admin_id'==param.searchCondition}">
	            		selected            	
	            	</c:if>>작성자</option>
	            	
				</select> 
				<input type="text" name="searchKeyword" title="검색어 입력"	value="${param.searchKeyword}"> 
				<input type="submit" value="검색">
			</form>
		</div>	
	</div>
</body>
</html>
