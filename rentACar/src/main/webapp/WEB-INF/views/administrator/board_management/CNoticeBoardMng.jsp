<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript">	
	$().ready(function(){
		$("input[name='chkAll']").click(function(){				
			$("tbody input[type=checkbox]").prop("checked", this.checked);
		});
		
		$("#bt_cNoMultiHide").click(function(){	
			if($('tbody input:checkbox:checked').length==0){
				alert("감추기할 공지를 하나라도 선택하셔야 합니다");
				return;
			}else if(confirm("해당 공지들을 감추기 처리 하시겠습니까?")){
				$("#cnoticeFrm").attr("action","<c:url value='/admin/Board/comNoticeVisibleMultiNo.do' />");
				$("#cnoticeFrm").submit();	
			}											
		});
		
		$("#bt_cNoInsert").click(function(){
			location.href="<c:url value='/admin/Board/comNoticeInsert.do' />";
		});
	});

	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
<style>
.bodyClass {
	padding-top: 30px;
	width: 80%;
	padding-left: 40px;
}

th, td {
	text-align: center;
}

th {
	background-color: #EEEEEE;
}

.col-md-4 {
	float: left;
	width: 100%;
	margin: 0 auto;
	text-align: center;
}
</style>
<div class="w3-container bodyClass">
	<h3>
		<i class="fa fa-list"></i>&nbsp; 업체용 공지 게시판 관리
	</h3>
	<!-- 페이지 처리용 폼 -->
	<form name="frmPage" method="post"
		action='<c:url value="/admin/Board/cNotice.do" />'>
		<input type="hidden" name="currentPage"> <input type="hidden"
			name="searchCondition" value="${param.searchCondition}"> <input
			type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	</form>

	<pre>
* 업체에 공지사항를 보여주며, 페이지당 10개의 목록을 보여줍니다.
* 검색은 제목, 내용, 작성자(관리자ID)로 검색이 가능합니다.
* 관리자는 공지는 감추기 또는 보이기 처리 할 수도 있습니다.
* 관리자는 공지를 삭제하실 수 도 있습니다. 삭제된 공지는 빨간색으로 표시됩니다.
</pre>

	<form name="cnoticeFrm" id="cnoticeFrm" method="post">
		<!-- 테이블 화면 시작 -->
		<table class="table table-hover">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성관리자</th>
				<th>조회수</th>
				<th>등록일</th>
				<th>삭제여부</th>
				<th>노출여부</th>
				<th>감추기 <input type="checkbox" id="chkAll" name="chkAll"></th>
			</tr>

			<c:if test="${empty cnList}">
				<tr>
					<td colspan="8" class="align_center">업체용 공지사항이 존재하지 않습니다.</td>
				</tr>
			</c:if>

			<c:set value="0" var="i" />
			<c:if test="${!empty cnList }">
				<c:forEach var="vo" items="${cnList }">
					<tr
						<c:if test="${!empty vo.cnoticeDeldate }"> class="danger" </c:if>>
						<td>${vo.cnoticeNo }</td>
						<td><c:if test="${empty vo.cnoticeDeldate }">
								<a
									href='<c:url value="/admin/Board/comNoticeEdit.do?cnoticeNo=${vo.cnoticeNo}" />'>
							</c:if> <c:if test="${fn:length(vo.cnoticeTitle)>30 }">
									${fn:substring(vo.cnoticeTitle, 0, 30) }...
							</c:if> <c:if test="${fn:length(vo.cnoticeTitle)<=30 }">
									${vo.cnoticeTitle}
							</c:if> <c:if test="${empty vo.cnoticeDeldate }">
								</a>
							</c:if></td>
						<td>${vo.adminId }</td>
						<td>${vo.cnoticeReadcount }</td>
						<td><fmt:formatDate value="${vo.cnoticeRegdate }"
								pattern="yyyy-MM-dd hh:mm" /></td>
						<td><c:if test="${!empty vo.cnoticeDeldate }">
								<fmt:formatDate value="${vo.cnoticeDeldate }"
									pattern="yyyy-MM-dd hh:mm" />에 삭제됨</c:if></td>
						<td>${vo.cnoticeVisible }</td>
						<td><c:if test="${vo.cnoticeVisible=='Y' }">
								<input type="checkbox" id="chk_${i }"
									name="cvolist[${i}].cnoticeNo" value="${vo.cnoticeNo }">
							</c:if></td>
					</tr>
					<c:set var="i" value="${i+1}" />
				</c:forEach>
			</c:if>
		</table>
		<!-- 11테이블 표시 끝 -->
		<div class="row">
			<div style="float: right;">
				<button type="button" class="btn btn-primary" id="bt_cNoInsert"
					name="bt_cNoInsert">공지글 작성</button>
				<button type="button" class="btn btn-primary" id="bt_cNoMultiHide"
					name="bt_cNoMultiHide">선택글 감추기</button>
			</div>
			
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
	</form>

	<div class="divSearch container">
		<div class="col-md-4">
			<form name="frmSearch" method="post"
				action="<c:url value="/admin/Board/cNotice.do" />">
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
				</select> <input type="text" name="searchKeyword" title="검색어 입력"
					value="${param.searchKeyword}"> <input type="submit"
					value="검색">
			</form>
		</div>
	</div>
</div>
</body>
</html>
