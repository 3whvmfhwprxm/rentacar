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

</head>
<body>
	<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<body>
    <header>
        <div class="center-block text-center">
            <h3>
                업체 관리자<BR>
            </h3>
        </div>
    </header>
    
    <nav class="navbar navbar-default mega-nav">
        <div class="container">
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
                        <li><a href="#">예약현황</a></li>
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
               
                <li><a href="#">후기관리</a></li>
                <li><a href="#">통계관리</a></li>
                <li><a href="#">공지사항</a></li>
            </ul>
            <form id="mega-search" class="navbar-form navbar-right">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
            </form>
        </div>
        </div>
    </nav>
    

