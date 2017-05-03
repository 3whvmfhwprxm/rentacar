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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/bottom.jsp"%>