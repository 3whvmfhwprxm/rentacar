<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_user/top.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/coupon_style.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=efc3625556d3948610f5295a4a5e8968&libraries=services"></script>
<style>
#reservUser{
	text-align: center;
}
#userLeft{
	
}

</style>
<script type="text/javascript">
	$().ready(function(){
		$("input[name=insertUserInfo]").click(function(){
			$.setReservInfo();
		});
		
		$("input[name=insertDrvInfo]").click(function(){
			$.setDrvInfo();
		});
		
		$("#resDrvBirth").datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	yearRange: "1900:2020" ,
	    	changeYear: true,
	    	changeMonth: true
	    });
		
		$("#insertReservInfo").submit(function(){
			if($("#resUName").val()==''){
				alert("예약자 이름을 입력해주세요");
				$("#resUName").focus();
				return false;
			}else if($("#resUMail").val()==''){
				alert("예약자 이메일을 입력해주세요");
				$("#resUMail").focus();
				return false;
			}else if($("#resUTel2").val()=='' || $("#resUTel3").val()==''){
				alert("예약자 전화번호를 입력해주세요");
				$("#resUTel3").focus();
				return false;
			}else if($("#resDrvName").val()==''){
				alert("운전자 이름을 입력해주세요");
				$("#resDrvName").focus();
				return false;
			}else if($("#resDrvTel2").val()=='' || $("#resDrvTel3").val()==''){
				alert("운전자 전화번호를 입력해주세요");
				$("#resDrvTel3").focus();
				return false;
			}else if($("#resDrvBirth").val()==''){
				alert("운전자 생년월일을 입력해주세요");
				$("#resDrvBirth").focus();
				return false;
			} 
		});
	});
	
	$.setReservInfo=function(){
		if($("#insertUserInfo2").is(":checked")){
			//기존 회원 정보 입력을 선택
			$("#resUName").val("${uvo.userName}");
			$("#resUMail").val("${uvo.userEmail}");
			$("#resUTel1").val("${uvo.userTel1}");
			$("#resUTel2").val("${uvo.userTel2}");
			$("#resUTel3").val("${uvo.userTel3}");
			
		}else{
			//직접 입력을 선택
			$("#resUName").val("");
			$("#resUMail").val("");
			$("#resUTel1").val("010");
			$("#resUTel2").val("");
			$("#resUTel3").val("");
		}
	}
	
	$.setDrvInfo=function(){
		if($("#insertDrvInfo2").is(":checked")){
			//기존 회원 정보 입력을 선택
			$("#resDrvName").val("${uvo.userName}");
			$("#resDrvCategory").val("${uvo.userLicense}");
			$("#resDrvTel1").val("${uvo.userTel1}");
			$("#resDrvTel2").val("${uvo.userTel2}");
			$("#resDrvTel3").val("${uvo.userTel3}");
			$("#resDrvBirth").val("${uvo.userBirth}");
			
		}else{
			//직접 입력을 선택
			$("#resDrvName").val("");
			$("#resDrvCategory").val("");
			$("#resDrvTel1").val("010");
			$("#resDrvTel2").val("");
			$("#resDrvTel3").val("");
			$("#resDrvBirth").val("");
		}
	}
</script>
<style type="text/css">
	.fontStyle1{color: #0033FF; font-weight: bold;}
	#map{
		padding:5px 5px 5px 5px;
		width:100%;
		height:300px;}
	#userLeft{
		float:left;
		width:50%;}
	#userRight{
		float:left;
		width:50%;}
	th{background-color: #EEEEEE; text-align: center;}
	td{text-align: center;}
</style>
<div class="container">
	<br>
	<form class="form-horizontal" name="insertReservInfo" id="insertReservInfo" method="post" action="<c:url value='/user/reservation.do' />">
		<fieldset>
			<h3>선택정보 확인</h3>
		<!-- 선택한 기간 정보 -->
		<div class="form-group">
				<!-- 테스트 끝나면 hidden으로 재 설정 -->
				<input type="hidden" name="searchStartDate" value="${param.searchStartDate}">
				<input type="hidden" name="startHour" value="${param.startHour}">
				<input type="hidden" name="startMin" value="${param.startMin}">
				<input type="hidden" name="searchEndDate" value="${param.searchEndDate}">
				<input type="hidden" name="endHour" value="${param.endHour}">
				<input type="hidden" name="endMin" value="${param.endMin}">
				<input type="hidden" name="ccarCarId" value="${map['CCAR_CAR_ID'] }">	
		</div>
		
		<!-- 선택한 차에 대한 정보 -->
		<div id="selectedCar">
			<table class="table table-bordered">			
				<thead>
					<tr>
						<th>예약 선택 기간</th>
						<th>선택하신 차</th>						
						<th colspan="2">차 옵션</th>
					</tr>					
				</thead>				
				<tbody>
					<tr>
						<td>
							${param.searchStartDate} ${param.startHour}:${param.startMin} ~ ${param.searchEndDate} ${param.endHour}:${param.endMin}
						</td>						
						<td>
							<img src='<c:url value="/carImages/${map['CAR_IMG'] }" />' alt="선택한 차종 이미지" 
								width="20px" height="20px"> ${map['CAR_NAME'] }
						</td>
						<td colspan="2">
							<c:if test="${map['CCAR_AUX_YN']=='N' && map['CCAR_BLACKBOX_YN']=='N' 
												       && map['CCAR_SMOKE_YN']=='N' && map['CCAR_REAR_CAMERA_YN']=='N' 
												       && map['CCAR_REAR_SENCE_YN']=='N' && map['CCAR_NAVI_YN']=='N'
												       && map['CCAR_SUN_ROOF_YN']=='N' && map['CCAR_BLUETOOTH_YN']=='N' 
												       && map['CCAR_SMARTKEY_YN']=='N' }"> 옵션 없음 
							</c:if>
							<c:if test="${map['CCAR_AUX_YN']!='N' }"> AUX </c:if>
							<c:if test="${map['CCAR_BLACKBOX_YN']!='N' }"> 블랙박스 </c:if>
							<c:if test="${map['CCAR_NAVI_YN']!='N' }"> 네비게이션 </c:if>
							<c:if test="${map['CCAR_SUN_ROOF_YN']!='N' }"> 썬루프 </c:if>
							<c:if test="${map['CCAR_SMOKE_YN']!='N' }"> 금연차 </c:if>
							<c:if test="${map['CCAR_REAR_CAMERA_YN']!='N' }"> 후방카메라 </c:if>
							<c:if test="${map['CCAR_REAR_SENCE_YN']!='N' }"> 후방센서 </c:if>
							<c:if test="${map['CCAR_BLUETOOTH_YN']!='N' }"> 블루투스 </c:if>
							<c:if test="${map['CCAR_SMARTKEY_YN']!='N' }"> 스마트키 </c:if>
						</td>
					</tr>
					<tr>
						<th>선택 기간의 가격</th>
						<th>연체료(30분 단위)</th>
						<th>렌터카 업체</th>
						<th>업체 연락처</th>
					</tr>
					<tr>
						<td><fmt:formatNumber pattern="#,###" value="${map['PRICERESULT'] }"  /> 원 </td>
						<td><fmt:formatNumber pattern="#,###" value="${map['CCAR_ARREAR'] }"  /> 원 </td>
						<td>
							${map['COM_NAME'] }
						</td>
						<td>${map['COM_TEL1'] }-${map['COM_TEL2'] }-${map['COM_TEL3'] }</td>
					</tr>
				</tbody>					
			</table>
		</div>
		<br>
    
    <!-- 인수/반납 장소 표시 -->
    <p><strong>인수/반납 주소: </strong>${map['COM_RETURN_PLACE']}</p>
    <div id="map"></div>
    <input type="hidden" id="mapInfo" name="mapInfo" value="${map['COM_RETURN_PLACE']}">    
    <script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		var tmp = document.getElementById('mapInfo').value; 
		
		// 주소로 좌표를 검색합니다
		geocoder.addr2coord(tmp, function(status, result) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		
		        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">인수/반납 위치</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
	</script>
			<br>
			
			<!-- 예약자 및 운전자 입력 정보 -->
			<c:if test="${empty uvo}">
				로그인 하시면 예약하실수 있습니다.
			</c:if>			
			<c:if test="${!empty uvo}">
			<div id="reservUser">
				<div id="userLeft">
					<h4>예약자 정보 입력</h4>
					<p>
						<input type="radio" name="insertUserInfo" id="insertUserInfo1" checked>
						<label for="insertUserInfo1">직접 입력</label>
									
						<input type="radio" name="insertUserInfo" id="insertUserInfo2"> 
						<label for="insertUserInfo2">회원과 동일 정보 입력</label>			
					</p>
					<table>
						<tr>
							<td class="text-right">예약자 이름: </td>
							<td class="text-left"><input  type="text" name="resUName" id="resUName"></td>
						</tr>
						<tr>
							<td class="text-right">이메일: </td>
							<td class="text-left"><input  type="email" name="resUMail" id="resUMail"></td>
						</tr>
						<tr>
							<td class="text-right">연락처: </td>
							<td class="text-left">
								<select  name="resUTel1" id="resUTel1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
								</select> -			
								<input type="text" name="resUTel2" id="resUTel2"> -
								<input type="text" name="resUTel3" id="resUTel3">
							</td>
						</tr>
					</table>
					
				</div>
				
				<div id="userRight">
					<h4>운전자 정보 입력</h4>
					<p>			
						<input type="radio" name="insertDrvInfo" id="insertDrvInfo1" checked>
						<label for="insertDrvInfo1">직접 입력</label>
									
						<input type="radio" name="insertDrvInfo" id="insertDrvInfo2"> 
						<label for="insertDrvInfo2">회원과 동일 정보 입력</label>			
					</p>
					<table>
						<tr>
							<td class="text-right">운전자 이름: </td>
							<td class="text-left"><input type="text" name="resDrvName" id="resDrvName"></td>
						</tr>
						<tr>
							<td class="text-right">면허증: </td>
							<td class="text-left">
								<select class="" id="resDrvCategory" name="resDrvCategory" >	           			
				           			<option value="1종 보통">1종 보통</option>
				           			<option value="1종 소형">1종 소형</option>
				           			<option value="1종 대형">1종 대형</option>
				           			<option value="1종 특수">1종 특수</option>
				           			<option value="2종 보통">2종 보통</option>
				           			<option value="2종 소형">2종 소형</option>
				           		</select>
							</td>
						</tr>
						<tr>
							<td class="text-right">연락처: </td>
							<td class="text-left">
								<select class="" name="resDrvTel1" id="resDrvTel1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
								</select> -			
								<input type="text" name="resDrvTel2" id="resDrvTel2"> -
								<input type="text" name="resDrvTel3" id="resDrvTel3">
							</td>
						</tr>
						<tr>
							<td class="text-right">생년월일: </td>
							<td class="text-left"><input type="text" name="resDrvBirth" id="resDrvBirth"></td>
						</tr>
					</table>
					</div>
					
					<div class="text-center">	
						<div class="col-sm-12">
							<input class="btn btn-primary btn-lg btn-block" type="submit" value="예약하기" name="btsubmit" id="btsubmit" >
						</div>
					</div>					
				
			</div>
			<!-- 예약자 정보 입력 끝 -->
			</c:if>
			</fieldset>
		</form>
	
	<br>
	<br>
</div>
<%@ include file="../inc_user/bottom.jsp"%>