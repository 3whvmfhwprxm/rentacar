<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin_companyCar.css" />


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

.bodyClass {
	padding-top: 30px;
	width: 85%;
	padding-left: 40px;
}
</style>

<form name="frmPage" method="post"
	action='<c:url value="/administrator/company/companyCarList.do" />'>
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchCondition" value="${param.searchCondition}"> <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>

<div class="bodyClass">
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
				<li role="presentation"><a
					href='<c:url value="/administrator/company/companyList.do" />'
					aria-controls="companyInList" role="tab"> 업체 리스트 </a></li>

				<li role="presentation"><a
					href='<c:url value="/administrator/company/companyOutList.do" />'
					aria-controls="companyOutList" role="tab"> 탈퇴업체 리스트 </a></li>

				<li role="presentation" class="active"><a
					href='<c:url value="/administrator/company/companyCarList.do" />'
					aria-controls="companyCarList" role="tab"> 업체보유차량 리스트 </a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div style="float: right;">
					<a
						href='<c:url value="/administrator/company/companyRegister.do" />'>
						<button type="button" class="btn btn-info btn-lg btn-block"
							style="color: black;">업체 등록</button>
					</a>
				</div>
				<!-- <!-- ★★★★★★★★★★업체보유차량 리스트★★★★★★★★★★ -->
				<div role="tabpanel" class="tab-pane active" id="companyCarList">
					<div class="row">
						<div class="col-md-12">
							<br>
							<c:if test="${empty companyAllList}">
								<p>데이터가 존재하지 않습니다.</p>
							</c:if>
							<c:if test="${!empty companyAllList}">
								<c:forEach var="vo" items="${companyAllList}">
									<div class="col-sm-6">
										<div
											class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
											<div class="media" style="height: 250px;">
												<a class="pull-left"
													href='<c:url value="/administrator/company/companyCar.do?comId=${vo.comId}" />'
													target="_parent"> <img
													style="width: 300px; height: 250px;" alt="image"
													class="img-responsive"
													src='<c:url value="/companyLogo_upload/${vo.comLogo}" />'>
												</a>
												<div class="clearfix visible-sm"></div>

												<div class="media-body fnt-smaller">
													<a href="#" target="_parent"></a>


													<p class="hidden-xs">
														<span style="font-size: 1.4em; font-weight: bold;">
															업체 정보
														</span><br><br>
														<b>업체명:</b> ${vo.comName}<br>
														<b>대표자:</b> ${vo.comCeo}<br>
														<b>대표번호:</b> ${vo.comTel1}-${vo.comTel2}-${vo.comTel3}
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<!-- 반복 끝 -->
							</c:if>
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
							action="<c:url value="/administrator/company/companyCarList.do" />">
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
</div>
<%@ include file="../include/bottom.jsp"%>