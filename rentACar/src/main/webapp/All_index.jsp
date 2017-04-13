<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.gallery-title {
	font-size: 36px;
	color: #42B32F;
	text-align: center;
	font-weight: 500;
	margin-bottom: 70px;
}

.gallery-title:after {
	content: "";
	position: absolute;
	width: 7.5%;
	left: 46.5%;
	height: 45px;
	border-bottom: 1px solid #5e5e5e;
}

.filter-button {
	font-size: 18px;
	border: 1px solid #42B32F;
	border-radius: 5px;
	text-align: center;
	color: #42B32F;
	margin-bottom: 30px;
}

.filter-button:hover {
	font-size: 18px;
	border: 1px solid #42B32F;
	border-radius: 5px;
	text-align: center;
	color: #ffffff;
	background-color: #42B32F;
}

.filter-button.active {
	background-color: #42B32F;
	color: white;
}

.port-image {
	width: 100%;
}

.gallery_product {
	margin-bottom: 30px;
}
</style>
</head>
<script type="text/javascript" src="/jquery/jquery-3.1.1.min.js">
$(document).ready(function(){

    $(".filter-button").click(function(){
        var value = $(this).attr('data-filter');  
        if(value == "all"){         
            $('.filter').show('1000');
        }else{
            $(".filter").not('.'+value).hide('3000');
            $('.filter').filter('.'+value).show('3000');
        }
    });

});
</script>
<body>
	<div class="container">
		<div class="row">
			<div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<h1 class="gallery-title">현대직업 렌트카</h1>
			</div>

			<div align="center">
				<button class="btn btn-default filter-button active"
					data-filter="all">모두</button>
				<button class="btn btn-default filter-button" data-filter="hdpe">관리자시스템</button>
				<button class="btn btn-default filter-button" data-filter="sprinkle">상담 관리 시스템</button>
				<button class="btn btn-default filter-button" data-filter="spray">업체 시스템</button>
				<button class="btn btn-default filter-button"
					data-filter="irrigation">고객 시스템(웹사이트)</button>
			</div>
			<br />



			<div
				class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
				<img src="http://fakeimg.pl/365x365/" class="img-responsive">
			</div>

			<div
				class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter sprinkle">
				<img src="http://fakeimg.pl/365x365/" class="img-responsive">
			</div>

			<div
				class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
				<img src="http://fakeimg.pl/365x365/" class="img-responsive">
			</div>

			<div
				class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter irrigation">
				<img src="http://fakeimg.pl/365x365/" class="img-responsive">
			</div>

			<div
				class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter spray">
				<img src="http://fakeimg.pl/365x365/" class="img-responsive">
			</div>

			<div
				class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter irrigation">
				<img src="http://fakeimg.pl/365x365/" class="img-responsive">
			</div>

			<div
				class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter spray">
				<img src="http://fakeimg.pl/365x365/" class="img-responsive">
			</div>

			<div
				class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter irrigation">
				<img src="http://fakeimg.pl/365x365/" class="img-responsive">
			</div>

			<div
				class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter irrigation">
				<img src="http://fakeimg.pl/365x365/" class="img-responsive">
			</div>

			<div
				class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
				<img src="http://fakeimg.pl/365x365/" class="img-responsive">
			</div>

			<div
				class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter spray">
				<img src="http://fakeimg.pl/365x365/" class="img-responsive">
			</div>

			<div
				class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter sprinkle">
				<img src="http://fakeimg.pl/365x365/" class="img-responsive">
			</div>
		</div>
	</div>
	</section>
</body>
</html>