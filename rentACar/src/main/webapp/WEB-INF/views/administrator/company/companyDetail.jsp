<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin_Detail.css" />

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

<div class="row">
	<div class="col-md-12">
		<h1 style="text-align: center;">${param.comId} 상세보기</h1>
	</div>
</div>

<div class="row">
	<div class="col-sm-6">
		<div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
			<div class="media">
				<a class="pull-left" href="#" target="_parent">
					<img width="50px" height="50px" alt="image" class="img-responsive"
						src='<c:url value="/companyLogo/${companyVo.comLogo}" />'>
				</a>
				<div class="clearfix visible-sm"></div>

				<div class="media-body fnt-smaller">
					<a href="#" target="_parent"></a>
					
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/bottom.jsp"%>