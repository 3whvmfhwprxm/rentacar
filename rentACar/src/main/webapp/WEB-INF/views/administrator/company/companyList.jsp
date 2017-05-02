<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>

<script type="text/javascript">	
	$(document).ready(function(){
		$('#myTab a').click(function (e) {
			e.preventDefault()
			$(this).tab('show')
		});
	});
	
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
	
	<br>
	
	<div role="tabpanel">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active">
				<a href="#companyInList" aria-controls="companyInList" role="tab" data-toggle="tab">
					업체 리스트 
				</a>
			</li>

			<li role="presentation">
				<a href="#companyOutList" aria-controls="companyOutList" role="tab" data-toggle="tab">
					탈퇴업체 리스트
				</a>
			</li>
			
			<li role="presentation">
				<a href="#companyCarList" aria-controls="companyCarList" role="tab" data-toggle="tab">
					업체보유차량 리스트
				</a>
			</li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<!-- ★★★★★★★★★★업체 리스트★★★★★★★★★★ -->
			<div role="tabpanel" class="tab-pane active" id="companyInList">
				<div class="row">
					<div class="col-md-12">
						<br>
						<table class="table table-hover">
							<thead>
								<tr class="info">
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
								<c:if test="${empty companyInList}">
									<tr>
										<td colspan="12" style="text-align: center;">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:if>
			
								<c:forEach var="vo" items="${companyInList}">
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
				</div>
			</div>
			<!-- <!-- ★★★★★★★★★★탈퇴업체 리스트★★★★★★★★★★ -->
			<div role="tabpanel" class="tab-pane" id="companyOutList">
				<div class="row">
					<div class="col-md-12">
						<br>
						<table class="table table-hover">
							<thead>
								<tr class="info">
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
								<c:if test="${empty outCompanyList}">
									<tr>
										<td colspan="12" style="text-align: center;">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="vo" items="${outCompanyList}">
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
				</div>
			</div>
			<!-- <!-- ★★★★★★★★★★업체보유차량 리스트★★★★★★★★★★ -->
			<div role="tabpanel" class="tab-pane" id="companyCarList">
				<div class="row">
					<div class="col-md-12">
						<br>
						<table class="table table-hover">
							<thead>
								<tr class="info">
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
								<c:if test="${empty companyAllList}">
									<tr>
										<td colspan="12" style="text-align: center;">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="vo" items="${companyAllList}">
									<tr style="text-align: center">
										<td><a
											href='<c:url value="/administrator/company/companyCar.do?comId=${vo.comId}" />'>
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
				</div>
			</div>
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<nav>
						<ul class="pagination">
							<c:if test="${pagingInfo.firstPage>1}">
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
									<li class="active">
										<a href="#">${i}</a>
									</li>
								</c:if>
								
								<c:if test="${i!=pagingInfo.currentPage}">
									<li>
										<a href="#" onclick="pageFunc(${i})">${i}</a>
									</li>
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
						<input type="text" name="searchKeyword" title="검색어 입력"
							value="${param.searchKeyword}">
						<input type="submit" value="검색">
					</form>
				</div>
			</div>
		</div>		
	</div>
</div>
<%@ include file="../include/bottom.jsp"%>