<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin_CompanyCarModel.css" />
<div class="row">
	<div class="companyCar col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h1 class="companyCar-title">Company Car</h1>
	</div>

	<div align="center">
		<c:forEach var="vo" items="${carList}">
			<button class="btn btn-default filter-button active" data-filter="all">
				${vo.comId}
			</button>
		</c:forEach>
	</div>

	<div
		class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
		<img src="http://fakeimg.pl/365x365/" class="img-responsive">
	</div>

	<div
		class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter sprinkle">
		<img src="http://fakeimg.pl/365x365/" class="img-responsive">
	</div>

	<div
		class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
		<img src="http://fakeimg.pl/365x365/" class="img-responsive">
	</div>

	<div
		class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter irrigation">
		<img src="http://fakeimg.pl/365x365/" class="img-responsive">
	</div>

	<div
		class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter spray">
		<img src="http://fakeimg.pl/365x365/" class="img-responsive">
	</div>

	<div
		class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter irrigation">
		<img src="http://fakeimg.pl/365x365/" class="img-responsive">
	</div>

	<div
		class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter spray">
		<img src="http://fakeimg.pl/365x365/" class="img-responsive">
	</div>

	<div
		class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter irrigation">
		<img src="http://fakeimg.pl/365x365/" class="img-responsive">
	</div>

	<div
		class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter irrigation">
		<img src="http://fakeimg.pl/365x365/" class="img-responsive">
	</div>
</div>


<%@ include file="../include/bottom.jsp"%>