<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin_Detail.css" />

<div class="row">
	<div class="col-md-8">
		<div class="md-macbook-pro md-glare">
			<div class="md-lid">
				<div class="md-camera"></div>
				<div class="md-screen">
					<!-- content goes here -->
					<div class="tab-featured-image">
						<div class="tab-content">
							<div class="tab-pane  in active" id="tab1">
								<img class="img img-responsive" alt="업체 로고"
									src='<c:url value="/companyLogo/${companyVo.comLogo}" />'>
							</div>
							
							<div class="tab-pane " id="tab2">
                                <img src="https://unsplash.imgix.net/uploads/1411724908903377d4696/2e9b0cb2?dpr=2&fit=crop&fm=jpg&h=650&q=75&w=950">      
                            </div>
                            
							<div class="tab-pane  in active" id="tab1">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="md-base"></div>
		</div>
	</div>

	<div class="col-md-4">
		<!-- begin panel group -->
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">

			<div class="panel panel-default">
				<span class="side-tab" data-target="#tab1" data-toggle="tab"
					role="tab" aria-expanded="false">
					<div class="panel-heading" role="tab" id="headingOne"
						data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne" aria-expanded="true"
						aria-controls="collapseOne">
						<h4 class="panel-title" style="font-weight: bold;">업체 상세정보</h4>
					</div>
				</span>

				<div id="collapseOne" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">		
						<p><span style="font-weight: bold; font-size: 1.2em;">업체명: </span> 
							<span>${companyVo.comName}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">사업자 번호: </span>
							<span>${companyVo.comNum}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">대표번호: </span>
							<span>${companyVo.comTel1}-${companyVo.comTel2}-${companyVo.comTel3}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">핸드폰번호: </span>
							<span>${companyVo.comMobile1}-${companyVo.comMobile2}-${companyVo.comMobile3}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">팩스 번호: </span>
							<span>${companyVo.comFax1}-${companyVo.comFax2}-${companyVo.comFax3}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">회사 주소: </span>
							<span>${companyVo.comAddress}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">대표자: </span>
							<span>${companyVo.comCeo}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">회사 이메일: </span>
							<span>${companyVo.comEmail}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">등록일: </span>
							<span><fmt:formatDate value="${companyVo.comRegdate}" pattern="yyyy-MM-dd" /></span></p>
						<c:if test="${!empty companyVo.comOutdate}">
						<p><span style="font-weight: bold; font-size: 1.2em;">탈퇴일: </span>
							<span><fmt:formatDate value="${companyVo.comOutdate}" pattern="yyyy-MM-dd" /></span></p>
						</c:if>
					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<span class="side-tab" data-target="#tab2" data-toggle="tab"
					role="tab" aria-expanded="false">
					<div class="panel-heading" role="tab" id="headingTwo"
						data-toggle="collapse" data-parent="#accordion"
						href="#collapseTwo" aria-expanded="false"
						aria-controls="collapseTwo">
						<h4 class="panel-title collapsed" style="font-weight: bold;">회사 위치</h4>
					</div>
				</span>

				<div id="collapseTwo" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingTwo">
					<div class="panel-body">
						tab 2 content
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<div>
	<a href='<c:url value="/administrator/company/companyList.do" />'
		data-original-title="go to the List" data-toggle="tooltip"
		type="button" class="btn btn-default"> <i
		class="fa fa-list-ul" aria-hidden="true"></i>목록
	</a> <a
		href='<c:url value="/administrator/company/companyEdit.do?comId=${companyVo.comId}"/>'
		data-original-title="Edit this user" data-toggle="tooltip"
		type="button" class="btn btn-default"> <i
		class="fa fa-pencil-square-o" aria-hidden="true"></i>수정
	</a> <a
		href="<c:url value='/administrator/company/companyWithdraw.do?comId=${companyVo.comId}'/>"
		data-original-title="Remove this user" data-toggle="tooltip"
		type="button" class="btn btn-default"> <i
		class="fa fa-times" aria-hidden="true"></i>삭제
	</a>
</div>

<%@ include file="../include/bottom.jsp"%>