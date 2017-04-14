<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>3조 렌터카</title>
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/top.css" />
<script type="text/javascript"
	src='<c:url value="/jquery/jquery-3.1.1.min.js"/>'></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
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
					<a class="navbar-brand" href="#"> 3조 렌트카 관리자 </a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">


						<li class="dropdown mega-dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">회원관리 </a>
							<ul class="dropdown-menu mega-dropdown-menu">
								<li class="dropdown1 col-sm-4"><a href="#" >회원 수정 </a>
								<li class="col-sm-4">회원 삭제 </li>
								<li class="col-sm-4">탈퇴 회원 조회</li>
							</ul>
						</li>
						
						<li class="dropdown mega-dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">회원관리 </a>
							<ul class="dropdown-menu mega-dropdown-menu">
								<li class="dropdown1 col-sm-4"><a href="#" >회원 수정 </a>
								<li class="col-sm-4">회원 삭제 </li>
								<li class="col-sm-4">탈퇴 회원 조회</li>
							</ul>
						</li>
						
						<li class="dropdown mega-dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">Customers</a>
							<ul class="dropdown-menu mega-dropdown-menu">
								<li class="dropdown1 col-sm-3"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">Dropdown
										Customers</a>
									<ul class="dropdown-menu">
										<li><a href="#">Action</a></li>
										<li><a href="#">Another action</a></li>
										<li><a href="#">Something else here</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="#">Separated link</a></li>
									</ul></li>

								<li class="col-sm-3">Features Customers</li>
								<li class="col-sm-3">Plus Customers</li>
								<li class="col-sm-3">Much more Customers</li>

							</ul></li>
						<li class="dropdown mega-dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">Vechiles </a>
							<ul class="dropdown-menu mega-dropdown-menu">
								<li class="dropdown1 col-sm-3"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">Dropdown
										Vechiles </a>
									<ul class="dropdown-menu">
										<li><a href="#">Action</a></li>
										<li><a href="#">Another action</a></li>
										<li><a href="#">Something else here</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="#">Separated link</a></li>
									</ul></li>
								<li class="col-sm-3">Features Vechiles</li>
								<li class="col-sm-3">Plus Vechiles</li>
								<li class="col-sm-3">Much more Vechiles</li>
							</ul></li>
						<li class="dropdown mega-dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">Installers</a>
							<ul class="dropdown-menu mega-dropdown-menu">
								<li class="dropdown1 col-sm-3"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">Dropdown
										Installers</a>
									<ul class="dropdown-menu">
										<li><a href="#">Action</a></li>
										<li><a href="#">Another action</a></li>
										<li><a href="#">Something else here</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="#">Separated link</a></li>
									</ul></li>
								<li class="col-sm-3">Features Installers</li>
								<li class="col-sm-3">Plus Installers</li>
								<li class="col-sm-3">Much more Installers</li>
							</ul></li>
						<li class="dropdown mega-dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">Mangers </a>
							<ul class="dropdown-menu mega-dropdown-menu">
								<li class="dropdown1 col-sm-3"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">Dropdown Mangers
								</a>
									<ul class="dropdown-menu">
										<li><a href="#">Action</a></li>
										<li><a href="#">Another action</a></li>
										<li><a href="#">Something else here</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="#">Separated link</a></li>
									</ul></li>
								<li class="col-sm-3">Features Mangers</li>
								<li class="col-sm-3">Plus Mangers</li>
								<li class="col-sm-3">Much more Mangers</li>
							</ul></li>
						<li class="dropdown mega-dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">Schdules </a>
							<ul class="dropdown-menu mega-dropdown-menu">
								<li class="dropdown1 col-sm-3"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">Dropdown
										Schdules </a>
									<ul class="dropdown-menu">
										<li><a href="#">Action</a></li>
										<li><a href="#">Another action</a></li>
										<li><a href="#">Something else here</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="#">Separated link</a></li>
									</ul></li>
								<li class="col-sm-3">Features Schdules</li>
								<li class="col-sm-3">Plus Schdules</li>
								<li class="col-sm-3">Much more Schdules</li>
							</ul></li>

					</ul>

					<ul class="nav navbar-nav navbar-right">

						<li class="dropdown1"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Dropdown </a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>

	<!--  -->
</body>
</html>