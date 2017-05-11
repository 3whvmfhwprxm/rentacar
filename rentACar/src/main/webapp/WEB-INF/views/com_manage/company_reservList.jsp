<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/company.css/company_reservList.css"/>
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
		jQuery("#frmPage").attr("action" , "<c:url value='/com_manage/company_reservList.do'/>");
		jQuery("#frmPage").submit();
	}
	
	jQuery(document).ready(function(){
		jQuery("tr").each(function(idx){
			jQuery("#tra"+idx).hide();
			jQuery("#trb"+idx).hide();
			
			jQuery("#bt"+idx).click(function(){
				jQuery("#tra"+idx).toggle();
				jQuery("#trb"+idx).toggle();
			});
		});
		
		jQuery("#frmSearch").submit(function(){
			if(jQuery("#searchCondition").val()=='0'){
				alert('옵션을 선택하세요.');
				return false;
			}
			return true;
		});
	});
	
	
		
	
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
    	
       	<pre>
		<code>
		우리업체의 현재 예약된 차량 리스트를 보여주며, 페이지당 15개의 목록을 보여줍니다.
		상세정보보기 버튼을 클릭하시면 해당 예약차량의 좀더 자세한 내용을 보여줍니다.
		예약취소는 해당 차량의 예약을 취소 시키며, 취소 철회는 되지않습니다.
		정렬기준 선택으로 리스트를 세분화 시킬수 있습니다.
		검색은 차량번호, 예약자명, 대여일, 반납일로 가능합니다.
    	</code>
		</pre>

        <!--dropdown menu-->
        <div class="collapse navbar-collapse" id="MainMenu">
            <ul class="nav navbar-nav menu-list">
            	 <li class="dropdown list-category">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-navicon"></i> 정렬기준 <i class="fa fa-angle-down" aria-hidden="true"></i>
                    </a>
                    <ul class="dropdown-menu mega-dropdown-menu">
                    	<li><a href="javascript:fncSort('stday')">오늘이후 대여될 차량만 보기</a></li>
                    	<li><a href="javascript:fncSort('paidCar')">결제완료 차량만 보기</a></li>
                        <li><a href="javascript:fncSort('reday')">남은일수순</a></li>
                        <li><a href="javascript:fncSort('rvAll')">차량예약현황 전체보기</a></li>
                    </ul>
                </li>
        <br><br>
        <!--table-->
       <table class="table table-striped">
       <thead>
       <colgroup>
    		<col width="10%">
    		<col width="10%">
    		<col width="8%">
    		<col width="13%">
    		<col width="13%">
    		<col width="10%">
    		<col width="10%">
    		<col width="10%">
    		<col width="10%">
    		<col width="8%">
    		<col width="5%">
    	</colgroup>
       		<tr>
  				<th>차량번호</th>
				<th>모델명</th>
				<th>예약자이름</th>
				<th>전화번호</th>
				<th>결제금액</th>
				<th>대여일</th>
				<th>반납일</th>
				<th>대여일까지 남은일수</th>
				<th>예약상세정보</th>
				<th>예약취소</th>
			</tr>
        </thead>
        <tbody>
        <!-- 반복시작 -->
        <c:if test="${empty crList }">
        	<tr>
        		<td colspan="10">데이터가 없습니다.</td>
        	</tr>
        </c:if>
        
		<c:forEach var="map" items="${crList }" varStatus="i">
		
		<tr>
			<td>${map['CCAR_CAR_ID'] }</td>
			<td>${map['CAR_NAME'] }</td>
			<td>${map['RES_U_NAME'] }</td>
			<td>${map['RES_U_TEL1'] }-${map['RES_U_TEL2'] }-${map['RES_U_TEL3'] }</td>
			<c:if test="${empty map['PAY_MONEY'] }">
				<td>0 원</td>
			</c:if>
			<c:if test="${!empty map['PAY_MONEY'] }">
				<td><fmt:formatNumber value="${map['PAY_MONEY'] }" pattern="#,###" /> 원</td>
			</c:if>
			<td><fmt:formatDate value="${map['RESERV_START_DATE'] }" pattern="yyyy-MM-dd HH:mm"/></td>
			<td><fmt:formatDate value="${map['RESERV_END_DATE'] }" pattern="yyyy-MM-dd HH:mm"/></td>
			<td>${map['REMAININGDAY'] } 일</td>
			<td><button id="bt${i.index }">열기/닫기</button></td>
			<td><button>취소</button></td>
		</tr>
		<tr id="tra${i.index }">
			<td><strong>${map['CCAR_CAR_ID'] } 예약상세정보</strong></td>
			<td></td>
        	<td><strong>예약자ID</strong></td>
        	<td><strong>운전자 이름</strong></td>
        	<td><strong>운전자 전화번호</strong></td>
        	<td><strong>예약일시</strong></td>
        	<td><strong>결제일시</strong></td>
        	<td><strong>결제상태</strong></td>
        	<td><strong>할인금액</strong></td>
        	<td><strong>보험여부</strong></td>
        </tr>
        <tr id="trb${i.index }" style="display: show;">
        	<td class="line"></td>
        	<td class="line"></td>
        	<td class="line">${map['USER_ID'] }</td>
        	<td class="line">${map['RES_DRV_NAME'] }</td>
        	<td class="line">${map['RES_DRV_TEL1'] }-${map['RES_DRV_TEL2'] }-${map['RES_DRV_TEL3'] }</td>
        	<td class="line"><fmt:formatDate value="${map['RESERV_DATE'] }" pattern="yyyy-MM-dd HH:mm"/></td>
        	<c:if test="${empty map['PAY_REGDATE']}">
        		<td class="line">미정</td>
        	</c:if>
        	<c:if test="${!empty map['PAY_REGDATE']}">
        		<td class="line"><fmt:formatDate value="${map['PAY_REGDATE'] }" pattern="yyyy-MM-dd HH:mm"/></td>
        	</c:if>
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
        	<c:if test="${empty map['PAY_DISCOUNT'] }">
        		<td class="line">없음</td>
        	</c:if>
        	<c:if test="${!empty map['PAY_DISCOUNT'] }">
        		<td class="line">${map['PAY_DISCOUNT'] } }</td>
        	</c:if>
        	<c:if test="${empty map['RESERV_INSURANCE'] }">
        		<td class="line">없음</td>
        	</c:if>
        	<c:if test="${!empty map['RESERV_INSURANCE'] }">
        		<td class="line">${map['RESERV_INSURANCE'] }</td>
        	</c:if>					
        </tr>
	</c:forEach>
	 <!-- 반복끝 --> 
        
        
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
					action="<c:url value="/com_manage/company_reservList.do" />">
					<select name="searchCondition" id="searchCondition">
						<option value='0'>::선택::</option>
						<option value="ccar_car_id"
							<c:if test="${'ccar_car_id'==param.searchCondition}">
		           		selected            	
		           	</c:if>>차량번호</option>
						<option value="res_u_name"
							<c:if test="${'res_u_name'==param.searchCondition}">
		           		selected            	
		           	</c:if>>예약자이름</option>
		           	<option value="reserv_start_date"
							<c:if test="${'reserv_start_date'==param.searchCondition}">
		           		selected            	
		           	</c:if>>대여일</option>
		           	<option value="reserv_end_date"
							<c:if test="${'reserv_end_date'==param.searchCondition}">
		           		selected            	
		           	</c:if>>반납일</option>
					</select> <input type="text" name="searchKeyword" title="검색어 입력"
						value="${param.searchKeyword}"> <input type="submit"
						value="검색" class="btn btn-primary btn-sm btn3d">
				</form>
			</div>
		</div>
	</div>
<%@ include file="../inc_company/company_bottom.jsp" %>