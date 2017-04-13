<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topBottom/top.jsp" %>
<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
<style type="text/css">
	th{text-align: center;}
</style>
	<form name="frmPage" method="post"
		action='<c:url value="/administrator/user/userList.do" />'>
		<input type="hidden" name="currentPage"> 
		<input type="hidden" name="searchCondition" value="${param.searchCondition}"> 
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	</form>
	<div class="divList container">
		<h2>회원</h2>
		<table class="table table-hover table-bordered" summary="회원정보에 관한 테이블">
			<thead>
				<tr>
					<th scope="col">아이디</th>
					<th scope="col">이름</th>
					<th scope="col">이메일</th>
					<th scope="col">전화번호</th>
					<th scope="col">생일</th>
					<th scope="col">주소</th>
					<th scope="col">성별</th>
					<th scope="col">면허증</th>
					<th scope="col">가입일</th>
					<th scope="col">탈퇴일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty mlist}">
					<tr>
						<td colspan="10" class="align_center">데이터가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="vo" items="${mlist}">
					<tr style="text-align: center">
						<td><a href='<c:url value="/administrator/user/userDetail.do?userId=${vo.userId}" />'>
						${vo.userId}</a></td>
						<td style="text-align: center">
							${vo.userName}
						</td>
						<td>${vo.userEmail1}@${vo.userEmail2}</td>
						<td>${vo.userTel1}-${vo.userTel2}-${vo.userTel3}</td>
						<td>${vo.userBirth}</td>
						<td>${vo.userAddress}</td>
						<td>${vo.userGender}</td>
						<td>${vo.userLicense}</td>
						<td><fmt:formatDate value="${vo.userRegdate}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${vo.userOutdate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

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