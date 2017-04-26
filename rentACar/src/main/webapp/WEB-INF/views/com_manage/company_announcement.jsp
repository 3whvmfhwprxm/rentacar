<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp"%>
<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
<style>
.row{
	margin-left: 110px;
}
 table{
 	font-family: 'Hanna'; 
 	font-size: 18px;
}
.table table-stripped table-bordered{
	font-family: 'Nanum Brush Script';
}
.divPage container{
	font-size: 10px;
}
</style>

<!-- 공지사항 -->
<!-- 페이지 처리용 폼 -->
	<form name="frmPage" method="post" action='<c:url value="/com_manage/company_announcement.do" />'>
		<input type="hidden" name="currentPage"> 
		<input type="hidden" name="searchCondition" value="${param.searchCondition}"> 
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	</form>
	
<section id="contact"><br>
<div class="container">

	<div class="row">
		<div class="col-lg-10">
			<table class="table table-stripped table-bordered">
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>관리자 아이디</th>
						<th>작성시간</th>
						<th>조회수</th>
					</tr>
				</thead>

				<tbody>
					<c:if test="${empty cnList}">
						<tr>
							<td colspan="8" class="align_center">공지사항이 존재하지 않습니다.</td>
						</tr>
					</c:if>

					<c:if test="${!empty cnList }">
						<c:forEach var="vo" items="${cnList }">
							<tr
								<c:if test="${!empty vo.cnoticeDeldate }"> class="danger" </c:if>>
								<td>${vo.cnoticeNo }</td>
								<td><a href='<c:url value="#" />'>${vo.cnoticeTitle }</a></td>
								<td>${vo.adminId }</td>
								<td>${vo.cnoticeRegdate }</td>
								<td>${vo.cnoticeReadcount }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<div class="row">
				<div class="col-md-8">
					<nav>
						<ul class="pagination">
							
									<div class="divPage container">
										<c:if test="${pagingInfo.firstPage>1 }">
											<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
												<img
												src='${pageContext.request.contextPath}/images/first.JPG'
												alt="이전블럭으로">
											</a>
										</c:if>

										<c:forEach var="i" begin="${pagingInfo.firstPage}"
											end="${pagingInfo.lastPage}">
											<c:if test="${i==pagingInfo.currentPage }">
												<span>${i}</span>
											</c:if>
											<c:if test="${i!=pagingInfo.currentPage }">
												<a href="#" onclick="pageFunc(${i})">[${i}]</a>
											</c:if>
										</c:forEach>

										<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
											<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
												<img
												src='${pageContext.request.contextPath}/images/last.JPG'
												alt="다음블럭으로">
											</a>
										</c:if>
										
									</div>
							</a></li>
						</ul>
					</nav>
				</div>


				</form>
				<div class="divSearch container">
			<form name="frmSearch" method="post"
				action="<c:url value="/com_manage/company_announcement.do" />">
				<select name="searchCondition">				
					<option value="cnotice_title"
						<c:if test="${'cnotice_title'==param.searchCondition}">
	            		selected            	
	            	</c:if>>제목</option>
	            	
					<option value="cnotice_content"
						<c:if test="${'cnotice_content'==param.searchCondition}">
	            		selected            	
	            	</c:if>>내용</option>
	            	
	            	<option value="admin_id"
						<c:if test="${'admin_id'==param.searchCondition}">
	            		selected            	
	            	</c:if>>작성자</option>	            	
				</select> 
				<input type="text" name="searchKeyword" title="검색어 입력"	value="${param.searchKeyword}"> 
				<input type="submit" value="검색" class="btn-default btn3d">
				
				
			</form>
			</div>

		</div>
	</div>
</div>
</div>
</div>
</div>
</section>

<%@ include file="../inc_company/company_bottom.jsp"%>