<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin_Detail.css" />

<div class=w3-container>
	<div class="card">
		<div class="container-fliud">
			<div class="wrapper row">
				<div class="preview col-md-6">	
					<div class="preview-pic tab-content">
				        <div class="tab-pane active" id="pic-1">
				            <img src='<c:url value="/carImages/${carVo.carImg}" />' />
				        </div>
					</div>	
				</div>
				
				<div class="details col-md-6">
					<h1 class="product-title">
						<i class="fa fa-car w3-xxxlarge"></i> ${carVo.carName}의 상세정보
					</h1>
	
					<div>
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
						<a href='<c:url value="/administrator/carModel/modelEdit.do?carCode=${carVo.carCode}"/>'>
						<button type="submit" class="btn btn-default">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i>수정
						</button>
						</a>
						
						<a href='<c:url value="/administrator/carModel/modelList.do" />'>
						<button type="button" class="btn btn-default">	
							<i class="fa fa-list-ul" aria-hidden="true"></i>목록
						</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../include/bottom.jsp"%>