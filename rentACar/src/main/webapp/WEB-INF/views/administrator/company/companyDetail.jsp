<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin_Detail.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/coupon_style.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=efc3625556d3948610f5295a4a5e8968&libraries=services"></script>

<style type="text/css">
	.bodyClass {
		padding-top: 30px;
		width: 85%;
		padding-left: 40px;
	}
</style>

<div class="bodyClass">
	<div class=w3-container>
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						<div class="preview-pic tab-content">
							<div class="tab-pane active" id="pic-1" style="height: 550px;">
								<img
									src='<c:url value="/companyLogo_upload/${companyVo.comLogo}" />' />
							</div>
						</div>
					</div>

					<div class="details col-md-6">
						<h1 class="product-title">
							<i class="fa fa-mixcloud w3-xxxlarge"></i> ${param.comId}의 상세정보
						</h1>

						<div>
							<p>
								<span style="font-size: 1.1em; font-weight: bold;">업체아이디:</span>
								${companyVo.comId}
							</p>
							<p>
								<span style="font-size: 1.1em; font-weight: bold;">업체명:</span>
								${companyVo.comName}
							</p>
							<p>
								<span style="font-size: 1.1em; font-weight: bold;">사업자번호:</span>
								${companyVo.comNum}
							</p>
							<p>
								<span style="font-size: 1.1em; font-weight: bold;">계좌번호:</span>
								${companyVo.comAccNum}
							</p>
							<p>
								<span style="font-size: 1.1em; font-weight: bold;">대표번호:</span>
								${companyVo.comTel1}-${companyVo.comTel2}-${companyVo.comTel3}
							</p>
							<p>
								<span style="font-size: 1.1em; font-weight: bold;">휴대폰:</span>
								${companyVo.comMobile1}-${companyVo.comMobile2}-${companyVo.comMobile3}
							</p>
							<p>
								<span style="font-size: 1.1em; font-weight: bold;">팩스번호:</span>
								${companyVo.comFax1}-${companyVo.comFax2}-${companyVo.comFax3}
							</p>
							<p>
								<span style="font-size: 1.1em; font-weight: bold;">주소:</span>
								${companyVo.comAddress}
							</p>
							<p>
								<span style="font-size: 1.1em; font-weight: bold;">대표자:</span>
								${companyVo.comCeo}
							</p>
							<p>
								<span style="font-size: 1.1em; font-weight: bold;">대표메일:</span>
								${companyVo.comEmail}
							</p>
							<p>
								<span style="font-size: 1.1em; font-weight: bold;">수수료(%):</span>
								${companyVo.comRate}%
							</p>
							<p>
								<span style="font-size: 1.1em; font-weight: bold;">가입일:</span>
								${companyVo.comRegdate}
							</p>
							<c:if test="${!empty companyVo.comOutdate}">
								<span style="font-size: 1.1em; font-weight: bold;">탈퇴일:</span> 
							${companyVo.comOutdate}
						</c:if>
							<a href='<c:url value="/administrator/company/companyList.do" />'
								data-original-title="go to the List" data-toggle="tooltip"
								type="button" class="btn btn-default"> <i
								class="fa fa-list-ul" aria-hidden="true"></i>목록
							</a> <a
								href='<c:url value="/administrator/company/companyEdit.do?comId=${param.comId}"/>'
								data-original-title="Edit this user" data-toggle="tooltip"
								type="button" class="btn btn-default"> <i
								class="fa fa-pencil-square-o" aria-hidden="true"></i>수정
							</a>
						</div>
					</div>


				</div>
			</div>
		</div>
		<!-- 회사위치 -->
		<p>
			<strong>회사위치: </strong>${companyVo.comAddress}</p>
		<div id="map"></div>
		<input type="hidden" id="mapInfo" name="mapInfo"
			value="인천 서구 완정로65번안길 10 대주피오레 114동 903호">
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
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

					var coords = new daum.maps.LatLng(
							result.addr[0].lat,
							result.addr[0].lng);

					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new daum.maps.Marker({
						map : map,
						position : coords
					});

					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = new daum.maps.InfoWindow(
							{
								content : '<div style="width:150px;text-align:center;padding:6px 0;">회사위치</div>'
							});
					infowindow.open(map, marker);

					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
			});
		</script>
	</div>
</div>
<%@ include file="../include/bottom.jsp"%>