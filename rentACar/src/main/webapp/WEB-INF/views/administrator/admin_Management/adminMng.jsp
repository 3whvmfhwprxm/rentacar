<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<script type="text/javascript">	
	function pageFunc(curPage){
		document.searchFrm.currentPage.value=curPage;
		searchFrm.submit();
	}
</script>
<style>	
	th, td{text-align: center;}	
	.col-md-4 {
		float: left;
		width: 100%;
		margin: 0 auto;
		text-align: center;
	}
	.bodyClass{padding-top: 30px; width: 80%; padding-left: 80px;}
	th{background-color: #EEEEEE;}

</style>
<div class="w3-container bodyClass">
	<div>
	
	<!-- 페이지 처리용 폼 -->	
	<form name="searchFrm" method="post" action='<c:url value="/admin/Mng/adminList.do" />'>
		<input type="hidden" name="currentPage"> 
		<input type="hidden" name="searchCondition" value="${param.searchCondition}"> 
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	</form>
	
	<h3><i class="fa fa-cogs"></i> 관리자 명단</h3>
		
		<br>
	<h4>3조 렌터카의 관리자를 조회하시거나 추가 하실수 있습니다.</h4>
	<pre>
* 관리자 ID, 이름, 전화번호 끝자리로 검색하실 수 있습니다.
* 부관리자 이상 등급은 슈퍼관리자만 등록, 삭제 하실 수 있습니다.
* 조회된 관리자 목록에서 ID를 클릭하시면 해당 관리자 정보를 수정 하실 수 있습니다.</pre>
	<br>
	
		<table class="table table-hover">		
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
							<td>${vo.adminEmail}</td>
							<td>${authName }</td>
							<td>${vo.adminRegdate }</td>
							<td>${vo.adminOutdate }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		</div>
		
		<div class="row">
				<div class="col-md-11"></div>
				<div>
					<a href='<c:url value="/admin/Mng/adminJoin.do" />'>
						<button type="button" class="btn btn-primary">관리자 등록</button>
					</a>
				</div>
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

</div>
</body>
</html>