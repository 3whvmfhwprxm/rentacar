<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>

<!-- 업체 차량 조회 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/company.css/company_ccarList.css"/>
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
	
	function fncDelete(){
		if(jQuery("#ccarCarId1").val() == "" || jQuery("#ccarCarId1").val() == null){
			alert("등록 해지할 차량번호를 입력해주세요");
			return false;
		}
		if(jQuery("#readCarId").val() != jQuery("#ccarCarId1").val()){
			alert("차량번호가 일치하지 않습니다.");
			return false;
		} 
		jQuery("#form1").attr("method","POST");
		jQuery("#form1").attr("action","<c:url value='/com_manage/company_ccarDelete.do'/>");
		jQuery("#form1").submit();
	}
	
	jQuery(document).ready(function(){
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
        <legend>차량 현황</legend>
        <!--dropdown menu-->
        <div class="collapse navbar-collapse" id="MainMenu">
        
       	<pre>
		<code>
		우리업체의 현재 등록된 차량모델 리스트를 보여주며, 페이지당 15개의 목록을 보여줍니다.
		차량번호를 클릭하시면 차량의 상세정보 페이지로 이동합니다.
		옵션상세보기 버튼은 해당차량의 등록된 옵션을 보여주며 여부변경버튼은 차량의 상태를 변경시킴으로써 관리의 이점이 있습니다.
		검색은 차량번호, 모델명으로 가능하며 대소문자 구분없이 쓰셔도 검색이 됩니다.
		정렬기준 선택시 다양하게 목록 기준을 바꿀 수 있습니다.
		**차량 삭제기능은 <strong>DB(데이터베이스)</strong>에서 지워지지 않으며 해당리스트에서만 사라집니다.
		**<strong>DB(데이터베이스)</strong> 관리는 관리자에게만 허용된 기능이나 임의 삭제는 불가하며, 요청시 회사 내규에 따라 처리됩니다.
    	</code>
		</pre>
    	    	
            <ul class="nav navbar-nav menu-list">
            	 <li class="dropdown list-category">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-navicon"></i> 정렬기준 <i class="fa fa-angle-down" aria-hidden="true"></i>
                    </a>
                    <ul class="dropdown-menu mega-dropdown-menu">
                    	<li><a href="javascript:fncSort('date')">최근등록순</a></li>
                    	<li><a href="javascript:fncSort('num')">차량번호순</a></li>
                        <li><a href="javascript:fncSort('model')">차량모델순</a></li>
                        <li><a href="javascript:fncSort('fuel')">연료타입순</a></li>
                        <li><a href="javascript:fncSort('usey')">사용가능한 차량만 보기</a></li>
                        <li><a href="javascript:fncSort('usen')">정비중인 차량만 보기</a></li>
                    </ul>
                </li>
        <br><br>
        <!--table-->
       <table class="table table-striped">
       <thead>
       		  <colgroup>
	    		<col width="13%">
	    		<col width="10%">
	    		<col width="*%">
	    		<col width="8%">
	    		<col width="15%">
	    		<col width="8%">
	    		<col width="10%">
	    		<col width="8%">
	    		<col width="10%">
    		</colgroup>
       		<tr>
  				<th>차량번호</th>
				<th>차량모델코드</th>
				<th>모델명</th>
				<th>연료타입</th>
				<th>옵션</th>
				<th>차량상태</th>
				<th>차량상태변경</th>
				<th>차량등록일</th>
				<th>편집</th>
			</tr>
        </thead>
        <tbody>
        <!-- 반복시작 -->
		<c:if test="${empty cclist }">
			<td colspan="10">데이터가 없습니다.</td>
		</c:if>
		<c:if test="${!empty cclist }">
		
		<c:forEach var="map" items="${cclist }" varStatus="i">
		<tr>
			<td><a href="<c:url value='/com_manage/company_ccarDetail.do?ccarCarId=${map["CCAR_CAR_ID"] }' /> " />${map['CCAR_CAR_ID']}</td>
			<td>${map['CAR_CODE'] }</td>
			<td>${map['CAR_NAME'] }</td>
			<td>${map['CAR_FUEL'] }</td>
			<td><!-- <a href="#">옵션상세보기</a> -->
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="address">
						<button type="button" class="btn btn-info"
							data-toggle="modal" data-target='#ordine_${i.index }'>옵션상세보기</button>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div> <!-- Modal -->
			<div id="ordine_${i.index }" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">${map['CCAR_CAR_ID'] }의 옵션사항</h4>
						</div>
						<div class="modal-body">
							<p>
								<c:if
									test="${map['CCAR_AUX_YN']=='N' && map['CCAR_BLACKBOX_YN']=='N' 
	       && map['CCAR_SMOKE_YN']=='N' && map['CCAR_REAR_CAMERA_YN']=='N' 
	       && map['CCAR_REAR_SENCE_YN']=='N' && map['CCAR_NAVI_YN']=='N' 
	       && map['CCAR_NAVI_YN']=='N' && map['CCAR_SUN_ROOF_YN']=='N' 
	       && map['CCAR_BLUETOOTH_YN']=='N' && map['CCAR_SMARTKEY_YN']=='N' }">등록된 옵션이 없습니다.
       </c:if>
		<c:if test="${map['CCAR_AUX_YN']=='Y' }"> AUX</c:if>
		<c:if test="${map['CCAR_BLACKBOX_YN']=='Y' }"> 블랙박스</c:if>
		<c:if test="${map['CCAR_SMOKE_YN']=='Y' }"> 금연차</c:if>
		<c:if test="${map['CCAR_REAR_CAMERA_YN']=='Y' }"> 후방카메라</c:if>
		<c:if test="${map['CCAR_REAR_SENCE_YN']=='Y' }"> 후방센서</c:if>
		<c:if test="${map['CCAR_NAVI_YN']=='Y' }"> 네비게이션</c:if>
		<c:if test="${map['CCAR_SUN_ROOF_YN']=='Y' }">썬루프</c:if>
		<c:if test="${map['CCAR_BLUETOOTH_YN']=='Y' }"> 블루투스</c:if>
		<c:if test="${map['CCAR_SMARTKEY_YN']=='Y' }"> 스마트키</c:if>
		</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info"
							data-dismiss="modal">Close</button>
					</div>
				</div>
		
				</div>
			</div>
		</td>
			<c:if test="${map['CCAR_USE_YN']=='Y' }"><td>사용가능</td>  </c:if>
			<c:if test="${map['CCAR_USE_YN']=='N' }"><td>정비중</td>  </c:if>
			<td>
			
			<button class="btn btn-warning" onclick="javascript:cg('${map['CCAR_USE_YN']}','${map['CCAR_CAR_ID'] }','${map['COM_ID'] }')">
				여부변경</button>
			</td>
			<td><fmt:formatDate value="${map['COMCAR_REGDATE'] }" pattern="yyyy/MM/dd"/></td>
			<td>
			<button><a href="<c:url value='/com_manage/company_ccarEdit.do?ccarCarId=${map["CCAR_CAR_ID"] }' />">수정</a></button>
			
			<button data-target="#layerpop_${i.index }" data-toggle="modal">삭제</button>
					<div class="modal fade" id="layerpop_${i.index }">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- header -->
								<div class="modal-header">
									<!-- 닫기(x) 버튼 -->
									<button type="button" class="close" data-dismiss="modal">×</button>
									<!-- header title -->
									<h4 class="modal-title">차량등록 해지</h4>
								</div>
								<!-- body -->
								<form id="form1" name="form1">
								<div class="modal-body">
									차량번호1<input type="text" name="readCarId" id="readCarId" disabled="true" value=${map['CCAR_CAR_ID']}>
									모델명<input type="text" name="readCarName" id="readCarName" disabled="true" value="${map['CAR_NAME'] }"><br>
									<br><span style="color:red">등록 해지 하시려는 차량의 차대 번호를 입력하세요.</span><br>
									차량번호<input type="text" name="ccarCarId1" id="ccarCarId1" placeholder="서울가1234">
											<input type="hidden" name="comId" id="comId" value="${map['COM_ID'] }">
								</div>
									<button type="button" id="btDelete" class="btn btn-danger"
										data-dismiss="modal" onclick="fncDelete()">삭제</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">취소</button>
								</form>
								</div>
							</div>
						</div>
					</div>
			
			</td>
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
				</c:if>
		<div class="col-md-4"></div>
	</div>
		<div class="divSearch">
				<form name="frmSearch" id="frmSearch" method="post"
					action="<c:url value="/com_manage/company_ccarList.do" />">
					<select name="searchCondition" id="searchCondition">
						<option value='0'>::선택::</option>
						<option value="ccar_car_id"
							<c:if test="${'ccar_car_id'==param.searchCondition}">
		           		selected            	
		           	</c:if>>차량번호</option>
						<option value="car_inc"
							<c:if test="${'car_inc'==param.searchCondition}">
		           		selected            	
		           	</c:if>>모델명</option>
					</select> <input type="text" name="searchKeyword" title="검색어 입력"
						value="${param.searchKeyword}" placeholder="검색어 입력"> <input type="submit"
						value="검색" class="btn btn-primary btn-sm btn3d">
				</form>
			</div>
		</div>
<%@ include file="../inc_company/company_bottom.jsp" %>