<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Case</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/top.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin_bottom.css" />

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-3.1.1.min.js">
</script>
	
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active">
						<a href='<c:url value="/administrator/admin_Main.do" />'>Home</a></li>
					<li>
						<a href='<c:url value="/administrator/user/userList.do" />'>
							회원 관리
						</a>
					</li>
					
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" 
							href='#'>
								업체관리
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
				            <li>
				            	<a href='<c:url value="/administrator/company/companyList.do" />'>
				            		업체 리스트
				            	</a>
				            </li>
				            <li>
				            	<a href='<c:url value="/administrator/company/companyCar.do" />'>
				            		업체 보유차랑
				            	</a>
				            </li>
				            <li>
					            <a href='<c:url value="/administrator/company/companyOutList.do" />'>
					            	탈퇴 업체 조회
					            </a>
				            </li>
				        </ul>
					</li>
					
					<li>
						<a href='<c:url value="/administrator/carModel/modelList.do" />'>
							차모델관리
						</a>
					</li>
					
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" 
							href='#'>
								게시판 관리
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
				            <li>
				            	<a href='#'>
				            		후기 관리
				            	</a>
				            </li>
				            <li>
				            	<a href='<c:url value="/admin/Board/uNotice.do" />' >
				            		고객 공지
				            	</a>
				            </li>
				            <li>
					            <a href='<c:url value="/admin/Board/cNotice.do" />'>
					            	업체 공지
					            </a>
				            </li>
				            <li>
					            <a href='<c:url value="/admin/Board/scNotice.do" />'>
					            	상담사 공지
					            </a>
				            </li>
				            <li>
					            <a href='<c:url value="/admin/Board/scNotice.do" />'>
					            	FAQ 관리
					            </a>
				            </li>
				        </ul>
					</li>
					
					<li>
						<a href='#'>
							결재내역관리
						</a>
					</li>
					
					<li>
						<a href='#'>
							예약관리
						</a>
					</li>
					
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" 
							href='#'>
								통계/정산관리
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
				            <li>
				            	<a href='#'>
				            		년, 월별 통계
				            	</a>
				            </li>
				            <li>
				            	<a href='#' >
				            		업체별 통계
				            	</a>
				            </li>
				            <li>
					            <a href='#'>
					            	업체 정산 관리
					            </a>
				            </li>
				        </ul>
					</li>
					
					<li>
						<a href='#'>
							이벤트 관리
						</a>
					</li>
					
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" 
							href='#'>
								관리자 관리
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
				            <li>
				            	<a href='<c:url value="/admin/Mng/adminList.do" />' >
				            		관리자 리스트
				            	</a>
				            </li>
				            <li>
				            	<a href='<c:url value="/admin/Mng/adminJoin.do" />'>
				            		관리자 추가
				            	</a>
				            </li>
				        </ul>
					</li>	
				</ul>
				<ul class="nav navbar-nav navbar-right">
				<c:if test="${sessionScope.Admin_Id==null}">
					<li>
						<a href='<c:url value="/administrator/log/logIn.do" />'>
							<span class="glyphicon glyphicon-log-in">
							</span>
							Log In
						</a>
					</li>
				</c:if>
				<c:if test="${sessionScope.Admin_Id!=null}">
					<li>
						<a href='<c:url value="/administrator/log/logout.do" />'>
							<span class="glyphicon glyphicon-log-out">
							</span>
							log Out
						</a>
					</li>
				</c:if>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
	
	

