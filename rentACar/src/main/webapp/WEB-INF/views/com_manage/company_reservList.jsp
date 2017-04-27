<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<style type="text/css">
	table tr th{
		background-color: #c9c9c9;
		text-align: center;
	}
	
	table tr td{
		text-align: center;
	}
	

</style>
<!-- 업체 차량 조회 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
	
	function cg(yn,carId,compId){
		jQuery("#ccarUseYn").val(yn);
		jQuery("#ccarCarId").val(carId);
		jQuery("#comId").val(compId);
		jQuery("#frmUse").attr("action","<c:url value='/com_manage/updateCarUseYn.do' />");
		jQuery("#frmUse").submit();
	}
	
	function fncSort(val){
		jQuery("#sortingKeyword").val(val);
		jQuery("#frmPage").attr("action" , "<c:url value='/com_manage/company_ccarList.do'/>");
		jQuery("#frmPage").submit();
	}
	
</script>
<body>
	<form id="frmPage" name="frmPage" method="POST"
		action='<c:url value="/com_manage/company_ccarList.do" />'>
		<input type="hidden" name="currentPage" value="${pagingInfo.currentPage }">
		<input type="hidden" name="searchCondition" value="${param.searchCondition}">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="sortingKeyword" id="sortingKeyword" value="${param.sortingKeyword }"/>
		<input type="hidden" name="" id="" value="" />
	</form>
	<form id="frmUse" name="frmUse" method="POST">
		<input type="hidden" name="ccarUseYn" id="ccarUseYn">
		<input type="hidden" name="ccarCarId" id="ccarCarId">
		<input type="hidden" name="comId" id="comId">
	</form>
    <div class="container">
        <legend>예약 현황</legend>
        <!--dropdown menu-->
        <div class="collapse navbar-collapse" id="MainMenu">
            <ul class="nav navbar-nav menu-list">
            	 <li class="dropdown list-category">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-navicon"></i> 정렬기준 <i class="fa fa-angle-down" aria-hidden="true"></i>
                    </a>
                    <ul class="dropdown-menu mega-dropdown-menu">
                    	<li><a href="javascript:fncSort('date')">최근예약순</a></li>
                    	<li><a href="javascript:fncSort('num')">차량번호순</a></li>
                        <li><a href="javascript:fncSort('model')">차량모델순</a></li>
                        <li><a href="javascript:fncSort('fuel')">남은일수순</a></li>
                        <li><a href="javascript:fncSort('usey')">사용가능한 차량만 보기</a></li>
                        <li><a href="javascript:fncSort('usen')">정비중인 차량만 보기</a></li>
                    </ul>
                </li>
        <br><br>
        <!--table-->
       <table class="table table-striped">
       <thead>
       		<tr>
  				<th>차량번호</th>
				<th>모델명</th>
				<th>예약자이름</th>
				<th>전화번호</th>
				<th>결제금액</th>
				<th>대여일</th>
				<th>반납일</th>
				<th>대여일까지 남은일수</th>
				<th>예약취소</th>
			</tr>
        </thead>
        <tbody>
        <!-- 반복시작 -->
		<c:forEach var="map" items="${crList }" varStatus="i">
		
		<tr>
			<td>${map['CCAR_CAR_ID'] }</td>
			<td>${map['CAR_NAME'] }</td>
			<td>${map['RES_U_NAME'] }</td>
			<td>${map['RES_U_TEL1'] } - ${map['RES_U_TEL2'] } - ${map['RES_U_TEL3'] }</td>
			<td>${map['PAY_MONEY'] }</td>
			<td>${map['RESERV_START_DATE'] }</td>
			<td>${map['RESERV_END_DATE'] }</td>
			<td>${map['REMAININGDAY'] }</td>
			<td><button>취소</button></td>
		</tr>
	</c:forEach>
	 <!-- 반복끝 --> 
        
        
        </tbody>
    </table>
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
		<div class="divSearch">
				<form name="frmSearch" method="post"
					action="<c:url value="/com_manage/company_ccarList.do" />">
					<select name="searchCondition">
						<option value="com_id"
							<c:if test="${'com_id'==param.searchCondition}">
		           		selected            	
		           	</c:if>>차량번호</option>
						<option value="com_name"
							<c:if test="${'com_name'==param.searchCondition}">
		           		selected            	
		           	</c:if>>차량모델코드</option>
					</select> <input type="text" name="searchKeyword" title="검색어 입력"
						value="${param.searchKeyword}"> <input type="submit"
						value="검색">
				</form>
			</div>
		</div>
<%@ include file="../inc_company/company_bottom.jsp" %>