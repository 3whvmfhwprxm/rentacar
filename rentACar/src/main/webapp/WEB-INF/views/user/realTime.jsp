<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_user/top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->
<link href="${pageContext.request.contextPath}/css/jquery_custom/jquery-ui.min.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/jquery/jquery_custom/jquery-ui.min.js"></script>
<script>
	$(function() {		
		$("#searchForm").submit(function(){
			compareTime();
			
			if($("#searchStartDate").val()==''){
				alert("검색하실 차량의 예약 시작일을 선택해주세요");
				$("#searchStartDate").focus();
				return false;
			}else if($("#searchEndDate").val()==''){
				alert("검색하실 차량의 반납일을 선택해주세요");
				$("#searchEndDate").focus();
				return false;
			}
			return true;
		});
		
	    $("#searchStartDate").datepicker({
	    	dateFormat: 'yy-mm-dd', 
	    	minDate: 1,
	    	maxDate: 89,
	    	dayNamesMin:['일', '월', '화', '수', '목', '금', '토'],
			monthNames:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    });
	    
	    $("#searchEndDate").datepicker({
	    	dateFormat: 'yy-mm-dd', 
	    	minDate: 2,
	    	maxDate: 90,
	    	dayNamesMin:['일', '월', '화', '수', '목', '금', '토'],
			monthNames:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    });
		
	    $("#searchStartDate").change(function(){
	    	compareTime();
	    });
	    
	    $("#searchEndDate").change(function(){
	    	compareTime();
	    });
	    
	    $("#selectThisCar").click(function(){
	    	compareTime();	    		
	    });
	    
	    function compareTime() {
	    	var startDate=$("#searchStartDate").val();
	    	var startDateArr=startDate.split('-');
	    	
	    	var endDate=$("#searchEndDate").val();
	    	var endDateArr=endDate.split('-');
	    	
	    	var startDateCompare=new Date(startDateArr[0],startDateArr[1],startDateArr[2]);
	    	var endDateCompare=new Date(endDateArr[0],endDateArr[1],endDateArr[2]);
	    	
	    	if(startDateCompare.getTime() > endDateCompare.getTime()){
	    		alert("예약일이 반납일보다 크면 안됩니다. 검색기간을 확인해주세요.");
	    		$("#searchEndDate").focus();
	    		return event.preventDefault();
	    	}else if((endDateCompare.getDate()-startDateCompare.getDate())>7){
	    		alert("예약하실 수 있는 기간은 최대 7일까지 입니다");
	    		$("#searchEndDate").focus();
	    		return event.preventDefault();
	    	}
		}
	});
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
<!-- 1.
예약시작날짜, 예약종료날짜
예약시작시간, 예약종료시간
차종류(소형,중형,대형)
조건을 입력받는 화면 보여주기``

2.
위의 조건을 입력받고 '검색'을 누르면(post) 조건에 해당하는 리스트를 가져와서 보여준다
이때 검색시 예약정보 테이블에서 예약시작날짜/예약종료날짜/예약시작시간/예약종료시간 -->
<style type="text/css">
	.fontStyle1{color: #0033FF; font-weight: bold;}
	.fontStyle2{color: #313131; font-weight: bold; line-height: 15px;}
	input[type=text], select{height: 20px; vertical-align: middle;}
	input[type=text]{width: 90px;}
	table{
		width: 100%;
	    border-collapse: collapse;
	    border-spacing: 0;
	    table-layout: fixed;
	    word-wrap: break-word;
	    word-break: keep-all;
    }
    .carItems{
    	display: block;
	    list-style-type: disc;
	    -webkit-margin-before: 1em;
	    -webkit-margin-after: 1em;
	    -webkit-margin-start: 0px;
	    -webkit-margin-end: 0px;
	    -webkit-padding-start: 40px;
	    width: 250px;
	    height: 265px;
    }
    li{list-style: none;}
    td{
    display: table-cell;
    vertical-align: inherit;
	}
</style>
<br>
<div class="container">
	<form name="frmPage" method="post" action='<c:url value="/user/realTime.do" />'>
			<input type="hidden" name="currentPage">
			<input type="hidden" name="searchStartDate" value="${dateSearchVO.searchStartDate }">
			<input type="hidden" name="startHour" value="${dateSearchVO.startHour }">
			<input type="hidden" name="startMin" value="${dateSearchVO.startMin}">
			<input type="hidden" name="searchEndDate" value="${dateSearchVO.searchEndDate }">
			<input type="hidden" name="endHour" value="${dateSearchVO.endHour }">
			<input type="hidden" name="endMin" value="${dateSearchVO.endMin}">
			<input type="hidden" name="carType" value="${dateSearchVO.carType}">
	</form>

	<!-- 예약 가능 차 기본 옵션 검색 폼 -->
	<div>
		<form name="searchForm" id="searchForm" 
			method="post" action='<c:url value="/user/realTime.do" />'>
			<fieldset>
				<legend>실시간 예약하기(예약가능차량 검색 조회/선택)</legend>
				
				<div>
					<label>시작 일시 선택: </label>
						<input type="text" id="searchStartDate" name="searchStartDate" value="${dateSearchVO.searchStartDate }" placeholder="시작 날짜 선택">					
						<select name="startHour" id="startHour" title="시간 선택" >
							<c:forEach begin="8" end="20" var="i">
								<option value="${i }" <c:if test='${dateSearchVO.startHour==i }'> selected </c:if>>
								${i }</option>
							</c:forEach>
						</select> 시
	
						<select name="startMin" id="startMin" title="분 선택" >
							<option value="00" <c:if test='${dateSearchVO.startMin=="00" }'> selected </c:if>>00</option>
							<option value="30" <c:if test='${dateSearchVO.startMin=="30" }'> selected </c:if>>30</option>
						</select> 분&nbsp;&nbsp;&nbsp;&nbsp;
					<label>반납 일시 선택: </label>
						<input type="text" id="searchEndDate" name="searchEndDate" value="${dateSearchVO.searchEndDate }" placeholder="반납 날짜 선택">
						<select name="endHour" id="endHour" title="시간 선택">
							<c:forEach begin="8" end="20" var="i">
								<option value="${i }" <c:if test='${dateSearchVO.endHour==i }'> selected </c:if>>
								${i }</option>
							</c:forEach>
						</select> 시						
						<select name="endMin" id="endMin" title="분 선택" >
							<option value="00" <c:if test='${dateSearchVO.endMin=="00" }'> selected </c:if>>00</option>
							<option value="30" <c:if test='${dateSearchVO.endMin=="30" }'> selected </c:if>>30</option>
						</select> 분&nbsp;&nbsp;&nbsp;
				
					<label >차종</label>
						<select name="carType" id="carType" title="차종">
							<option value="0" <c:if test='${dateSearchVO.carType==carcate.carCategoryNum }'> selected </c:if>>선택</option>
							<c:forEach var="carcate" items="${catelist }">
								<option value=${carcate.carCategoryNum } 
									<c:if test='${dateSearchVO.carType==carcate.carCategoryNum }'> selected </c:if> >
									${carcate.carCategoryName } </option>
							</c:forEach>
						</select>&nbsp;&nbsp;
						<input class="btn btn-primary" type="submit" value="조건에 맞는 차량 찾기" name="btsubmit" id="btsubmit" >
				</div>
			</fieldset>
		</form>
	</div>
	<hr>
	<!-- 예약 가능 차 리스트 표시 시작 -->
	<div>
		<div class=form-group>
				<label class="col-sm-6">검색하신 예약 기간: <span class="fontStyle1">${dateSearchVO.combinedSearchStartDate} ~ ${dateSearchVO.combinedSearchEndDate}</span></label>
		</div>
						
			<table>
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tbody>
					<c:if test="${empty clist }">
						
							<tr><td colspan="4" class="text-center"> 검색하신 조건에 해당하는 차량이 없습니다. </td></tr>
					</c:if>
					<c:if test="${!empty clist }">
						<c:set var="k" value="0" /> 
						<c:set var="j" value="4" />
						<c:forEach var="map" items="${clist }" varStatus="i">
							<c:if test="${k%j==0 }">	
								<tr>
							</c:if>		
									<td>
										<ul class="carItems">
											<li>
												<div><a href='<c:url 
													value="/user/reservInfo.do
													?ccarCarId=${map['CCAR_CAR_ID'] }
													&searchStartDate=${dateSearchVO.searchStartDate }
													&startHour=${dateSearchVO.startHour}
													&startMin=${dateSearchVO.startMin }
													&searchEndDate=${dateSearchVO.searchEndDate }
													&endHour=${dateSearchVO.endHour }
													&endMin=${dateSearchVO.endMin }
													" />'>
													<img src='<c:url value="/carImages/${map['CAR_IMG'] }" />' 
												alt="차 이미지" width="200" height="120"></a>
												</div>
											</li>
											<li><a href='<c:url 
													value="/user/reservInfo.do
													?ccarCarId=${map['CCAR_CAR_ID'] }
													&searchStartDate=${dateSearchVO.searchStartDate }
													&startHour=${dateSearchVO.startHour}
													&startMin=${dateSearchVO.startMin }
													&searchEndDate=${dateSearchVO.searchEndDate }
													&endHour=${dateSearchVO.endHour }
													&endMin=${dateSearchVO.endMin }
													" />'>
												[${map['COM_NAME'] }] ${map['CAR_NAME'] }</a>									
											</li>
											<li>
												<c:if test="${map['CCAR_AUX_YN']=='N' && map['CCAR_BLACKBOX_YN']=='N' 
														       && map['CCAR_SMOKE_YN']=='N' && map['CCAR_REAR_CAMERA_YN']=='N' 
														       && map['CCAR_REAR_SENCE_YN']=='N' && map['CCAR_NAVI_YN']=='N' 
														       && map['CCAR_NAVI_YN']=='N' && map['CCAR_SUN_ROOF_YN']=='N' 
														       && map['CCAR_BLUETOOTH_YN']=='N' && map['CCAR_SMARTKEY_YN']=='N' }">등록된 옵션이 없습니다.
							      						 	</c:if>
															<c:if test="${map['CCAR_AUX_YN']!='N' }"> AUX</c:if>
															<c:if test="${map['CCAR_BLACKBOX_YN']!='N' }"> 블랙박스</c:if>
															<c:if test="${map['CCAR_SMOKE_YN']!='N' }"> 금연차</c:if>
															<c:if test="${map['CCAR_REAR_CAMERA_YN']!='N' }"> 후방카메라</c:if>
															<c:if test="${map['CCAR_REAR_SENCE_YN']!='N' }"> 후방센서</c:if>
															<c:if test="${map['CCAR_NAVI_YN']!='N' }"> 네비게이션</c:if>
															<c:if test="${map['CCAR_SUN_ROOF_YN']!='N' }">썬루프</c:if>
															<c:if test="${map['CCAR_BLUETOOTH_YN']!='N' }"> 블루투스</c:if>
															<c:if test="${map['CCAR_SMARTKEY_YN']!='N' }"> 스마트키</c:if>
											</li>
											<li>
												<span class="fontStyle2">
													<fmt:formatNumber pattern="#,###" value="${map['PRICERESULT'] }"  /> 원 
												</span>
											</li>
										</ul>
									</td>	
								<c:if test="${k%j==j-1 }">					
									</tr>
								</c:if>
								<c:set var="k" value="${k+1 }" />
							</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<!-- 예약 가능 차 리스트 표시 종료 -->

	<!-- 페이징 -->
	<div class="row">
		<div class="col-md-4"></div>
			<div class="col-md-4">
				<nav style="text-align: center;">
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

</div>
<%@ include file="../inc_user/bottom.jsp"%>

