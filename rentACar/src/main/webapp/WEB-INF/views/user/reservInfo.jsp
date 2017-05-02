<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_user/top.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/coupon_style.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=efc3625556d3948610f5295a4a5e8968&libraries=services"></script>
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
	#map{float:left;
		padding:5px 5px 5px 5px;
		width:35%;
		height:300px;}
		
	#userLeft{
		clear:both;
		float:left;
		padding:5px 5px 5px 5px;
		width:50%;}
	#userRight{
		float:left;
		padding:5px 5px 5px 5px;
		width:50%;}
</style>
<div class="container">
	<br>
	<form class="form-horizontal" name="insertReservInfo" id="insertReservInfo" method="post" action="<c:url value='/user/reservation.do' />">
		<fieldset>
			<legend>예약자 정보 입력</legend>
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
		
		<!-- 조건에 따른 가격 계산 처리 (아직 안됨 단순 가격)-->
		<c:set var="priceByReservDays" value="${map['CCAR_NORMAL_PRICE'] }" />
		
		<!-- 선택한 차에 대한 정보 -->
		<div id="selectedCar">
			<table class="table">
				<colgroup>
					<col>
				</colgroup>				
				<thead>
					<tr>
						<th>예약 선택 기간</th>
						<th>선택하신 차</th>						
						<th>차 옵션</th>
						<th>렌터카 업체</th>
						<th>업체 연락처</th>
					</tr>					
				</thead>				
				<tbody>
					<tr>
						<td>
							${param.searchStartDate} ${param.startHour}:${param.startMin} 
								~ ${param.searchEndDate} ${param.endHour}:${param.endMin}
						</td>						
						<td>
							<img src='<c:url value="/carImages/${map['CAR_IMG'] }" />' alt="선택한 차종 이미지" 
								width="20px" height="20px"> ${map['CAR_NAME'] }
						</td>
						<td>
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
						<td>
							${map['COM_NAME'] }
						</td>
						<td>${map['COM_TEL1'] }-${map['COM_TEL2'] }-${map['COM_TEL3'] }</td>
					</tr>
				</tbody>					
			</table>
		</div>
		<br>		
		<%-- <div class="row" id="selectedCar">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default coupon">
              <div class="panel-heading" id="head">
                <div class="panel-title" id="title">
                    <img src="*" alt="선택한 업체 로고 이미지">
                    <span class="hidden-xs"> ${map['CAR_NAME'] }</span>
                    <span class="visible-xs"> ${map['CAR_NAME'] }</span>
                </div>
              </div>
              <div class="panel-body">
                <img src='<c:url value="/carImages/${map['CAR_IMG'] }" />' class="coupon-img img-rounded" alt="선택한 차종 이미지">
                <div class="col-md-9">
                    <ul class="items">
                    <c:if test="${map['CCAR_AUX_YN']=='N' && map['CCAR_BLACKBOX_YN']=='N' 
												       && map['CCAR_SMOKE_YN']=='N' && map['CCAR_REAR_CAMERA_YN']=='N' 
												       && map['CCAR_REAR_SENCE_YN']=='N' && map['CCAR_NAVI_YN']=='N' 
												       && map['CCAR_NAVI_YN']=='N' && map['CCAR_SUN_ROOF_YN']=='N' 
												       && map['CCAR_BLUETOOTH_YN']=='N' && map['CCAR_SMARTKEY_YN']=='N' }">
												       <li>등록된 옵션이 없습니다.</li>
					</c:if>
					<c:if test="${map['CCAR_AUX_YN']!='N' }"><li>AUX</li></c:if>
					<c:if test="${map['CCAR_BLACKBOX_YN']!='N' }"><li>블랙박스</li></c:if>
					<c:if test="${map['CCAR_NAVI_YN']!='N' }"><li>네비게이션</li></c:if>
					<c:if test="${map['CCAR_SUN_ROOF_YN']!='N' }"><li>썬루프</li></c:if>
                    </ul>
                </div>
                <div class="col-md-3">
                    <div class="offer">
                        <span class="number"><fmt:formatNumber pattern="#,###" value="${priceByReservDays }" /> </span>
                    </div>
                </div>
                <div class="col-md-12">
                    <p class="disclosure">연락처: ${map['COM_TEL1'] }-${map['COM_TEL2'] }-${map['COM_TEL3'] }</p>
                </div>
              </div>
              <div class="panel-footer">
                <div class="coupon-code">
                    <span class="print">
                        <a href="<c:url value='/user/realTime.do' />" class="btn btn-link">다른 차량 선택하기</a>
                    </span>
                </div>
                <div class="exp">선택하신 예약 기간: ${param.searchStartDate} ${param.startHour}:${param.startMin} 
				~ ${param.searchEndDate} ${param.endHour}:${param.endMin}</div>
              </div>
            </div>
    	</div>
    </div> --%>
    
    <!-- 인수/반납 장소 표시 -->
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
			<div id="reservUser">
				<div id="userLeft">
					<h4>예약자 정보 입력</h4>
					<p>
						<input type="radio" name="insertUserInfo" id="insertUserInfo1" checked>
						<label for="insertUserInfo1">직접 입력</label>
									
						<input type="radio" name="insertUserInfo" id="insertUserInfo2"> 
						<label for="insertUserInfo2">회원과 동일 정보 입력</label>			
					</p>
					<div class="form-group">			
						<label class="col-sm-2 control-label">예약자 이름</label>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="resUName" id="resUName">
						</div>
					</div>
					<div class="form-group">			
						<label class="col-sm-2 control-label">이메일</label>
						<div class="col-xs-2">
							<input class="form-control" type="email" name="resUMail" id="resUMail">
						</div>
					</div>
					<div class="form-group">			
						<label class="col-sm-2 control-label">연락처</label>
						<div class="col-xs-2">
							<select class="form-control" name="resUTel1" id="resUTel1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>			
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="resUTel2" id="resUTel2">
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="resUTel3" id="resUTel3">
						</div>
					</div>
				</div>
				
				<div id="userRight">
					<h4>운전자 정보 입력</h4>
					<p>			
						<input type="radio" name="insertDrvInfo" id="insertDrvInfo1" checked>
						<label for="insertDrvInfo1">직접 입력</label>
									
						<input type="radio" name="insertDrvInfo" id="insertDrvInfo2"> 
						<label for="insertDrvInfo2">회원과 동일 정보 입력</label>			
					</p>
					<div class="form-group">			
						<label class="col-sm-2 control-label">운전자 이름</label>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="resDrvName" id="resDrvName">
						</div>
					</div>
					<div class="form-group">			
						<label class="col-sm-2 control-label">면허증</label>
						<div class="col-xs-2">
							<select class="form-control" id="resDrvCategory" name="resDrvCategory" >	           			
				           			<option value="1종 보통">1종 보통</option>
				           			<option value="1종 소형">1종 소형</option>
				           			<option value="1종 대형">1종 대형</option>
				           			<option value="1종 특수">1종 특수</option>
				           			<option value="2종 보통">2종 보통</option>
				           			<option value="2종 소형">2종 소형</option>
				           	</select>
						</div>
					</div>
					<div class="form-group">			
						<label class="col-sm-2 control-label">연락처</label>
						<div class="col-xs-2">
							<select class="form-control" name="resDrvTel1" id="resDrvTel1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>			
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="resDrvTel2" id="resDrvTel2">
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="resDrvTel3" id="resDrvTel3">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">생년월일</label>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="resDrvBirth" id="resDrvBirth">
						</div>
					</div>
					
					<div class=form-group>
						<label class="col-sm-2 control-label"></label>		
						<div class="col-sm-6">
							<input class="btn btn-primary btn-lg btn-block" type="submit" value="예약하기" name="btsubmit" id="btsubmit" >
						</div>
					</div>					
				</div>
			</div>
			<!-- 예약자 정보 입력 끝 -->
			
			</fieldset>
		</form>
	
	<br>
	<br>
</div>
<%@ include file="../inc_user/bottom.jsp"%>