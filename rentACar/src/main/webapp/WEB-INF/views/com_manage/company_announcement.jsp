<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>


<!-- 공지사항 -->
<div class="container">

	<div class="row">
		<div class="col-lg-8">
            <table class="table table-stripped table-bordered">
      <thead>
        <tr>
          <th>관리자 아이디</th>
          <th>글번호</th>
          <th>글제목</th>
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
					<tr <c:if test="${!empty vo.cnoticeDeldate }"> class="danger" </c:if>>
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
    <li>
      <a href="#" aria-label="Previous">
  		<div class="divPage container">
        <span aria-hidden="true">«</span>
			<%-- <c:if test="${pagingInfo.firstPage>1 }">
				<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> 
					<img src='${pageContext.request.contextPath}/images/first.JPG' alt="이전블럭으로">
				</a>
			</c:if>
	
			<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
				<c:if test="${i==pagingInfo.currentPage }">
					<span style="color: blue; font-weight: bold;">${i}</span>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<a href="#" onclick="pageFunc(${i})">[${i}]</a>
				</c:if>
			</c:forEach>
	
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
				<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> 
					<img src='${pageContext.request.contextPath}/images/last.JPG' alt="다음블럭으로">
				</a>
			</c:if> --%>
        <span aria-hidden="true">»</span>
		</div>
      </a>
    </li>
  </ul>
</nav>
        </div>
        <div class="col-md-4">
            <div class="pull-right">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    <span class="glypicon glyphicon glyphicon-plus"></span>
  Add User
</button>
</div>
        </div>
    </div>
    
    
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel">Add User</h4>
      </div>
      <div class="modal-body">
        <form>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group">
    <label for="exampleInputFile">File input</label>
    <input type="file" id="exampleInputFile">
    <p class="help-block">Example block-level help text here.</p>
  </div>
  <div class="checkbox">
    <label>
      <input type="checkbox"> Check me out
    </label>
  </div>
</form>
      </div>
    
    </div>
  </div>
</div>
		</div>
        <div class="col-lg-4">
            
        </div>
	</div>
</div>


<%@ include file="../inc_company/company_bottom.jsp" %>