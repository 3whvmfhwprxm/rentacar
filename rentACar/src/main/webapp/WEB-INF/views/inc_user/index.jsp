<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<script type="text/javascript" src="../jquery/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<style type="text/css">
body {
	padding-top: 80px;
}
</style>

<script>
	$(document).ready(function() {
      $('.carousel').carousel({
		interval:2000		
      });
	});
</script>

</head>
<body>
	<!-- <div class="container-fluid"> -->
	<div class="container">
		<div id="carousel-example-generic" class="carousel slide">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			<!-- Carousel items -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="${pageContext.request.contextPath}/user_img/9k=.jpg" alt="First slide">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/user_img/2Q==.jpg" alt="Second slide">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/user_img/bg-banner-170310-7.jpg" alt="Third slide">
				</div>
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
				<span class="icon-prev"></span>
				<!-- <img src="../imgs/left.png" class="control"> -->
				<!-- <span class="glyphicon glyphicon-chevron-left"></span> -->
			</a> <a class="right carousel-control" href="#carousel-example-generic"	data-slide="next">
				<span class="icon-next"></span>
				<!-- <img src="../imgs/right.png" class="control"> -->
				<!-- <span class="glyphicon glyphicon-chevron-right "></span> -->
			</a>
		</div>
	</div>
	
<%@ include file="bottom.jsp" %>








