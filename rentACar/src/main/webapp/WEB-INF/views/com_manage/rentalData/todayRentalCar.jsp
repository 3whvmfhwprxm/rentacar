<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc_company/company_top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/company.css/todayRentalCar.css"/>
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
		
		jQuery("#btMulti").click(function(){
			jQuery("#frmSend").attr("action","<c:url value='/com_manage/rentalData/multiUpdateStatusCgHold.do' />");
			jQuery("#frmSend").submit();
		});
	});
	
	function fncSort(val){
		jQuery("#sortingKeyword").val(val);
		jQuery("#frmPage").attr("action" , "<c:url value='/com_manage/rentalData/todayRentalCar.do'/>");
		jQuery("#frmPage").submit();
	}
	
	function cg(yn,carId,compId){
		jQuery("#ccarStatus").val(yn);
		jQuery("#ccarCarId").val(carId);
		jQuery("#comId").val(compId);
		jQuery("#frmSend").attr("action","<c:url value='/com_manage/rentalData/updateStatusCg.do' />");
		jQuery("#frmSend").submit();
	}
	
</script>
<body>
	<form id="frmPage" name="frmPage" method="POST"
		action='<c:url value="/com_manage/rentalData/todayRentalCar.do" />'>
		<input type="hidden" name="currentPage" value="${pagingInfo.currentPage }">
		<input type="hidden" name="searchCondition" value="${param.searchCondition}">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="sortingKeyword" id="sortingKeyword" value="${param.sortingKeyword }"/>
		<input type="hidden" name="" id="" value="" />
	</form>
	
	
    <div class="container" role="tabpanel">
        <legend>오늘 대여 차량 현황</legend>
       	<pre>
		<code>
		우리업체의 오늘 대여될 차량목록을 보여주며, 페이지당 15개의 목록을 보여줍니다.
		검색은 차량번호, 운전자명으로 가능하며 대소문자 구분없이 쓰셔도 검색이 됩니다.
		정렬기준 선택시 다양하게 목록 기준을 바꿀 수 있습니다.
		오늘 대여차량 목록에서 보내기 버튼을 클릭하여 대여중 목록으로 선택목록을 보낼 수있으며 
		보다 편하게 차량을 관리 할 수 있습니다.
		일괄처리를 위하여 체크박스 선택후 보내기 일괄처리 버튼을 클릭하면 일괄처리됩니다.
    	</code>
		</pre>
		        <!--dropdown menu-->
            <ul class="nav navbar-nav menu-list">
            	 <li class="dropdown list-category">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-navicon"></i> 정렬기준 <i class="fa fa-angle-down" aria-hidden="true"></i>
                    </a>
                    <ul class="dropdown-menu mega-dropdown-menu">
                    	<li><a href="javascript:fncSort('stDate')">대여시간순</a></li>
                    	<li><a href="javascript:fncSort('tStDate')">현시간 이후 대여건만 보기</a></li>
                    	<li><a href="javascript:fncSort('name')">운전자명순</a></li>
                        <li><a href="javascript:fncSort('carNum')">차량번호</a></li>
                    </ul>
                </li>
            </ul>
        <br><br>
        <!--table-->
         <!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active">
				<a href='<c:url value="/com_manage/rentalData/todayRentalCar.do"/>' aria-controls="todayRentalCar" role="tab">
					대여 현황 목록
				</a>
			</li>
			<li role="presentation">
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
			<li role="presentation" style="float:right" >
				<button id="btMulti">일괄처리</button>
			</li>
		</ul>
	<form id="frmSend" name="frmSend" method="POST">
		<input type="hidden" name="ccarStatus" id="ccarStatus">
		<input type="hidden" name="ccarCarId" id="ccarCarId">
		<input type="hidden" name="comId" id="comId">
       <table class="table table-striped">
       <thead>
       		  <colgroup>
	    		<col width="9%">
	    		<col width="10%">
	    		<col width="12%">
	    		<col width="10%">
	    		<col width="10%">
	    		<col width="12%">
	    		<col width="*%">
	    		<col width="9%">
	    		<col width="10%">
	    		<col width="8%">
    		</colgroup>
       		<tr>
    			<th>대여시간</th>
  				<th>차량번호</th>
				<th>모델명</th>
				<th>예약자명</th>
				<th>운전자명</th>
				<th>운전번호</th>
				<th>결제진행상태</th>
				<th>대여상태</th>
				<th>대여중으로</th>
				<th>일괄처리 <input type="checkbox"  name="chkAll"></th>
			</tr>
        </thead>
        <tbody>
        
		<c:if test="${empty rlist }">
			<td colspan="10">데이터가 없습니다.</td>
		</c:if>
		
		 
		<c:if test="${!empty rlist}">
			<!-- 반복시작 -->
			<c:set var="u" value="0" />
			<c:forEach var="map" items="${rlist }" varStatus="i">
				<c:if test="${map['CCAR_STATUS'] == 'HOLD' }"> 
				<tr>
					<td><fmt:formatDate value="${map['RESERV_START_DATE'] }" pattern="HH시 mm분"/></td>
					<td>${map['CCAR_CAR_ID'] }</td>
					<td>${map['CAR_NAME'] }</td>
					<td>${map['RES_U_NAME'] }</td>
					<td style="text-aglin:right">${map['RES_DRV_NAME'] }</td>
					<td style="text-aglin:left">${map['RES_DRV_TEL1'] }-${map['RES_DRV_TEL2'] }-${map['RES_DRV_TEL3'] }</td>
					<c:if test="${map['PAY_CONDITION'] == 'paid' }">
		        		<td class="line">결제완료</td>
		        	</c:if>
		        	<c:if test="${map['PAY_CONDITION'] == 'ready' }">
		        		<td class="line">미결제</td>
		        	</c:if>
		        	<c:if test="${map['PAY_CONDITION'] == 'cancelled' }">
		        		<td class="line">결제취소</td>
		        	</c:if>
		        	<c:if test="${map['PAY_CONDITION'] == 'failed' }">
		        		<td class="line">결제실패</td>
		        	</c:if>
		        	<c:if test="${empty map['PAY_CONDITION'] }">
		        		<td class="line">결제미정</td>
		        	</c:if>		
		        	<td>${map['CCAR_STATUS'] }</td>
		        	<td><button id="bt_${i.index }" onclick="javascript:cg('${map['CCAR_STATUS']}','${map['CCAR_CAR_ID'] }','${sessionScope.comId }')">보내기</button></td>
		        	<td><input type="checkbox"  id="chk_${u}" name="cCarItems[${u}].ccarCarId" value="${map['CCAR_CAR_ID'] }"/></td>
				</tr>
				</c:if>
				<c:set var="u" value="${u+1 }" />
		 	<!-- 반복끝 --> 
	        </c:forEach>
        </c:if>
        
        
        </tbody>
    </table>
	</form>    
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
					action="<c:url value="/com_manage/rentalData/todayRentalCar.do" />">
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


