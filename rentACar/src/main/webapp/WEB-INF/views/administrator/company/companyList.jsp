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
	action='<c:url value="/administrator/company/companyList.do" />'>
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>

<div class="w3-container">
	<div class="nav navbar-nav menu-list" style="padding-top: 5px;">
		<a href='<c:url value="/administrator/company/companyOutList.do" />'>
			<button type="button" class="btn btn-default">	
				<i class="fa fa-check" aria-hidden="true"></i>&nbsp;탈퇴업체 리스트	
			</button>
		</a>
		&nbsp;
		<a href='<c:url value="/administrator/company/companyListByCar.do" />'>
			<button type="button" class="btn btn-default">
				<i class="fa fa-check" aria-hidden="true"></i>&nbsp;업체 보유차량
			</button>
		</a>
	</div>
	
    <br><br>
    
	<h3>Using jQuery plugin allows you to apply paging to standard html table.</h3>
		The default number of pages is 10 but you can pass a number to the
		function to have more or less items per page.
		<br>
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
			<h3>업체 리스트</h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">업체아이디</th>
						<th scope="col">업체명</th>
						<th scope="col">사업자번호</th>
						<th scope="col">대표번호</th>
						<th scope="col">휴대폰</th>
						<th scope="col">팩스번호</th>
						<th scope="col">주소</th>
						<th scope="col">대표자</th>
						<th scope="col">대표메일</th>
						<th scope="col">수수료(%)</th>
						<th scope="col">가입일</th>
						<th scope="col">탈퇴일</th>
					</tr>
				</thead>

				<tbody>
					<c:if test="${empty companyList}">
						<tr>
							<td colspan="9" class="align_center">데이터가 존재하지 않습니다.</td>
						</tr>
					</c:if>

					<c:forEach var="vo" items="${companyList}">
						<tr style="text-align: center">
							<td><a
								href='<c:url value="/administrator/company/companyDetail.do?comId=${vo.comId}" />'>
									${vo.comId}</a></td>
							<td style="text-align: center">${vo.comName}</td>
							<td>${vo.comNum}</td>
							<td>${vo.comTel1}-${vo.comTel2}-${vo.comTel3}</td>
							<td>${vo.comMobile1}-${vo.comMobile2}-${vo.comMobile3}</td>
							<td>${vo.comFax1}-${vo.comFax2}-${vo.comFax3}</td>
							<td>${vo.comAddress}</td>
							<td>${vo.comCeo}</td>
							<td>${vo.comEmail}</td>
							<td>${vo.comRate}%</td>
							<td><fmt:formatDate value="${vo.comRegdate}"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${vo.comOutdate}"
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

		<div class="col-md-4">
			<div class="divSearch">
				<form name="frmSearch" method="post"
					action="<c:url value="/administrator/company/companyList.do" />">
					<select name="searchCondition">
						<option value="com_id"
							<c:if test="${'com_id'==param.searchCondition}">
	           					selected            	
	           				</c:if>>업체아이디
	           			</option>
						<option value="com_name"
							<c:if test="${'com_name'==param.searchCondition}">
	           					selected            	
	           				</c:if>>업체명
	           			</option>
					</select>
					<input type="text" name="searchKeyword" title="검색어 입력" value="${param.searchKeyword}">
					<input type="submit" value="검색">
				</form>
				<br><br> 
				<a href='<c:url value="/administrator/company/companyRegister.do" />'>
					<button type="button" class="btn btn-primary">Register</button>
				</a>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/bottom.jsp"%>