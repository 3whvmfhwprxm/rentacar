<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
	    	maxDate: 89
	    });
	    
	    $("#searchEndDate").datepicker({
	    	dateFormat: 'yy-mm-dd', 
	    	minDate: 2,
	    	maxDate: 90
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
	    		alert("앞날짜가 뒷날짜보다 크면 안됩니다. 검색기간을 확인해주세요.");
	    		$("#searchEndDate").focus();
	    		return event.preventDefault();
	    	}/* else if((endDateCompare.getTime()-startDateCompare.getTime())>7){
	    		alert("예약하실 수 있는 기간은 최대 7일까지 입니다");
	    		$("#searchEndDate").focus();
	    		return event.preventDefault();
	    	} */
		}
	});
</script>
<!-- 1.
예약시작날짜, 예약종료날짜
예약시작시간, 예약종료시간
차종류(소형,중형,대형)
조건을 입력받는 화면 보여주기

2.
위의 조건을 입력받고 '검색'을 누르면(post) 조건에 해당하는 리스트를 가져와서 보여준다
이때 검색시 예약정보 테이블에서 예약시작날짜/예약종료날짜/예약시작시간/예약종료시간 -->
<style type="text/css">
	.fontStyle1{color: #0033FF; font-weight: bold;}
	table tr th{background-color: skyblue;}
</style>
<br>
<div class="divList container">

<!-- 예약 가능 차 기본 옵션 검색 폼 -->
<div>
	<form class="form-horizontal" name="searchForm" id="searchForm" 
		method="post" action='<c:url value="/inc_user/realTime.do" />'>
		<fieldset>
			<legend>실시간 예약하기(예약가능차량 검색 조회/선택)</legend>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">시작 일시 선택</label>
				<div class="col-xs-2">
					<input class="form-control" type="text" id="searchStartDate" name="searchStartDate" value="${param.searchStartDate }" placeholder="시작 날짜 선택">&nbsp;					
				</div>				
				<div class="col-xs-1">
					<select class="form-control" name="startHour" id="startHour" title="시간 선택" >
						<c:forEach begin="8" end="20" var="i">
							<option value="${i }" <c:if test='${param.startHour==i }'> selected </c:if>>
							${i }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-xs-1">
					<select class="form-control" name="startMin" id="startMin" title="분 선택" >
						<option value="00" <c:if test='${param.startMin=="00" }'> selected </c:if>>00</option>
						<option value="30" <c:if test='${param.startMin=="30" }'> selected </c:if>>30</option>
					</select>
				</div>
			</div>
					
			<div class="form-group">
				<label class="col-sm-2 control-label">반납 일시 선택</label>
				<div class="col-xs-2">
					<input class="form-control" type="text" id="searchEndDate" name="searchEndDate" value="${param.searchEndDate }" placeholder="반납 날짜 선택">&nbsp;
				</div>
				<div class="col-xs-1">
					<select class="form-control" name="endHour" id="endHour" title="시간 선택">
						<c:forEach begin="8" end="20" var="i">
							<option value="${i }" <c:if test='${param.endHour==i }'> selected </c:if>>
							${i }</option>
						</c:forEach>
					</select>							
				</div>
				<div class="col-xs-1">
					<select class="form-control" name="endMin" id="endMin" title="분 선택" >
						<option value="00" <c:if test='${param.endMin=="00" }'> selected </c:if>>00</option>
						<option value="30" <c:if test='${param.endMin=="30" }'> selected </c:if>>30</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">차종</label>
				<div class="col-sm-2">
					<select class="form-control" name="carType" id="carType" title="차종">
						<c:forEach var="carcate" items="${catelist }">
							<option value=${carcate.carCategoryNum } 
								<c:if test='${param.carType==carcate.carCategoryNum }'> selected </c:if> >
								${carcate.carCategoryName } </option>
						</c:forEach>
					</select>					
				</div>
			</div>			
			<div class=form-group>
				<label class="col-sm-2 control-label"></label>		
				<div class="col-sm-6">
					<input class="btn btn-primary btn-lg btn-block" type="submit" value="조건에 맞는 차량 찾기" name="btsubmit" id="btsubmit" >
				</div>
			</div>
		</fieldset>
	</form>
</div>
<!-- 예약 가능 차 리스트 표시 시작 -->
<div>
	<c:if test="${!empty clist }">
		<div class=form-group>
			<label class="col-sm-6">검색하신 예약 기간: <span class="fontStyle1">${param.searchStartDate} ${param.startHour}:${param.startMin} 
				~ ${param.searchEndDate} ${param.endHour}:${param.endMin}</span></label>
		</div>		
		<table class="table table-bordered table-hover">
			<colgroup>
				<col style="width: 20%;" />
				<col style="width: 15%;" />
				<col style="width: 15%;" />
				<col style="width: 15%;" />
				<col style="width: 15%;" />
				<col style="width: 15%;" />
			</colgroup>
			<thead>		
				<tr>
					<th class="text-center">차량</th>
					<th class="text-center">업체</th>
					<th class="text-center">계산된 가격(아직X)</th>
					<th class="text-center">연체료(30분단위)</th>
					<th class="text-center">옵션상세보기</th>
					<th class="text-center">예약하기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="map" items="${clist }" varStatus="i">
					
						<!-- 조건에 따른 가격 계산 처리 (아직 안됨 단순 가격)-->
						<c:set var="priceByReservDays" value="${map['CCAR_NORMAL_PRICE'] }" />
						
						<tr>				
							<td class="text-center">${map['CAR_NAME'] }</td>
							<td class="text-center">${map['COM_NAME'] }</td>
							<td class="text-right"><fmt:formatNumber pattern="#,###" value="${priceByReservDays }"  /> 원 </td>
							<td class="text-right"><fmt:formatNumber pattern="#,###" value="${map['CCAR_ARREAR'] }"  /> 원 </td>
							<td class="text-center">
								<!-- 옵션상세보기 -->
								<div class="row">
									<div class="col-md-2"></div>
									<div class="col-md-8">
										<div class="address">
											<button type="button" class="btn btn-info"
												data-toggle="modal" data-target='#ordine_${i.index }'>옵션상세보기</button>
										</div>
									</div>
									<div class="col-md-2"></div>
								</div> 
								
								<!-- Modal -->
								<div id="ordine_${i.index }" class="modal fade" role="dialog">
									<div class="modal-dialog">
					
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">×</button>
												<h4 class="modal-title">${map['COM_NAME'] }의 ${map['CAR_NAME'] } 옵션사항</h4>
											</div>
											<div class="modal-body">
												<p>
													<c:if test="${map['CCAR_AUX_YN']=='N' && map['CCAR_BLACKBOX_YN']=='N' 
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
												<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
											</div>
										</div>								
									</div>
								</div>
							</td>
							<td class="text-center">
								<a href='<c:url 
								value="/inc_user/reservInfo.do
								?ccarCarId=${car.ccarCarId }
								&searchStartDate=${param.searchStartDate }
								&startHour=${param.startHour}
								&startMin=${param.startMin }
								&searchEndDate=${param.searchEndDate }
								&endHour=${param.endHour }
								&endMin=${param.endMin }
								" />'>
							<button id="selectThisCar" class="btn btn-success">이 차 예약!</button> </a>
							</td>					
						</tr>
					</c:forEach>
			</tbody>
		</table>
	</c:if>
</div>
<!-- 예약 가능 차 리스트 표시 종료 -->
</div>
<%@ include file="bottom.jsp"%>

