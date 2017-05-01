<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>유저메인</title>
<script type="text/javascript">
	var child;
 	function openJoin(){
 		child = window.open("<c:url value='/user/clause.do'/>", 'reg',
			"height=700,width=790,left=200,top=50,toolbar=no,scrollbars=yes,status=no,resizable=yes");
 	}
 	 window.allright = function(){
 		location.href="<c:url value='/user/register.do'/>";
 	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Free Responsive Admin Theme - ZONTAL</title>
    <!-- BOOTSTRAP CORE STYLE  -->
     <script type="text/javascript">
//<![CDATA[
//try{if (!window.CloudFlare) {var CloudFlare=[{verbose:0,p:0,byc:0,owlid:"cf",bag2:1,mirage2:0,oracle:0,paths:{cloudflare:"/cdn-cgi/nexp/dok3v=1613a3a185/"},atok:"6331141e2217db0e72f71e8b02fe8fe4",petok:"14f4c6a93b203d4c27363dc962c5dbd6ae8d672b-1492669658-1800",zone:"designbootstrap.com",rocket:"a",apps:{}}];document.write('<script type="text/javascript" src="//ajax.cloudflare.com/cdn-cgi/nexp/dok3v=905ca5bd16/cloudflare.min.js"><'+'\/script>');}}catch(e){};
//]]>
</script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<%-- <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" /> --%>
    <!-- FONT AWESOME ICONS  -->
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
     <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!-- <script data-rocketsrc="http://www.designbootstrap.com/track/ga.js"  type="text/rocketscript"></script> -->
</head>
<body>
    <header>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <strong>문의: </strong> WheneverYes@rent3.com
                    <!-- <a class="__cf_email__" href="/cdn-cgi/l/email-protection" data-cfemail="4821262e270831273d3a2c2725292126662b2725">[email&#160;protected]</a><script data-cfhash='f9e31' type="text/javascript">/* <![CDATA[ */!function(t,e,r,n,c,a,p){try{t=document.currentScript||function(){for(t=document.getElementsByTagName('script'),e=t.length;e--;)if(t[e].getAttribute('data-cfhash'))return t[e]}();if(t&&(c=t.previousSibling)){p=t.parentNode;if(a=c.getAttribute('data-cfemail')){for(e='',r='0x'+a.substr(0,2)|0,n=2;a.length-n;n+=2)e+='%'+('0'+('0x'+a.substr(n,2)^r).toString(16)).slice(-2);p.replaceChild(document.createTextNode(decodeURIComponent(e)),c)}p.removeChild(t)}}catch(u){}}()/* ]]> */</script> -->
                    &nbsp;&nbsp;
                    <strong>고객센터: </strong>1544-XXXX
                </div>
            </div>
        </div>
    </header>
    <!-- HEADER END-->
    <div class="navbar navbar-inverse set-radius-zero">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/user/index.do"">
                    <img src="${pageContext.request.contextPath}/user_img/indexlogo.png" />
                </a>
            </div>
		<!-- dropdown -->
            <div class="left-div">
                <div class="user-settings-wrapper">
                    <ul class="nav">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                                <span class="glyphicon glyphicon-user" style="font-size: 25px;"></span>
                            </a>
                            <div class="dropdown-menu dropdown-settings">
                                <div class="media">
                                    <a class="media-left" href="#">
                                        <img src="${pageContext.request.contextPath}/user_img/usericon.png" alt="" class="img-rounded" />
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">${userName }</h4>
                                    </div>
                                </div>
                                <hr />
                                <c:if test="${!empty sessionScope.userId }">
                                아이디 : <span><strong>${sessionScope.userId}</strong></span><br>
                                면허증 : <span><strong>${userLicense }</strong></span>
                                </c:if>
                                <hr />
                                <c:if test="${!empty sessionScope.userId }">
	                                <a href="${pageContext.request.contextPath}/user/regedit.do" class="btn btn-info btn-sm">Regedit</a>&nbsp; <a href="${pageContext.request.contextPath}/user/logout.do" class="btn btn-danger btn-sm">Logout</a>
                                </c:if>
                                <c:if test="${empty sessionScope.userId }">
	                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/login.do" class="btn btn-danger btn-sm">Login</a>
                                </c:if>
                                
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- LOGO HEADER END-->
    <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                    <c:if test="${empty sessionScope.userId }">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" >회사소개<span class="caret"></span></a>
                            	<ul class="dropdown-menu" role="menu" style="background-color: #00679a;">
				                <li><a href="<c:url value="/user/greeting.do"/>">인사말</a></li>
				                <li><a href="#">회사위치</a></li>
				                <li><a href="#">지점안내</a></li>
				              </ul> 
                            </li>
                            <li><a href="${pageContext.request.contextPath}/user/realTime.do">실시간예약</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/confirm.do">예약확인</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/review.do">이용후기</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/serviceCenter.do">고객센터</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/benefits.do">이용혜택</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/login.do">LOGIN</a></li>
                            <li><a href="javascript:openJoin();">회원가입</a></li>
                        </ul>
                    </c:if>
                     <c:if test="${!empty sessionScope.userId }">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a href="${pageContext.request.contextPath}/user/realTime.do">실시간예약</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/confirm.do">예약확인</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/review.do">이용후기</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/serviceCenter.do">고객센터</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/benefits.do">이용혜택</a></li>
                        </ul>
                    </c:if>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- MENU SECTION END-->
		

		
		
		
		
		
		
		
		
		
		








