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
.col-md-8 {
 padding-top: 6px;
}
.container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}
.row1{margin-left: 100px;}
.row{margin-right: 25px; 
	margin-left: -15px;
}
.pagination {
    display: inline-block;
    padding-left: 0;
    margin: 0px 0;
    border-radius: 4px;	
}
select{
	height: 26px;
	margin-right: 10px;
}
th,td{text-align: center;}
.table>tbody>tr.danger>td, .table>tbody>tr.danger>th, .table>tbody>tr>td.danger, .table>tbody>tr>th.danger, .table>tfoot>tr.danger>td, .table>tfoot>tr.danger>th, .table>tfoot>tr>td.danger, .table>tfoot>tr>th.danger, .table>thead>tr.danger>td, .table>thead>tr.danger>th, .table>thead>tr>td.danger, .table>thead>tr>th.danger {
    background-color: #FFFFFF;
}
.table table-stripped table-bordered{
	font-family: 'kopubbatang';
}
.divPage container{	font-size: 10px;}
.a1{
    color: #337ab7;
    text-decoration: none;
    font-size: 20px;
}
.a2{
	color: red;
	font-size: 20px;
}

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
	<div class="row1">
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
								<td><a data-toggle="modal" href="#myModal1">${vo.cnoticeTitle }</a></td>
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
							<span class="a2">${i}</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<a class="a1" href="#" onclick="pageFunc(${i})">[${i}]</a>
						</c:if>
					</c:forEach>

					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
						<a class="a1" href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
							<img
							src='${pageContext.request.contextPath}/images/last.JPG'
							alt="다음블럭으로">
						</a>
					</c:if>
				</div>
		<div class="divSearch container">
			<form name="frmSearch" id="frmSearch" method="post"
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
				<input type="submit" value="검색" class="btn btn-primary btn-sm btn3d">
			</form>
		</div>
			</div>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
		<div class="modal fade" id="myModal1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">공지사항 상세보기</h4>
					</div>
					<div class="modal-body">
						<form method="post" name="login_form" id="frmid">
						<c:if test="${!empty cnList }">
							
							<div class="row">
					            <label class="control-label col-md-3" for="name" 
					            	style="text-align: right;">번호<span class="required">*</span>					            </label>
					            <div class="col-md-5">
					              <input id="title" name="title" class="form-control" 
						              data-validate-length-range="6" data-validate-words="2" 
						              name="name"  required="required" type="text" value="${vo.cnoticeNo }">
					            </div>
					        </div><br>
							<div class="row">
					            <label class="control-label col-md-3" for="name" 
					            	style="text-align: right;">제목 <span class="required">*</span>					            </label>
					            <div class="col-md-5">
					              <input id="title" name="title" class="form-control" 
						              data-validate-length-range="6" data-validate-words="2" 
						              name="name"  required="required" type="text" value="${vo.cnoticeTitle }">
					            </div>
					        </div><br>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" 
					            style="text-align: right;">작성자<span class="required">*</span>
					            </label>
					            <div class="col-md-5">
					              <input id="admin" name="admin" class="form-control" 
					              data-validate-length-range="6" data-validate-words="2" 
					              name="name"  required="required" type="text" value="${vo.adminId }">
					            </div>
					        </div><br>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" 
					            style="text-align: right;">작성시간 <span class="required">*</span>					            </label>
					            <div class="col-md-5">
					              <input id="title" name="title" class="form-control" 
					              data-validate-length-range="6" data-validate-words="2" 
					              name="name"  required="required" type="text" value="${vo.cnoticeRegdate }">
					            </div>
					        </div><br>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" 
					            	style="text-align: right;">내용<span class="required">*</span>					            </label>
					            <div class="col-md-5">
					              <input id="title" name="title" class="form-control"
					              	data-validate-length-range="6" data-validate-words="2" 
					              	name="name"  required="required" type="text" value="${vo.cnoticeReadcount }">
					            </div>
					        </div><br>
						</form>
					</div>
					
					</c:if>
					<!-- <form name="frmid" method="post" action="<c:url value="/user/userseachid.do"/>"> -->
						<div class="modal-footer">
			           		 <button type="button" class="btn btn-primary" id="idSearch" data-dismiss="modal">확인</button>
						</div>
					<!-- </form> -->
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</div>
</div>
<!-- /.modal -->



</section>

<%@ include file="../inc_company/company_bottom.jsp"%>