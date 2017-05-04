<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin_Detail.css" />

<script type="text/javascript" 
	src="//apis.daum.net/maps/maps3.js?apikey=efc3625556d3948610f5295a4a5e8968&libraries=services">
</script>

<div class=w3-container>
	<div class="card">
		<div class="container-fliud">
			<div class="wrapper row">
				<div class="preview col-md-6">	
					<div class="preview-pic tab-content">
				        <div class="tab-pane active" id="pic-1">
				            <img src='<c:url value="/companyLogo/${companyVo.comLogo}" />' />
				        </div>
					</div>	
				</div>
				
				<div class="details col-md-6">
					<h1 class="product-title">
						<i class="fa fa-mixcloud w3-xxxlarge"></i> ${param.comId}의 상세정보
					</h1>
	
					<div>
						<span style="font-size: 1.1em; font-weight: bold;">업체아이디:</span> 
							${companyVo.comId}<br>
						<span style="font-size: 1.1em; font-weight: bold;">업체명:</span> 
							${companyVo.comName}<br>
						<span style="font-size: 1.1em; font-weight: bold;">사업자번호:</span> 
							${companyVo.comNum}<br>
						<span style="font-size: 1.1em; font-weight: bold;">계좌번호:</span> 
							${companyVo.comAccNum}<br>
						<span style="font-size: 1.1em; font-weight: bold;">대표번호:</span>> 
							${companyVo.comTel1}-${companyVo.comTel2}-${companyVo.comTel3}<br>
						<span style="font-size: 1.1em; font-weight: bold;">휴대폰:</span> 
							${companyVo.comMobile1}-${companyVo.comMobile2}-${companyVo.comMobile3}<br>
						<span style="font-size: 1.1em; font-weight: bold;">팩스번호:</span> 
							${companyVo.comFax1}-${companyVo.comFax2}-${companyVo.comFax3}<br>
						<span style="font-size: 1.1em; font-weight: bold;">주소:</span> 
							${companyVo.comAddress}<br>
						<span style="font-size: 1.1em; font-weight: bold;">대표자:</span> 
							${companyVo.comCeo}<br>
						<span style="font-size: 1.1em; font-weight: bold;">대표메일:</span> 
							${companyVo.comEmail}<br>
						<span style="font-size: 1.1em; font-weight: bold;">수수료(%):</span> 
							${companyVo.comRate}%<br>
						<span style="font-size: 1.1em; font-weight: bold;">가입일:</span> 
							${companyVo.comRegdate}<br>
						<c:if test="${!empty companyVo.comOutdate}">
						<span style="font-size: 1.1em; font-weight: bold;">탈퇴일:</span> 
							${companyVo.comOutdate}<br>
						</c:if>
						<br>
						<a href='<c:url value="/administrator/company/companyList.do" />'
							data-original-title="go to the List" data-toggle="tooltip"
							type="button" class="btn btn-default"> <i
							class="fa fa-list-ul" aria-hidden="true"></i>목록
						</a> 
						<a href='<c:url value="/administrator/company/companyEdit.do?comId=${param.comId}"/>'
							data-original-title="Edit this user" data-toggle="tooltip"
							type="button" class="btn btn-default"> <i
							class="fa fa-pencil-square-o" aria-hidden="true"></i>수정
						</a>
						<a href='<c:url value="/administrator/company/companyWithdraw.do?comId=${companyVo.comId}" />'
							data-original-title="withdraw this user" data-toggle="tooltip"
							type="button" class="btn btn-default"> <i 
							class="fa fa-times" aria-hidden="true"></i>탈퇴
						</a>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
	<!-- 인수/반납 장소 표시 -->
    <p><strong>인수/반납 주소: </strong>인천광역시 서구 완정로65번안길 10 (마전동 , 검단1차 대주피오레아파트) 114동 903호</p>
    <div id="map"></div>
    <input type="hidden" id="mapInfo" name="mapInfo" value="인천광역시 서구 완정로65번안길 10 (마전동 , 검단1차 대주피오레아파트) 114동 903호">    
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
</div>

<%@ include file="../include/bottom.jsp"%>