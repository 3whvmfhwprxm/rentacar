<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(function() {
	    $("#searchStartDate, #searchEndDate").datepicker({
	        dateFormat: 'yy-mm-dd'
	    });
		
	    $("#searchStartDate").change(function(){
	    	compareTime();
	    });
	    
	    $("#searchEndDate").change(function(){
	    	compareTime();
	    });
	    
	    $("#searchForm").submit(function(){
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
	    	}
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
		<table class="table table-bordered table-hover">			
			<tr>
				<th>업체보유차량 ID</th>
				<th>모델코드</th>
				<th>업체 ID</th>
				<th>평일예약가격(1일)</th>
				<th>주말예약가격(1일)</th>
				<th>성수기예약가격(1일)</th>
				<th>극성수기예약가격(1일)</th>
				<th>연체료</th>
				<th>예약하기</th>
			</tr>
			<c:forEach var="car" items="${clist }">
				<tr>					
						<td>${car.ccarCarId }</td>
						<td>${car.carCode }</td>
						<td>${car.comId }</td>
						<td>${car.ccarNormalPrice }</td>
						<td>${car.ccarWeekendPrice }</td>
						<td>${car.ccarPeakPrice }</td>
						<td>${car.ccarSPeakPrice }</td>
						<td>${car.ccarArrear }</td>
						<td>
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
					<button id="selectThisCar">이 차 예약!</button> </a></td>					
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
<!-- 예약 가능 차 리스트 표시 종료 -->
</div>
<%@ include file="bottom.jsp"%>

