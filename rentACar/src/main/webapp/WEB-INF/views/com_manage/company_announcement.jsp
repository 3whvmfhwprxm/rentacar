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
.btn3d {
    position:relative;
    top: -6px;
    border:0;
     transition: all 40ms linear;
     margin-top:10px;
     margin-bottom:10px;
     margin-left:2px;
     margin-right:2px;
}
.btn3d:active:focus,
.btn3d:focus:hover,
.btn3d:focus {
    -moz-outline-style:none;
         outline:medium none;
}
.btn3d:active, .btn3d.active {
    top:2px;
}
.btn3d.btn-white {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255,255,255,0.10) inset, 0 8px 0 0 #f5f5f5, 0 8px 8px 1px rgba(0,0,0,.2);
    background-color:#fff;
}
.btn3d.btn-white:active, .btn3d.btn-white.active {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,.1);
    background-color:#fff;
}
.btn3d.btn-default {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255,255,255,0.10) inset, 0 8px 0 0 #BEBEBE, 0 8px 8px 1px rgba(0,0,0,.2);
    background-color:#f9f9f9;
}
.btn3d.btn-default:active, .btn3d.btn-default.active {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,.1);
    background-color:#f9f9f9;
}
.btn3d.btn-primary {
    box-shadow:0 0 0 1px #417fbd inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #4D5BBE, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#4274D7;
}
.btn3d.btn-primary:active, .btn3d.btn-primary.active {
    box-shadow:0 0 0 1px #417fbd inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color:#4274D7;
}
.btn3d.btn-success {
    box-shadow:0 0 0 1px #31c300 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #5eb924, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#78d739;
}
.btn3d.btn-success:active, .btn3d.btn-success.active {
    box-shadow:0 0 0 1px #30cd00 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #78d739;
}
.btn3d.btn-info {
    box-shadow:0 0 0 1px #00a5c3 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #348FD2, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#39B3D7;
}
.btn3d.btn-info:active, .btn3d.btn-info.active {
    box-shadow:0 0 0 1px #00a5c3 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #39B3D7;
}
.btn3d.btn-warning {
    box-shadow:0 0 0 1px #d79a47 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #D79A34, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#FEAF20;
}
.btn3d.btn-warning:active, .btn3d.btn-warning.active {
    box-shadow:0 0 0 1px #d79a47 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #FEAF20;
}
.btn3d.btn-danger {
    box-shadow:0 0 0 1px #b93802 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #AA0000, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#D73814;
}
.btn3d.btn-danger:active, .btn3d.btn-danger.active {
    box-shadow:0 0 0 1px #b93802 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #D73814;
}
.btn3d.btn-magick {
    color: #fff;
    box-shadow:0 0 0 1px #9a00cd inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #9823d5, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#bb39d7;
}
.btn3d.btn-magick:active, .btn3d.btn-magick.active {
    box-shadow:0 0 0 1px #9a00cd inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #bb39d7;
}

#contact{ 
  width: 100%;
  width: 100vw;
  background: #3a6186; /* fallback for old browsers */
  background: -webkit-linear-gradient(to left, #3a6186 , #89253e); /* Chrome 10-25, Safari 5.1-6 */
  background: linear-gradient(to left, #3a6186 , #89253e); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */ 
 }
 table{
 	font-family: 'Hanna'; 
 	color: white;
 	font-size: 18px;
 	background-color: black;
 }
</style>

<!-- 공지사항 -->
<!-- 페이지 처리용 폼 -->
	<form name="frmPage" method="post" action='<c:url value="/com_manage/company_announcement.do" />'>
		<input type="text" name="currentPage"> 
		<input type="text" name="searchCondition" value="${param.searchCondition}"> 
		<input type="text" name="searchKeyword" value="${param.searchKeyword}">
	</form>
	
<section id="contact"><br>
<div class="container">

	<div class="row">
		<div class="col-lg-8">
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
												<span style="color: blue; font-weight: bold;">${i}</span>
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