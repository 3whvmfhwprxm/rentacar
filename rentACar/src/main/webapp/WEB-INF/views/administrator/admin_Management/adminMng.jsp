<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<script type="text/javascript">	
	function pageFunc(curPage){
		document.searchFrm.currentPage.value=curPage;
		searchFrm.submit();
	}
</script>
<div class="container">
	<div>
	<h2>관리자 조회</h2>
	
	<!-- 페이지 처리용 폼 -->	
	<form name="searchFrm" method="post" action='<c:url value="/admin/Mng/adminList.do" />'>
		<input type="text" name="currentPage"> 
		<input type="text" name="searchCondition" value="${param.searchCondition}"> 
		<input type="text" name="searchKeyword" value="${param.searchKeyword}">
	</form>
	
	<table class="table table-bordered table-hover">		
		<thead>
			<tr>
				<th>관리자 ID</th>
				<th>관리자 이름</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>등급</th>
				<th>등록일</th>					
				<th>삭제일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty adminlist }">
				<tr>
					<td colspan="7" class="align_center">등록된 관리자가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty adminlist }">
				<c:forEach var="vo" items="${adminlist }">
					<c:if test="${!empty vo.adminTel1 }">
						<c:set var="tel" value="${vo.adminTel1}-${vo.adminTel2}-${vo.adminTel3}" />
					</c:if>
					<c:if test="${!empty vo.adminEmail1 }">
						<c:set var="email" value="${vo.adminEmail1 }@${vo.adminEmail2 }" />
					</c:if>
					<c:set var="authName" value="" />
					<c:choose>
						<c:when test="${vo.adminAuthcode==1}">
							<c:set var="authName" value="최고관리자" />		
						</c:when>
						<c:when test="${vo.adminAuthcode==2}">
							<c:set var="authName" value="부관리자" />		
						</c:when>
						<c:when test="${vo.adminAuthcode==3}">
							<c:set var="authName" value="상담장" />		
						</c:when>
						<c:when test="${vo.adminAuthcode==4}">
							<c:set var="authName" value="상담사" />		
						</c:when>
						<c:otherwise>
							<c:set var="authName" value="기타관리자" />
						</c:otherwise>
					</c:choose>
					<tr>
						<td><a href='<c:url value="/admin/Mng/adminEdit.do?adminId=${vo.adminId }" />'> ${vo.adminId }</a></td>
						<td>${vo.adminName }</td>
						<td>${tel }</td>
						<td>${email }</td>
						<td>${authName }</td>
						<td>${vo.adminRegdate }</td>
						<td>${vo.adminOutdate }</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	</div>
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
		<form name="frmSearch" method="post" action="<c:url value="/admin/Mng/adminList.do" />">
			<select name="searchCondition">				
				<option value="admin_id"
					<c:if test="${'admin_id'==param.searchCondition}">
            		selected            	
            	</c:if>>ID</option>
            	
            	<option value="admin_name"
					<c:if test="${'admin_name'==param.searchCondition}">
            		selected            	
            	</c:if>>이름</option>
            	
				<option value="admin_tel3"
					<c:if test="${'admin_tel3'==param.searchCondition}">
            		selected            	
            	</c:if>>연락처 끝자리</option>	            		            	
			</select> 
			<input type="text" name="searchKeyword" title="검색어 입력"	value="${param.searchKeyword}"> 
			<input type="submit" value="검색">
		</form>
	</div>	
</div>
</body>
</html>