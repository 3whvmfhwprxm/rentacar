<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp" %>

<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
	<form name="frmPage" method="post" action='<c:url value="/inc_user/confirm.do" />'>
		<input type="hidden" name="currentPage">
	</form>
	<div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">${sessionScope.userId} 님</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr class="filters">
                        <th><input type="text" class="form-control" placeholder="예약번호" disabled></th>
                        <th><input type="text" class="form-control" placeholder="회원아이디" disabled></th>
                        <th><input type="text" class="form-control" placeholder="대여시작일" disabled></th>
                        <th><input type="text" class="form-control" placeholder="대여시작시간" disabled></th>
                        <th><input type="text" class="form-control" placeholder="반납일" disabled></th>
                        <th><input type="text" class="form-control" placeholder="반납시간" disabled></th>
                        <th><input type="text" class="form-control" placeholder="업체보유차량" disabled></th>
                        <th><input type="text" class="form-control" placeholder="보험여부" disabled></th>
                        <th><input type="text" class="form-control" placeholder="예약일시" disabled></th>
                        <th><input type="text" class="form-control" placeholder="전화번호" disabled></th>
                    </tr>
                </thead>
                <tbody>
                <c:if test="${empty alist}">
				  	<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
				</c:if> 
                	<c:forEach var="vo" items="${alist }">
                    <tr>
                        <td>${vo.reservNum}</td>
                        <td>${sessionScope.userId}</td>
                        <td>${vo.reservStartDate}</td>
                        <td>${vo.reservStartTime} 시</td>
                        <td>${vo.reservEndDate}</td>
                        <td>${vo.reservEndTime} 시</td>
                        <td>${vo.ccarCarId}</td>
                        <td>${vo.reservInsurance}</td>
                        <td>${vo.reservDate}</td>
                        <td>${vo.userTel1}-${vo.userTel2}-${vo.userTel3}</td>
                    </tr>
                	</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<nav>
				<ul class="pagination">
					<c:if test="${pagingInfo.firstPage>1 }">
						<li><a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
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
<%@ include file="bottom.jsp" %>