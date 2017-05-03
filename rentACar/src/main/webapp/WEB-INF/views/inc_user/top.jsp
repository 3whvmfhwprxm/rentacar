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
<style type="text/css">
	body{font-size:12px;font-family:'Nanum Gothic',"맑은 고딕",MalgunGothic,dotum;color:#666;background:#fff}
a{text-decoration:none;color:#666}
strong{font-weight:bold}
input[type=text],select{color:#666;font-family:'Nanum Gothic',"맑은 고딕",MalgunGothic,dotum}
input{margin:0;padding:0}
.wrapper{width:996px;margin:0 auto; min-width:996px;}
#header { padding-bottom:40px; }
#header .top{height:30px;border-bottom:1px solid #d3d3d3;background-color:#f7f7f7; width:100%; min-width:996px; }
#header .top ul{float:left;margin-top:9px}
#header .top ul li{float:left;padding-left:10px;margin-left:9px;background:url("../images/blt/003.png") no-repeat left center;}
#header .top ul li:first-child{padding:0;background:none}
#header .top ul li a{font-size:11px;color:#333}
#header .top .utility{float:right}
#header .top .utility .sns{float:left;margin:4px 0 0 10px}
#header .middle{height:62px}
#header .middle h1{float:left;margin-top:21px}
#header .middle .header_right{float:right;}
#header .middle .header_right span{float:left}
#header .middle .header_right .btns{margin:5px 10px 0 0;color:#d7d7d7}
#header .middle .header_right .btns a{float:left;margin:0 16px}
#header .menu{ width:100%; min-width:996px; height:40px; border-bottom:1px solid #dddddd; background:#e51837; overflow:hidden; position:absolute; top:93px; z-index:10000;}
/*
#gnb { width:100%; height:40px; border-bottom:1px solid #dddddd; background:#e51837; overflow:hidden; position:absolute; top:93px; z-index:10000;  }
*/
#header .menu .wrapper { width:995px; margin:0 auto; position:relative;}
#header .menu .wrapper > ul > li{float:left;width:153px;height:40px;}
#header .menu .wrapper > ul > li > a{display:block;width:100%;height:27px;padding-top:13px;text-align:center}
#header .menu .wrapper > ul > li.last{width:230px;background:#e51837; }
#header .menu .wrapper > ul > li.last > a { padding-top:0;height:40px;}
#header .menu .wrapper > ul > li.on > a, #header .menu .wrapper > ul > li:hover > a {background:#ff6f00;}
#header .menu .wrapper > ul > li.last > a:hover { background:#e51837;}
#header .menu .wrapper > .gnb-full-menu { position:absolute; right:-93px; top:10px; z-index:100000; }

.gnb-full { position:relative; float:left; width:100%; min-width:996px; height:225px; border-top:2px solid #fbb100; border-bottom:2px solid #e51837; background:#ffffff; }
.gnb-full .gnb-sub { width:995px; height:225px; margin:0 auto; border-left:1px solid #dddddd; }
.gnb-full .gnb-sub > li { float:left; width:152px; height:225px; border-right:1px solid #dddddd; }
.gnb-full .gnb-sub > li.last { width:151px; }
.gnb-full .gnb-sub > li > .sub-list { width:152px; margin-top:10px; }
.gnb-full .gnb-sub > li.last > .sub-list { width:151px; }
.gnb-full .gnb-sub > li > .sub-list > li { width:132px; padding-left:20px; height:24px; line-height:24px; }
.gnb-full .gnb-sub > li > .sub-list > li a { text-decoration:none;}
.gnb-full .gnb-sub > li > .sub-list > li:hover { background:#e51837 url(/images/menu/bg_gnb_active.gif) 140px no-repeat;}
.gnb-full .gnb-sub > li > .sub-list > li:hover a { color:#ffffff; font-weight:bold;}
.gnb-full .gnb-sub > li > .sub-list > li.active { background:#e51837 url(/images/menu/bg_gnb_active.gif) 140px no-repeat;}
.gnb-full .gnb-sub > li > .sub-list > li.active a { color:#ffffff; font-weight:bold;}
.gnb-full .gnb-sub > li.last > .sub-list > li { width:131px;}
.gnb-full .gnb-sub > li.find { width:230px; }
.gnb-full .gnb-sub > li.find .find-form { margin-top:10px;}
.gnb-full .gnb-sub > li.find .find-form td { height:28px; }
.gnb-full .gnb-sub > li.find .find-form td select { width:100%;}
.gnb-full .gnb-sub > li.find .find-form td input { width:90px; margin-right:3px; padding:3px 1px;}
.gnb-full .gnb-sub > li.find .find-form th.img { padding-top:10px;}


#contents .visual{background:#f4f4f4; border-bottom:1px solid #d0d0d0; }
#contents .visual .wrapper{min-height:355px;position:relative; }
#contents .visual .copyright{margin-top:56px;position:relative;z-index:99}
#contents .visual .visual-image{position:relative;}
#contents .visual .visual-image li{display:none;position:absolute;top:0;left:0;z-index:96;}
#contents .visual .visual-image li.on{display:block}
#contents .visual .visual-image li:first-child{z-index:97}
#contents .visual .visual-image li.on{z-index:98}
#contents .visual .visual-image li .link1{position:absolute;top:239px;left:20px;z-index:99}
#contents .visual .visual-menu{margin-top:15px;overflow:hidden;position:relative;z-index:99;}
#contents .visual .visual-menu li{float:left;padding:0 6px 0 5px}

#contents .visual .vtab-menu{margin-top:30px;overflow:hidden;position:absolute;bottom:0;left:0;z-index:99;}
#contents .visual .vtab-menu li{float:left;}
#contents .visual .vtab-menu li+.on a{background:url("/rent/images/bg/bg05.png") repeat-y;padding-left:23px;margin-left:-23px;position:relative;z-index:99}
#contents .visual .vtab-menu li a,#contents .visual .vtab-menu li a img{display:block}

/*main big banner*/
#contents .visual .m_visual {float:left; overflow:hidden; width:996px; height:355px;}
#contents .visual .m_visual .rolling { display:block; position:absolute; top:320px;left:45px; overflow:hidden; z-index:100; }
#contents .visual .m_visual .rolling li {float:left; padding-left:5px;}
#contents .visual .m_visual .main-banner{ display:block; float:left;}
#contents .visual .m_visual .visual-controll { position:absolute; top:313px;left:15px; z-index:100; }

#contents .visual .m_visual .visual-wrap {overflow:hidden; width:996px; height:355px; position:relative; }
#contents .visual .m_visual .visual-wrap li {width:996px; height:355px; position:absolute; }


#contents .visual .booking{position:absolute;top:19px;right:0;z-index:9999;}
#contents .visual .booking .btns{text-align:right;position:relative;z-index:2;}
#contents .visual .booking .btns.center{text-align:center;padding:10px 0}
#contents .visual .booking .reservation{background:#fff;border:3px solid #e0002a;min-width:316px; *width:410px; margin-top:-2px; }
#contents .visual .booking .reservation .r_head{background:#efefef;margin:0px 0 5px;display:table;width:100%;}
#contents .visual .booking .reservation .r_head label{display:table-cell;padding-left:10px;width:50%;font-weight:bold;padding:11px 0 10px 10px}
#contents .visual .booking .reservation .form{padding:10px 10px 0px 10px;}
#contents .visual .booking .reservation .form input[type=text]{border:1px solid #dedede;padding:0;margin:0;height:21px;font:normal 12px/19px 'Nanum Gothic',"맑은 고딕",MalgunGothic,dotum;padding-left:10px}
#contents .visual .booking .reservation .form input.ipt1{width:69px;}
#contents .visual .booking .reservation .form input.ipt2{width:114px;*width:104px;}
#contents .visual .booking .reservation .form select{border:1px solid #dedede;font:normal 12px/19px 'Nanum Gothic',"맑은 고딕",MalgunGothic,dotum;height:21px;padding:1px;margin:0}
#contents .visual .booking .reservation .form table{border-top:2px solid #313131;width:100%;}
#contents .visual .booking .reservation .form table td,#contents .visual .booking .reservation .form table th{border-bottom:1px solid #dedede;vertical-align:middle}
#contents .visual .booking .reservation .form table th{text-align:left;padding:8px 0 8px 10px}
#contents .visual .booking .reservation .form table td{padding:4px 0 4px 10px}
#contents .visual .booking .reservation .form table td+td,#contents .visual .booking .reservation .form table th+th,#contents .visual .booking .reservation .form table th+td,#contents .visual .booking .reservation .form table td+th{border-left:1px solid #dedede}
#contents .visual .booking .reservation .form table > tbody > tr > th{background:#f9f9f9;}
#contents .visual .booking .reservation .form table > tbody > tr > th.th2{background:#fffbfa}
#contents .visual .booking .reservation .form table > tbody > tr >td .btn{display:inline-block;vertical-align:middle}
#contents .visual .booking .reservation .form .submit{background:url("/rent/images/btn/r003.png") no-repeat;cursor:pointer;width:123px;height:39px;border:0;text-indent:-9999px}
#contents .content{margin-top:20px;overflow:hidden;}
#contents .content a{float:left;}
#contents .content a+a{margin-left:10px}
#contents .banners{margin:10px 0 30px;overflow:hidden;}
#contents .banners .banner{float:left;vertical-align:top;}
#contents .banners .banner+.banner{margin-left:9px;margin-bottom:10px}
#contents .banners .banner.nl,#contents .banners .banner:first-child{margin-left:1px;clear:left}
#contents .banners .banner.banner03{border:1px solid #e4e4e4;width:289px;padding:18px 15px 11px 20px; *padding:16px 15px 10px 20px}

/*loling banner*/
#contents .banners .banner .m_banner {float:left; position:relative; overflow:hidden; border:1px solid #ddd;}
#contents .banners .banner .m_banner .main-s-rolling { display:block; position:absolute; top:180px;left:45px; overflow:hidden; z-index:100; }
#contents .banners .banner .m_banner .main-s-rolling li {float:left; padding-left:5px;}
#contents .banners .banner .m_banner .main-s-banner{ display:block; float:left; width:324px; height:205px; }
#contents .banners .banner .m_banner .event-controll { position:absolute; top:173px;left:15px; z-index:100; }

#contents .banners .banner .m_banner .event-scroll-wrap {overflow:hidden; width:324px; height:205px; position:relative; }
#contents .banners .banner .m_banner .event-scroll-wrap li {width:324px; height:205px; position:absolute; }

#contents .btabs .tab-menu{margin-bottom:8px;}
#contents .btabs .tab-menu .btn-more{position:absolute;top:2px;right:1px}
#contents .btabs .tab-menu .menu{overflow:hidden;}
#contents .btabs .tab-menu .menu li{float:left;padding-right:15px;}
#contents .btabs .tab-menu .menu li+li{border-left:1px solid #dadada;padding-left:15px}
#contents .btabs .tab-menu .menu li.more { position:relative; float:right;padding-right:15px;}
#contents .btabs .tab-content{font-size:12px;line-height:22px;}
#contents .btabs .tab-content .tlist01 li{background:url("/rent/images/blt/002.png") no-repeat 1px 9px;padding-left:8px;position:relative;}
#contents .btabs .tab-content .tlist01 li span{position:absolute;right:0;top:0}
.quickmenu{background:#fff;position:absolute;top:257px;right:30px;width:68px;border:1px solid #dcdcdc;margin-top:1px;}
.quickmenu .line{position:absolute;top:-3px;left:-1px;width:70px;height:2px;background:#e51937}
.quickmenu ul li{margin-top:15px;text-align:center}
.quickmenu .btntop{display:block;margin-top:12px;padding-top:7px;text-align:center;background:#b0b0b0}
.quickmenu .sns { position:absolute; width:70px; text-align:center; bottom:-30px;}
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video{
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	font-family:'Nanum Gothic',"맑은 고딕","돋움", "굴림";
}
</style>
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
	<script src="${pageContext.request.contextPath}/js/script.js"></script>
<!-- <script data-rocketsrc="http://www.designbootstrap.com/track/ga.js"  type="text/rocketscript"></script> -->
</head>

<body>
    <!-- <header>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <strong>문의: </strong> WheneverYes@rent3.com
                    <a class="__cf_email__" href="/cdn-cgi/l/email-protection" data-cfemail="4821262e270831273d3a2c2725292126662b2725">[email&#160;protected]</a><script data-cfhash='f9e31' type="text/javascript">/* <![CDATA[ */!function(t,e,r,n,c,a,p){try{t=document.currentScript||function(){for(t=document.getElementsByTagName('script'),e=t.length;e--;)if(t[e].getAttribute('data-cfhash'))return t[e]}();if(t&&(c=t.previousSibling)){p=t.parentNode;if(a=c.getAttribute('data-cfemail')){for(e='',r='0x'+a.substr(0,2)|0,n=2;a.length-n;n+=2)e+='%'+('0'+('0x'+a.substr(n,2)^r).toString(16)).slice(-2);p.replaceChild(document.createTextNode(decodeURIComponent(e)),c)}p.removeChild(t)}}catch(u){}}()/* ]]> */</script>
                    &nbsp;&nbsp;
                    <strong>고객센터: </strong>1544-XXXX
                </div>
            </div>
        </div>
        상단 띠 이미지 영역
	
    </header> -->
    <div id="topImg" class="top_Img" style="background:url(${pageContext.request.contextPath }/images/top_img1.PNG)  repeat-x">
		&nbsp;
	</div>
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
	                                <a href="${pageContext.request.contextPath}/user/regedit.do" class="btn btn-info btn-sm">회원정보수정</a>&nbsp; <a href="${pageContext.request.contextPath}/user/logout.do" class="btn btn-danger btn-sm">로그아웃</a>
                                </c:if>
                                <c:if test="${empty sessionScope.userId }">
	                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/login.do" class="btn btn-danger btn-sm">로그인</a>
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
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a href="${pageContext.request.contextPath}/user/realTime.do">
                            	<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span> 실시간예약</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/confirm.do">
                            	<span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span> 예약확인</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/review.do">
                            	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 이용후기</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/serviceCenter.do">
                            	<span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span> 고객센터</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/benefits.do">
                            	<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> 이용혜택</a></li>
                            <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" >
                            	<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> 회사소개
                            	<span class="caret"></span></a>
                            	<ul class="dropdown-menu" role="menu" style="background-color: #00679a;">
				                <li><a href="<c:url value="/user/greeting.do"/>">인사말</a></li>
				                <li><a href="<c:url value="/user/position.do"/>">회사위치</a></li>
				                <li><a href="<c:url value="/user/guide.do"/>">지점안내</a></li>
				              </ul>
                            </li>
                            	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                            	<c:if test="${empty sessionScope.userId }">
		                            <li><a href="${pageContext.request.contextPath}/user/login.do">
		                            	<span class="glyphicon glyphicon-off" aria-hidden="true"></span> 로그인</a></li>
		                            <li><a href="javascript:openJoin();">
		                            	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 회원가입</a></li>
		                        </c:if>
                            	<c:if test="${!empty sessionScope.userId }">
		                            <li><a href="<c:url value="/user/logout.do"/>">
		                            	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 로그아웃</a></li>
		                            <li><a href="<c:url value="/user/regedit.do"/>">
		                            	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 회원정보수정</a></li>
                            	</c:if>
                        </ul>
                    
                    <%--  <c:if test="${!empty sessionScope.userId }">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a href="${pageContext.request.contextPath}/user/realTime.do">실시간예약</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/confirm.do">예약확인</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/review.do">이용후기</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/serviceCenter.do">고객센터</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/benefits.do">이용혜택</a></li>
                        	<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" >회사소개<span class="caret"></span></a>
                            	<ul class="dropdown-menu" role="menu" style="background-color: #00679a;">
				                <li><a href="<c:url value="/user/greeting.do"/>">인사말</a></li>
				                <li><a href="<c:url value="/user/position.do"/>">회사위치</a></li>
				                <li><a href="<c:url value="/user/guide.do"/>">지점안내</a></li>
				              </ul> 
                            </li>
                        </ul>
                    </c:if> --%>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- MENU SECTION END-->
		

		
		
		
		
		
		
		
		
		
		








