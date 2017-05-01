<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>

<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>

<style type="text/css">
	th {
		text-align: center;
	}
	
	.col-md-4 {
		float: left;
		width: 100%;
		margin: 0 auto;
		text-align: center;
	}
</style>

<form name="frmPage" method="post"
	action='<c:url value="/administrator/user/userList.do" />'>
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>

<div class="w3-container" >
	<div class="nav navbar-nav menu-list" style="padding-top: 5px;">
		<a href='<c:url value="/administrator/user/userOutList.do" />'>
			<button type="button" class="btn btn-default">	
				<i class="fa fa-check" aria-hidden="true"></i>&nbsp;탈퇴회원 리스트	
			</button>
		</a>
		&nbsp;
		<a href='<c:url value="/administrator/company/companyOutList.do" />'>
			<button type="button" class="btn btn-default">
				<i class="fa fa-check" aria-hidden="true"></i>&nbsp;탈퇴업체 리스트
			</button>
		</a>
	</div>
	
	<br><br>
	
	<h3>Using jQuery plugin allows you to apply paging to standard html table.</h3>
		The default number of pages is 10 but you can pass a number to the
		function to have more or less items per page.
		<br><br>
	<h4>To Initialize the table use either of the following:</h4>
	<pre>
		<code>
		    $('#tableid').page();
		    <strong>OR</strong>
		    $('#tableid').page(15);
    	</code>
	</pre>

	<div class="row">
		<div class="col-md-12">
			<h3>회원 리스트</h3>
			<table class="table table-hover">
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
							<td><a
								href='<c:url value="/administrator/user/userDetail.do?userId=${vo.userId}" />'>
									${vo.userId}</a></td>
							<td style="text-align: center">${vo.userName}</td>
							<td>${vo.userEmail}</td>
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
		
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<nav>
					<ul class="pagination">
						<c:if test="${pagingInfo.firstPage>1}">
							<li><a href="#"
								onclick="pageFunc(${pagingInfo.firstPage-1})"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
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
							<li><a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class="col-md-4"></div>
		</div>

		<div class="divSearch container">
			<div class="col-md-4">
				<form name="frmSearch" method="post"
					action="<c:url value="/administrator/user/userList.do" />">
					<select name="searchCondition">
						<option value="user_id"
							<c:if test="${'user_id'==param.searchCondition}">
	            				selected            	
	            			</c:if>>아이디
	            		</option>
						<option value="user_name"
							<c:if test="${'user_name'==param.searchCondition}">
	            				selected            	
	            			</c:if>>이름
	            		</option>
					</select>
						<input type="text" name="searchKeyword" title="검색어 입력" value="${param.searchKeyword}">
						<input type="submit" value="검색">
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/bottom.jsp"%>