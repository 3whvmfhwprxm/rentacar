<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>administrator 메뉴</title>
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/top.css" />

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />

<script type="text/javascript"
	src='<c:url value="/jquery/jquery-3.1.1.min.js"/>'></script>
	
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<script type="text/javascript">
$(document).ready(function(){
    $(".dropdown1").hover(            
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("400");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("400");
            $(this).toggleClass('open');       
        }
    );
});
</script>
</head>
<body>
	<!--  -->
	<div class="container">
		<nav class="navbar navbar-inverse">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"> 렌트카 관리자 </a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">

						<li class="dropdown mega-dropdown"><a href="<c:url value='/administrator/user/userList.do' />">회원관리 </a>
						</li>
						
						<li class="dropdown mega-dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">업체관리 </a>
							<ul class="dropdown-menu mega-dropdown-menu">
								<li class="col-sm-2"><a
									href='<c:url value="/administrator/company/companyList.do" />'>업체 리스트</a></li>
								<li class="col-sm-2"><a
									href='<c:url value="/administrator/company/companyRegister.do" />'>업체 등록</a></li>
								<li class="col-sm-2"><a
									href='<c:url value="/administrator/company/companyCar.do" />'>업체 보유 차량</a></li>
								<li class="col-sm-2"><a
									href='<c:url value="/administrator/company/companyWithdraw.do" />'>탈퇴 업체 조회</a></li>
							</ul>
						</li>
						
						<li class="dropdown mega-dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">차모델관리 </a>
							<ul class="dropdown-menu mega-dropdown-menu">
								<li class="col-sm-4"><a href="#" >모델 등록 </a></li>
								<li class="col-sm-4"><a href="#" >모델 수정 </a></li>
								<li class="col-sm-4"><a href="#" >모델 삭제 </a></li>
							</ul>
						</li>
						
						<li class="dropdown mega-dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">게시판관리 </a>
							<ul class="dropdown-menu mega-dropdown-menu">								
								<li class="col-sm-2"><a href="#" >후기 관리 </a></li>
								<li class="col-sm-2"><a href="<c:url value='/admin/Board/uNotice.do' />" >고객 공지 </a></li>
								<li class="col-sm-2"><a href="<c:url value='/admin/Board/cNotice.do' />" >업체 공지 </a></li>
								<li class="col-sm-2"><a href="<c:url value='/admin/Board/scNotice.do' />" >상담사 공지 </a></li>
								<li class="col-sm-2"><a href="#" >FAQ 관리 </a></li>								
							</ul>
						</li>
						
						<li class="dropdown mega-dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">결제내역관리 </a>
						</li>
						
						<li class="dropdown mega-dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">예약관리 </a>
						</li>
						
						<li class="dropdown mega-dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">통계/정산관리 </a>
							<ul class="dropdown-menu mega-dropdown-menu">								
								<li class="col-sm-4"><a href="#" >년,월별 통계</a></li>
								<li class="col-sm-4"><a href="#" >업체별 통계</a></li>
								<li class="col-sm-4"><a href="#" >업체 정산 관리</a></li>								
							</ul>
						</li>
										
						<li class="dropdown mega-dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">관리자 관리 </a>
							<ul class="dropdown-menu mega-dropdown-menu">								
								<li class="col-sm-6"><a href="<c:url value='/admin/Mng/adminJoin.do' />" >관리자 추가</a></li>
								<li class="col-sm-6"><a href="<c:url value='/admin/Mng/adminList.do' />" >관리자 조회(수정)</a></li>								
							</ul>
						</li>

					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>

	<!--  -->