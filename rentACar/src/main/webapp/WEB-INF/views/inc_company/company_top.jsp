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

<title>company 메뉴</title>
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/com_top.css" />

<script type="text/javascript"
	src='<c:url value="/jquery/jquery-3.1.1.min.js"/>'></script>
	
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    //Hover Menu in Header
    $('ul.nav li.dropdown').hover(function () {
        $(this).find('.mega-dropdown-menu').stop(true, true).delay(200).fadeIn(200);
        $('.darkness').stop(true, true).fadeIn();
    }, function () {
        $(this).find('.mega-dropdown-menu').stop(true, true).delay(200).fadeOut(200);
         $('.darkness').stop(true, true).delay(200).fadeOut();
    });
});
</script>
<style >
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
@import url(http://fonts.googleapis.com/earlyaccess/kopubbatang.css);
      .hh {font-family: 'Hanna'; }
      .nbs {font-family: 'Nanum Brush Script';}
      .ng {font-family: 'Nanum Gothic';}
      .ngc {font-family: 'Nanum Gothic Coding';}
      .nm {font-family: 'Nanum Myeongjo';}
      .h3{font-family: 'Nanum Pen Script'; font-size: 50px;}
    
</style>
<style type="text/css">
.text-right1{
	padding-left: 80%;
}
.navbar-brand1{
    height: 50px;
    padding: 15px 0px 10px 15px;
    font-size: 18px;
}
.container1{
	font-family: 'Nanum Gothic Coding'; font-size: 18px;
    margin-left: auto;
    width: 970px;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
}

/*탑 하위 메뉴  */
.dropdown-menu>li>a {
    display: block;
    padding: 3px 20px;
    clear: both;
    font-weight: 400;
    line-height: 1.42857143;
    color: #333;
    white-space: nowrap;
    font-size: 15px;
}
.dropdown-menu>li>a:HOVER{
	background-color: #2a8fcf;
}
.dropdown-menu .divider {
    height: 1px;
    margin: 9px 0;
    overflow: hidden;
    background-color: #2a8fcf;
}


</style>
</head>
<body>
	<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<body>
    <header>
        <div class="center-block text-center">
            <h3 class="h3">업체관리자</h3>
        </div>
        <nav class="text-right1">
	        <c:if test="${!empty sessionScope.comId }">
				<span class="navbar-brand1">${sessionScope.comName } 님 접속중 </span>
				<span class="navbar-brand1"><a href="<c:url value='/login_company/com_logout.do'/>">로그아웃</a></span>
			</c:if>
			<c:if test="${empty sessionScope.comId }">
				<span class="navbar-brand1"><a href="${pageContext.request.contextPath }/login_company/com_login.do">로그인</a></span>
			</c:if>
		</nav>
    </header>
    
    <nav class="navbar navbar-default mega-nav">
        <div class="container1">
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#MainMenu" aria-expanded="false">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	            </button>
	        </div>
	        <div class="collapse navbar-collapse" id="MainMenu">
	            <ul class="nav navbar-nav menu-list">
	            	 <li class="dropdown list-category">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
	                        <i class="fa fa-navicon"></i> 예약 관리 <i class="fa fa-angle-down" aria-hidden="true"></i>
	                    </a>
	                    <ul class="dropdown-menu mega-dropdown-menu">
	                        <li><a href="<c:url value='/com_manage/company_reservList.do'/>">예약현황</a></li>
	                        <li><a href="#">차량현황</a></li>
	                        <li role="separator" class="divider"></li>
	                        <li><a href="#">View all</a></li>
	                    </ul>
	                </li>
	                <li class="dropdown list-category">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
	                        <i class="fa fa-navicon"></i> 차량 관리 <i class="fa fa-angle-down" aria-hidden="true"></i>
	                    </a>
	                    <ul class="dropdown-menu mega-dropdown-menu">
	                        <li><a href='<c:url value="/com_manage/company_ccarList.do"/>'>차량현황</a></li>
	                        <li><a href='<c:url value="/com_manage/company_optionRegist.do"/>'>차량등록</a></li>
	                        <li><a href="#">Air Conditioner</a></li>
	                        <li><a href="#">Radiator</a></li>
	                        <li><a href="#">Washing Machine</a></li>
	                        <li role="separator" class="divider"></li>
	                        <li><a href="#">View all</a></li>
	                    </ul>
	                </li>
	                <li class="dropdown list-category">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
	                        <i class="fa fa-navicon"></i> 매출/통계 관리 <i class="fa fa-angle-down" aria-hidden="true"></i>
	                    </a>
	                    <ul class="dropdown-menu mega-dropdown-menu">
	                        <li><a href='<c:url value="/com_manage/company_revenue.do"/>'>일별 매출 현황</a></li>
	                        <li><a href='<c:url value="/com_manage/company_revenue.do"/>'>월별 매출 현황</a></li>
	                        <li role="separator" class="divider"></li>
	                        <li><a href='<c:url value="/com_manage/company_revenue.do"/>'>월별 정산 현황</a></li>
	                    </ul>
	                </li>
	               
	                <li><a href='<c:url value="/com_manage/company_epilogue.do"/>'>후기관리</a></li>
	                <li><a href='<c:url value="/com_manage/company_announcement.do"/>'>공지사항</a></li>
	                <li><a href='<c:url value="/com_manage/company_detail.do?comId=${comId}"/>'>내업체정보</a></li>
	            </ul>
	        </div>
        </div>
    </nav>
    

