<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>

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

.col-md-4 ul li {
	display: inline-block;
}

.col-md-4 {
	float: left;
	width: 100%;
	margin: 0 auto;
	text-align: center;
	display: inline-block;
}
</style>
<div class="divList container">
	<h2>차량 모델</h2>
	<form name="frmPage" method="post"
		action='<c:url value="/administrator/carModel/modelList.do" />'>
		<input type="hidden" name="currentPage">
		<input type="hidden" name="searchCondition" value="${param.searchCondition}">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	</form>
	<div class="divList">
		<table class="table table-hover table-bordered" summary="차량정보에 관한 테이블">
			<thead>
				<tr>
					<th scope="col">코드</th>
					<th scope="col">모델명</th>
					<th scope="col">제조사</th>
					<th scope="col">연료</th>
					<th scope="col">승차인원</th>
					<th scope="col">출시년도</th>
					<th scope="col">변속기</th>
					<th scope="col">등록일</th>
					<th scope="col">차량유형</th>
					<th scope="col">이미지1</th>
					<th scope="col">이미지2</th>
					<th scope="col">이미지3</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty carList}">
					<tr>
						<td colspan="12" class="align_center">데이터가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="vo" items="${carList}">
					<tr style="text-align: center">
						<td><a
							href='<c:url value="/administrator/carModel/modelDetail.do?carCode=${vo.carCode}" />'>
								${vo.carCode}</a></td>
						<td style="text-align: center">${vo.carName}</td>
						<td>${vo.carInc}</td>
						<td>${vo.carFuel}</td>
						<td>${vo.carSize}</td>
						<td>${vo.carYear}</td>
						<td>${vo.carTrans}</td>
						<td><fmt:formatDate value="${vo.carRegdate}"
								pattern="yyyy-MM-dd" /></td>
						<td>${vo.carType}</td>
						<td>${vo.carImg1}</td>
						<td>${vo.carImg2}</td>
						<td>${vo.carImg3}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<nav>
				<ul class="pagination">
					<c:if test="${pagingInfo.firstPage>1}">
						<li><a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"
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

	<div class="col-md-4"></div>
	<div>
		<button type="button" class="btn btn-primary">Register</button>
	</div>

	<div class="divSearch">
		<form name="frmSearch" method="post"
			action="<c:url value="/administrator/carModel/modelList.do" />">
			<select name="searchCondition">
				<option value="car_name"
					<c:if test="${'car_name'==param.searchCondition}">
           		selected            	
           	</c:if>>모델명</option>
				<option value="car_inc"
					<c:if test="${'car_inc'==param.searchCondition}">
           		selected            	
           	</c:if>>제조사</option>
           		<option value="car_size"
					<c:if test="${'car_size'==param.searchCondition}">
           		selected            	
           	</c:if>>승차인원</option>
			</select> 
				<input type="text" name="searchKeyword" title="검색어 입력"
				value="${param.searchKeyword}">
				<input type="submit" value="검색">
		</form>
	</div>
</div>
</body>
</html>