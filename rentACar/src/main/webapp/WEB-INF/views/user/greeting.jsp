<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_user/top.jsp"%>

<style type="text/css">
	#img{
		width: 70%;
	}
	#div1{
		text-align: center;
		padding: 20px;
	}
	#map{
		text-align: center;
		padding: 20px;
	}
	
</style> 
<div id="container" class="center">
	<div class="content-wrap">
		<div>
			<div>
				<div id="div1">
					<img id="img" src="<c:url value="/user_img/con_11.jpg"/>" alt="이미지0">
				</div>
			</div>
		</div>
	</div>
</div>
<!--//container-->
<div>
	<div id="map" style="width:70%;height:500px;"></div>
</div>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=0f24996b0e58b92f5c277a3bf3b4f066"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>


<%@ include file="../inc_user/bottom.jsp"%>