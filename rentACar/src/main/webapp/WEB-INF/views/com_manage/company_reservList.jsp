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
	
    .line{
    border-bottom:1px solid blue;
    border:2;
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
	
	jQuery(function(){
		jQuery("tr").each(function(idx){
			jQuery("#tra"+idx).hide();
			jQuery("#trb"+idx).hide();
			
			jQuery("#bt"+idx).click(function(){
				jQuery("#tra"+idx).toggle();
				jQuery("#trb"+idx).toggle();
			});
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
       <colgroup>
    		<col width="10%">
    		<col width="10%">
    		<col width="10%">
    		<col width="15%">
    		<col width="15%">
    		<col width="10%">
    		<col width="10%">
    		<col width="10%">
    		<col width="8%">
    		<col width="5%">
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
				<th>상세정보보기</th>
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
			<td><button id="bt${i.index }">상세정보보기</button></td>
			<td><button>취소</button></td>
		</tr>
		<tr id="tra${i.index }">
			<td>${map['CCAR_CAR_ID'] } 예약상세정보</td>
			<td></td>
        	<td>예약자ID</td>
        	<td>운전자 이름</td>
        	<td>운전자 전화번호</td>
        	<td>예약일시</td>
        	<td>결제일시</td>
        	<td>진행상태</td>
        	<td>할인금액</td>
        	<td>보험여부</td>
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
					action="<c:url value="/com_manage/company_reservList.do" />">
					<select name="searchCondition">
						<option value="ccar_car_id"
							<c:if test="${'ccar_car_id'==param.searchCondition}">
		           		selected            	
		           	</c:if>>차량번호</option>
						<option value="res_u_name"
							<c:if test="${'res_u_name'==param.searchCondition}">
		           		selected            	
		           	</c:if>>예약자이름</option>
					</select> <input type="text" name="searchKeyword" title="검색어 입력"
						value="${param.searchKeyword}"> <input type="submit"
						value="검색">
				</form>
			</div>
		</div>
<%@ include file="../inc_company/company_bottom.jsp" %>