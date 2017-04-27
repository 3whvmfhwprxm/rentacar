<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin_companyCar.css" />

<style type="text/css">
	th {
		text-align: center;
	}
	
	.col-md-4 {
		float: left;
		width: 100%;
		margin: 0 auto;
		text-align: center;
	}
</style>

<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>

<form name="frmPage" method="post"
	action='<c:url value="/administrator/company/companyCar.do" />'>
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>

<div class="container container-pad" id="property-listings">
	<div class="row">
		<div class="col-md-12">
			<h1 style="text-align: center;">${param.comId} 보유 차량</h1>
		</div>
	</div>

	<!-- 왼쪽 반복 시작 -->
	<div class="row">
		<c:forEach var="map" items="${cclist}">
		<div class="col-sm-6">
			<div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
				<div class="media">
					<a class="pull-left" href="#" target="_parent">
						<img alt="image" class="img-responsive"
							src='<c:url value="/carImages/${map['CAR_IMG']}" />'>
					</a>
					<div class="clearfix visible-sm"></div>

					<div class="media-body fnt-smaller">
						<a href="#" target="_parent"></a>

						<h4>
							${map['COM_ID']}
						</h4>

						<ul class="list-inline mrg-0 btm-mrg-10 clr-535353">
							<c:if test="${!empty map['CAR_FUEL']}">
								<li>${map['CAR_FUEL']} </li>
							</c:if>
							
							<c:if test="${map['CCAR_BLACKBOX_YN']!='N'}">
								<li>블랙박스 </li>
							</c:if>
							
							<c:if test="${map['CCAR_SMOKE_YN']!='N'}">
								<li>금연차량 </li>
							</c:if>
							
							<c:if test="${map['CCAR_REAR_CAMERA_YN']!='N'}">
								<li>후방카메라 </li>
							</c:if>
							
							<c:if test="${map['CCAR_REAR_SENCE_YN']!='N'}">
								<li>후방센서</li>
							</c:if>
							
							<c:if test="${map['CCAR_NAVI_YN']!='N'}">
								<li>네비게이션 </li>
							</c:if>
							
							<c:if test="${map['CCAR_SUN_ROOF_YN']!='N'}">
								<li>썬루프 </li>
							</c:if>
							
							<c:if test="${map['CCAR_BLUETOOTH_YN']!='N'}">
								<li>블루투스 </li>
							</c:if>
							
							<c:if test="${map['CCAR_AUX_YN']!='N'}">
								<li>AUX </li>
							</c:if>
							
							<c:if test="${map['CCAR_SMARTKEY_YN']!='N'}">
								<li>스마트키</li>
							</c:if>
						</ul>

						<p class="hidden-xs">Situated between fairmount park and the
							prestigious philadelphia cricket club, this beautiful 2+ acre
							property is truly ...
						</p>
						
						<span class="fnt-smaller fnt-lighter fnt-arial">
							Courtesy of HS Fox & Roach-Chestnut Hill Evergreen
						</span>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	<!-- End row -->
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
</div>
<!-- End container -->


<%@ include file="../include/bottom.jsp"%>