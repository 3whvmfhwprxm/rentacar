<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>

<script type="text/javascript">	
	$(document).ready(function(){
		$('#myTab a').click(function (e) {
			e.preventDefault()
			$(this).tab('show')
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

.bodyClass {
	padding-top: 30px;
	width: 85%;
	padding-left: 40px;
}
</style>

<form name="frmPage" method="post"
	action='<c:url value="/administrator/carModel/modelList.do" />'>
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchCondition" value="${param.searchCondition}"> <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>

<div class="bodyClass">
	<div class="w3-container">
		<h3>차량모델페이지 가이드</h3>

		<pre>
		<code>
		현재 등록된 차량모델 리스트를 보여줍니다.
		코드 버튼을 누르면 해당 코드차량의 상세정보를 보여줍니다. 
		검색은 모델명, 제조사, 승차인원으로 가능하며 아이디는 대소문자 구분없이 쓰셔도 검색이 됩니다.
		차량모델등록 버튼을 클릭하시면 차량모델등록 페이지로 이동합니다.
    	</code>
	</pre>

		<br>

		<div role="tabpanel">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#modelList"
					aria-controls="modelList" role="tab" data-toggle="tab"> 차량모델
						리스트 </a></li>
			</ul>
			<div style="float: right;">
				<a href='<c:url value="/administrator/carModel/modelRegister.do" />'>
					<button type="button" class="btn btn-info btn-lg btn-block"
						style="color: black;">차량모델 등록</button>
				</a>
			</div>
			<!-- Tab panes -->
			<div class="tab-content">

				<div role="tabpanel" class="tab-pane active" id="modelList">
					<div class="row">
						<div class="col-md-12">
							<br>
							<table class="table table-hover">
								<thead>
									<tr class="info">
										<th scope="col">코드</th>
										<th scope="col">모델명</th>
										<th scope="col">제조사</th>
										<th scope="col">승차인원</th>
										<th scope="col">변속기</th>
										<th scope="col">등록일</th>
										<th scope="col">차량유형</th>
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
											<td>${vo.carSize}</td>
											<td>${vo.carTrans}</td>
											<td><fmt:formatDate value="${vo.carRegdate}"
													pattern="yyyy-MM-dd" /></td>
											<td>${vo.carType}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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

				<div class="divSearch">
					<div class="col-md-4">
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