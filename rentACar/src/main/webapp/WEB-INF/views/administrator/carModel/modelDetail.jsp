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
								<img class="img img-responsive" alt="자동차 이미지"
									src='<c:url value="/carImages/${carVo.carImg}" />'>
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
						<h4 class="panel-title" style="font-weight: bold;">차량 상세정보</h4>
					</div>
				</span>

				<div id="collapseOne" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">		
						<p><span style="font-weight: bold; font-size: 1.2em;">모델코드: </span> 
							<span>${carVo.carCode}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">모델명: </span>
							<span>${carVo.carName}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">제조사: </span>
							<span>${carVo.carInc}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">승차인원: </span>
							<span>${carVo.carSize}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">변속기: </span>
							<span>${carVo.carTrans}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">차량유형: </span>
							<span>${carVo.carType}</span></p>
						<p><span style="font-weight: bold; font-size: 1.2em;">등록일: </span>
							<span>
								<fmt:formatDate value="${carVo.carRegdate}"
									pattern="yyyy-MM-dd" />
							</span>
						</p>					
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
	<a href='<c:url value="/administrator/carModel/modelList.do" />'
		data-original-title="go to the List" data-toggle="tooltip"
		type="button" class="btn btn-default"> <i
		class="fa fa-list-ul" aria-hidden="true"></i>목록
	</a> 
	<a href='<c:url value="/administrator/carModel/modelEdit.do?carCode=${carVo.carCode}"/>'
		data-original-title="Edit this user" data-toggle="tooltip"
		type="button" class="btn btn-default"> <i
		class="fa fa-pencil-square-o" aria-hidden="true"></i>수정
	</a>
</div>

<%@ include file="../include/bottom.jsp"%>