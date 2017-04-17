<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<style type="text/css">
	table tr th{
		background-color: yellow;
	}

</style>
<!-- 업체 차량 조회 -->
<h2>차량 현황</h2>
<table border="1">
	<tr>
		<th>차량번호</th>
		<th>차량모델코드</th>
		<th>모델명</th>
		<th>옵션</th>
		<th>차량사용가능여부</th>
		<th>차량상태변경</th>
		<th>차량상태</th>
		<th>차량상태변경버튼</th>
	</tr>
	
            <%-- <c:forEach var="map" items="${authList}">
            	<option value="${map['AUTHCODE'] }">${map['AUTHNAME']}</option>
            </c:forEach>
            --%>
	
	<!-- 반복시작 -->
	<c:forEach var="map" items="${cclist }">
		<tr>
			<td><a href="<c:url value='/com_manage/company_ccarDetail.do?ccarCarId=${map["CCAR_CAR_ID"] }' /> " />${map['CCAR_CAR_ID']}</td>
			<td>${map['CAR_CODE'] }</td>
			<td>${map['CAR_NAME'] }</td>
			<td><a href="#">옵션상세보기</a></td>
			<td>${map['CCAR_USE_YN'] }</td>
			<td><button>여부변경</button></td>
			<td></td>
			<td><button>상태변경</button></td>
		</tr>
	</c:forEach>
	 <!-- 반복끝 -->  
</table>
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<nav>
			<ul class="pagination">
				<c:if test="${pagingInfo.firstPage>1 }">
					<li>
						<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"
							aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>

				<c:forEach var="i" begin="${pagingInfo.firstPage}"
					end="${pagingInfo.lastPage}">
					<c:if test="${i==pagingInfo.currentPage}">
						<li class="active"><a href="#">${i}</a></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage}">
						<li><a href="#" onclick="pageFunc(${i})">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
					<li>
						<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"
							aria-label="Next"> 
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
			</ul>
		</nav>
	</div>
	<div class="col-md-4"></div>
</div>

<div class="divSearch container">
	<form name="frmSearch" method="post"
		action="<c:url value="/administrator/user/userList.do" />">
		<select name="searchCondition">
			<option value="user_id"
				<c:if test="${'user_id'==param.searchCondition}">
            		selected            	
            	</c:if>>아이디</option>
			<option value="user_name"
				<c:if test="${'user_name'==param.searchCondition}">
            		selected            	
            	</c:if>>이름</option>
		</select> <input type="text" name="searchKeyword" title="검색어 입력"
			value="${param.searchKeyword}"> <input type="submit"
			value="검색">
	</form>
</div>

<%@ include file="../inc_company/company_bottom.jsp" %>