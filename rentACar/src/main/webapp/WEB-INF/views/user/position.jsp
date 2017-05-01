<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_user/top.jsp"%>

<style type="text/css">
	#img{
		width: 70%;
	}
	#div1{
		text-align: center;
		padding: 10px;
	}
	#daumRoughmapContainer1493633864126{
		padding: 20px;
		margin: auto;
	}
	
</style> 
<div id="container" class="center">
	<div class="content-wrap">
		<div>
			<div>
				<div id="div1">
					<p class="f_bold">(주)3조렌트카</p>
			        <p class="t_10">Tel : 1500-1400 / 090-1142-8625</p>
			        <p>Address : 서울특별시 영등포구 양평로 12길 9, 204호</p>
			        <p>Business Hours : 오전9시 ~ 오후8시</p>
 
					<div id="daumRoughmapContainer1493633864126" class="root_daum_roughmap root_daum_roughmap_landing"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--//container-->



<!-- * Daum 지도 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->


<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1493633864126",
		"key" : "hh5d",
		"mapWidth" : "1200",
		"mapHeight" : "550"
	}).render();
</script>





<%@ include file="../inc_user/bottom.jsp"%>