<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>

<script type="text/javascript">
	$(function(){
		$("input[name='chkAll']").click(function(){
			$("tbody input[type=checkbox]").prop("checked", this.checked);
		});
		
		$("#btWithdrawMulti").click(function(){	
			if($("tbody input[type=checkbox]:checked").length==0){
				alert("탈퇴처리할 업체를 선택해주세요.");
				return;
			}else if(confirm("정말로 탈퇴처리하시겠습니까? 탈퇴 처리 시 해당 업체는 탈퇴업체리스트로 이동합니다.")){
				$("#frmList").prop("action", 
					"<c:url value='/administrator/company/companyMultiWithdraw.do'/>");
				$("#frmList").submit();
			}
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
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchCondition" value="${param.searchCondition}"> <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>

<div class="w3-container">
	<h3>업체페이지 가이드</h3>

	<pre>
		<code>
		현재 등록된 업체 리스트와 탈퇴업체 리스트, 업체보유차량 리스트를 보여줍니다.
		아이디 버튼을 누르면 해당 아이디업체의 상세정보를 보여줍니다. 
		검색은 아이디, 이름으로 가능하며 아이디는 대소문자 구분없이 쓰셔도 검색이 됩니다.
		업체등록 버튼을 클릭하시면 업체등록 페이지로 이동합니다.
    	</code>
	</pre>

	<br>

	<div role="tabpanel">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a
				href='<c:url value="/administrator/company/companyList.do" />'
				aria-controls="companyInList" role="tab"> 업체 리스트 </a></li>

			<li role="presentation"><a
				href='<c:url value="/administrator/company/companyOutList.do" />'
				aria-controls="companyOutList" role="tab"> 탈퇴업체 리스트 </a></li>

			<li role="presentation"><a
				href='<c:url value="/administrator/company/companyCarList.do" />'
				aria-controls="companyCarList" role="tab"> 업체보유차량 리스트 </a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div style="float: right;">
				<a
					href='<c:url value="/administrator/company/companyRegister.do" />'>
					<button type="button" class="btn btn-default btn-lg"
						style="color: black;">업체 등록</button>
				</a>
				<button type="button" class="btn btn-default btn-lg"
					id="btWithdrawMulti" style="color: black;">업체 탈퇴</button>
			</div>
			<!-- ★★★★★★★★★★업체 리스트★★★★★★★★★★ -->
			<div role="tabpanel" class="tab-pane active" id="companyInList">
				<div class="row">
					<div class="col-md-12">
						<br>
						<form name="frmList" id="frmList" method="post"
							action='<c:url value="/administrator/company/companyList.do" />'>
							<table class="table table-hover">
								<thead>
									<tr class="info">
										<th><input type="checkbox" name="chkAll"></th>
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
									</tr>
								</thead>

								<tbody>
									<c:if test="${empty companyInList}">
										<tr>
											<td colspan="12" style="text-align: center;">데이터가 존재하지
												않습니다.</td>
										</tr>
									</c:if>
									
									<c:set var="i" value="0" />
									<c:forEach var="vo" items="${companyInList}">
										<tr style="text-align: center">
											<td><input type="checkbox" id="chk_${i}"
												name="companyItems[${i}].comId" value="${vo.comId}">
											</td>
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
										</tr>
										<c:set var="i" value="${i+1}" />
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
				</div>
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
								<li><a href="#"
									onclick="pageFunc(${pagingInfo.lastPage+1})" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
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
						action="<c:url value="/administrator/company/companyList.do" />">
						<select name="searchCondition">
							<option value="com_id"
								<c:if test="${'com_id'==param.searchCondition}">
		            				selected            	
		            			</c:if>>업체
								아이디</option>
							<option value="com_name"
								<c:if test="${'com_name'==param.searchCondition}">
		            				selected            	
		            			</c:if>>업체명
							</option>
						</select> <input type="text" name="searchKeyword" title="검색어 입력"
							value="${param.searchKeyword}"> <input type="submit"
							value="검색">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/bottom.jsp"%>