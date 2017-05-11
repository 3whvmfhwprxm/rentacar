<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc_company/company_top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/company.css/rentalIngCar.css"/>
<style type="text/css">
	table tr th{
		background-color: #c9c9c9;
		text-align: center;
	}
	table tr td{
		text-align: center;
	}

	.nav nav-tabs{
		text-align: right;
		float: right;
	}
	
</style>
<script type="text/javascript">
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
	
	jQuery(document).ready(function(){
		jQuery("input[name='chkAll']").click(function(){
			jQuery("tbody input[type=checkbox]").prop("checked", this.checked);
		});	
		jQuery("#frmSearch").submit(function(){
			if(jQuery("#searchCondition").val()=='0'){
				alert('옵션을 선택하세요.');
				return false;
			}
			return true;
		});
	});
	
	function fncSort(val){
		jQuery("#sortingKeyword").val(val);
		jQuery("#frmPage").attr("action" , "<c:url value='/com_manage/rentalData/rentalIngCar.do'/>");
		jQuery("#frmPage").submit();
	}
	
	function cg(yn,carId,compId){
		jQuery("#ccarStatus").val(yn);
		jQuery("#ccarCarId").val(carId);
		jQuery("#comId").val(compId);
		jQuery("#frmUse").attr("action","<c:url value='/com_manage/rentalData/updateStatusCg.do' />");
		jQuery("#frmUse").submit();
	}

	
</script>
<body>
	<form id="frmPage" name="frmPage" method="POST"
		action='<c:url value="/com_manage/company_ccarList.do" />'>
		<input type="hidden" name="currentPage" value="${pagingInfo.currentPage }">
		<input type="hidden" name="searchCondition" value="${param.searchCondition}">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="sortingKeyword" id="sortingKeyword" value="${param.sortingKeyword }"/>
	</form>
	<form id="frmUse" name="frmUse" method="POST">
		<input type="hidden" name="ccarStatus" id="ccarStatus">
		<input type="hidden" name="ccarCarId" id="ccarCarId">
		<input type="hidden" name="comId" id="comId">
	</form>
    <div class="container" role="tabpanel">
        <legend>현재 대여중인 차량 현황</legend>
       	<pre>
		<code>
		우리업체의 현재 대여 중인 차량목록을 보여주며, 페이지당 15개의 목록을 보여줍니다.
		검색은 차량번호, 운전자명으로 가능하며 대소문자 구분없이 쓰셔도 검색이 됩니다.
		정렬기준 선택시 다양하게 목록 기준을 바꿀 수 있습니다.
		열기 버튼 클릭시 운전자 및 예약자의 상세정보를 볼 수 있습니다.
    	</code>
		</pre>
		        <!--dropdown menu-->
            <ul class="nav navbar-nav menu-list">
            	 <li class="dropdown list-category">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-navicon"></i> 정렬기준 <i class="fa fa-angle-down" aria-hidden="true"></i>
                    </a>
                    <ul class="dropdown-menu mega-dropdown-menu">
                    	<li><a href="javascript:fncSort('carNum')">차량번호순</a></li>
                    	<li><a href="javascript:fncSort('name')">운전자명순</a></li>
                    	<li><a href="javascript:fncSort('lateCar')">연체차량만 보기</a></li>
                    </ul>
                </li>
            </ul>
        <br><br>
        <!--table-->
         <!-- Nav tabs -->
		<ul class="nav nav-tabs text-right" role="tablist">
			<li role="presentation">
				<a href='<c:url value="/com_manage/rentalData/todayRentalCar.do"/>' aria-controls="todayRentalCar" role="tab">
					대여 현황 목록
				</a>
			</li>
			<li role="presentation" class="active">
				<a href='<c:url value="/com_manage/rentalData/rentalIngCar.do"/>' aria-controls="RentalIngCar" role="tab">
					대여중 현황 목록
				</a>
			</li>
			<li role="presentation">
				<a href='<c:url value="/com_manage/rentalData/todayReturnCar.do"/>' aria-controls="todayReturnCar" role="tab">
					반납 현황 목록
				</a>
			</li>
			<li role="presentation">
				<a href='<c:url value="/com_manage/rentalData/endRentalCar.do"/>' aria-controls="endRentalCar" role="tab">
					반납완료 현황 목록
				</a>
			</li>
		</ul>
       <table class="table table-striped">
       <thead>
       		  <colgroup>
       		  	<col width="10%">
	    		<col width="10%">
	    		<col width="10%">
	    		<col width="10%">
	    		<col width="10%">
    		</colgroup>
       		<tr>
  				<th>차량번호</th>
				<th>모델명</th>
				<th>운전자명</th>
				<th>운전자 상세정보</th>
				<th>대여상태</th>
				<th>반납일자</th>
			</tr>
        </thead>
        <tbody>
        
		<c:if test="${empty rlist }">
			<td colspan="10">데이터가 없습니다.</td>
		</c:if>
		
		
		<c:if test="${!empty rlist }">
			<!-- 반복시작 -->
			<c:set var="u" value="0" />
			<c:forEach var="map" items="${rlist }">
			<c:if test="${map['CCAR_STATUS'] == 'RENT' }"> 
				<tr>
					<td>${map['CCAR_CAR_ID'] }</td>
					<td>${map['CAR_NAME'] }</td>
					<td>${map['RES_DRV_NAME'] }</td>
					<td><button>열기</button></td>
					<td>${map['CCAR_STATUS'] }</td>
					<td><fmt:formatDate value="${map['RESERV_END_DATE'] }" pattern="yyyy-MM-dd HH:mm"/></td>
				</tr>
			</c:if>
		 	<!-- 반복끝 --> 
	        </c:forEach>
	        
        </c:if>
        
        </tbody>
    </table>
    
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
				<form name="frmSearch" id="frmSearch" method="post"
					action="<c:url value="/com_manage/rentalData/rentalIngCar.do" />">
					<select name="searchCondition" id="searchCondition">
						<option value='0'>::선택::</option>
						<option value="ccar_car_id"
							<c:if test="${'ccar_car_id'==param.searchCondition}">
		           		selected            	
		           	</c:if>>차량번호</option>
						<option value="res_drv_name"
							<c:if test="${'res_drv_name'==param.searchCondition}">
		           		selected            	
		           	</c:if>>운전자이름</option>
					</select> <input type="text" name="searchKeyword" title="검색어 입력"
						value="${param.searchKeyword}" placeholder="검색어 입력"> <input type="submit"
						value="검색" class="btn btn-primary btn-sm btn3d">
				</form>
			</div>
		</div>
	</div>
	
</div>




<%@ include file="../../inc_company/company_bottom.jsp" %>


