<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>

<style type="text/css">
.btn3d {
    position:relative;
    top: -6px;
    border:0;
     transition: all 40ms linear;
     margin-top:10px;
     margin-bottom:10px;
     margin-left:2px;
     margin-right:2px;
}
.btn3d:active:focus,
.btn3d:focus:hover,
.btn3d:focus {
    -moz-outline-style:none;
         outline:medium none;
}
.btn3d:active, .btn3d.active {
    top:2px;
}
.btn3d.btn-white {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255,255,255,0.10) inset, 0 8px 0 0 #f5f5f5, 0 8px 8px 1px rgba(0,0,0,.2);
    background-color:#fff;
}
.btn3d.btn-white:active, .btn3d.btn-white.active {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,.1);
    background-color:#fff;
}
.btn3d.btn-default {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255,255,255,0.10) inset, 0 8px 0 0 #BEBEBE, 0 8px 8px 1px rgba(0,0,0,.2);
    background-color:#f9f9f9;
}
.btn3d.btn-default:active, .btn3d.btn-default.active {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,.1);
    background-color:#f9f9f9;
}
.btn3d.btn-primary {
    box-shadow:0 0 0 1px #417fbd inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #4D5BBE, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#4274D7;
}
.btn3d.btn-primary:active, .btn3d.btn-primary.active {
    box-shadow:0 0 0 1px #417fbd inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color:#4274D7;
}
.btn3d.btn-success {
    box-shadow:0 0 0 1px #31c300 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #5eb924, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#78d739;
}
.btn3d.btn-success:active, .btn3d.btn-success.active {
    box-shadow:0 0 0 1px #30cd00 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #78d739;
}
.btn3d.btn-info {
    box-shadow:0 0 0 1px #00a5c3 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #348FD2, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#39B3D7;
}
.btn3d.btn-info:active, .btn3d.btn-info.active {
    box-shadow:0 0 0 1px #00a5c3 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #39B3D7;
}
.btn3d.btn-warning {
    box-shadow:0 0 0 1px #d79a47 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #D79A34, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#FEAF20;
}
.btn3d.btn-warning:active, .btn3d.btn-warning.active {
    box-shadow:0 0 0 1px #d79a47 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #FEAF20;
}
.btn3d.btn-danger {
    box-shadow:0 0 0 1px #b93802 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #AA0000, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#D73814;
}
.btn3d.btn-danger:active, .btn3d.btn-danger.active {
    box-shadow:0 0 0 1px #b93802 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #D73814;
}
.btn3d.btn-magick {
    color: #fff;
    box-shadow:0 0 0 1px #9a00cd inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #9823d5, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#bb39d7;
}
.btn3d.btn-magick:active, .btn3d.btn-magick.active {
    box-shadow:0 0 0 1px #9a00cd inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #bb39d7;
}
body {
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color:#ffffff;
}
.divImg{
	width: auto;
	margin-left: 150px;
}
.wrap
{
    width: 100%;
    height: 100%;
    min-height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 99;
}

p.form-title
{
    font-family: 'Open Sans' , sans-serif;
    font-size: 40px;
    font-weight: 600;
    text-align: center;
    color: #33CCFF;
    margin-top: 5%;
    text-transform: uppercase;
    letter-spacing: 4px;
}

form
{
    width: 250px;
    margin: 0 auto;
    margin-top:70px;
}

form.login input[type="text"], form.login input[type="password"]
{
    width: 100%;
    margin: 0;
    padding: 5px 10px;
    background: 0;
    border: 0;
    border-bottom: 1px solid #33b78b;
    outline: 0;
    font-size: 20px;
    font-weight: 400;
    letter-spacing: 1px;
    margin-bottom: 5px;
    color: #33CCFF;
    outline: 0;
}

form.login input[type="submit"]
{
    width: 100%;
    font-size: 14px;
    text-transform: uppercase;
    font-weight: 500;
    margin-top: 16px;
    outline: 0;
    cursor: pointer;
    letter-spacing: 1px;
}

form.login input[type="submit"]:hover
{
    transition: background-color 0.5s ease;
}

form.login .remember-forgot
{
    float: left;
    width: 100%;
    margin: 10px 0 0 0;
}
form.login .forgot-pass-content
{
    min-height: 20px;
    margin-top: 10px;
    margin-bottom: 10px;
}
form.login label, form.login a
{
    font-size: 12px;
    font-weight: 400;
    color: #6e33ff;
}

form.login a
{
    transition: color 0.5s ease;
}

form.login a:hover
{
    color: #2ecc71;
}

.pr-wrap
{
    width: 100%;
    height: 100%;
    min-height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 999;
    display: none;
}

.show-pass-reset
{
    display: block !important;
}

.pass-reset
{
    margin: 0 auto;
    width: 250px;
    position: relative;
    margin-top: 22%;
    z-index: 999;
    background: #FFFFFF;
    padding: 20px 15px;
}

.pass-reset label
{
    font-size: 12px;
    font-weight: 400;
    margin-bottom: 15px;
}

.pass-reset input[type="email"]
{
    width: 100%;
    margin: 5px 0 0 0;
    padding: 5px 10px;
    background: 0;
    border: 0;
    border-bottom: 1px solid #000000;
    outline: 0;
    font-style: italic;
    font-size: 12px;
    font-weight: 400;
    letter-spacing: 1px;
    margin-bottom: 5px;
    color: #000000;
    outline: 0;
}

.pass-reset input[type="submit"]
{
    width: 100%;
    border: 0;
    font-size: 14px;
    text-transform: uppercase;
    font-weight: 500;
    margin-top: 10px;
    outline: 0;
    cursor: pointer;
    letter-spacing: 1px;
}

.pass-reset input[type="submit"]:hover
{
    transition: background-color 0.5s ease;
}
.posted-by
{
    position: absolute;
    bottom: 26px;
    margin: 0 auto;
    color: #FFF;
    background-color: rgba(0, 0, 0, 0.66);
    padding: 10px;
    left: 45%;
}
.col-md-6 {
    width: 50%;
    color: #33CCFF; 
}
form.login input[type="text"]::-webkit-input-placeholder {color: #33CCFF; font-size: 20px;}
form.login input[type="password"]::-webkit-input-placeholder {color: #33CCFF; font-size: 20px;}
.col-md-3{width: 35%;}
.col-md-5 {width: 70%;}
</style>

<script type="text/javascript">
	 $(function(){
		 
 		$("#idSearch").click(function(){
 			if($("#comName").val()==''){
				alert('이름을 입력하세요');
				$("#comName").focus();
				return false;
			}else if($("#comEmail").val()==''){
				alert('이메일을 입력하세요');
				$("#comEmail").focus();
				return false;
			}
	 			$.ajax({
	 				url:'<c:url value="/login_company/companyseachid.do"/>',
	 				type:'post',
	 				dataType:'json',
	 				data: $("#frmid").serialize(),
	 				success:function(res){			
		 					alert("찾으신 아이디는 [ "+res.comId+" ]입니다!");
	 				},	
	 				error:function(xhr, status, error){
	 				}
	 			});
 			//alert("이름,이메일주소가 틀립니다.");
 		});
 		
 		/* $("#pwdSearch").click(function(){
 			$.ajax({
 				url:'<c:url value="/user/userseachpwd.do"/>',
 				type:'post',
 				dataType:'json',
 				data: $("#frmpwd").serialize(),
 				success:function(res){
 					alert("찾으신 비밀번호는 [ "+res.userPwd+" ]입니다!");
 				},
 				error:function(xhr, status, error){
 				}
 			});
 		}); */
 		$("#pwdSearch").click(function(){
 			alert("찾으신 비밀번호를 이메일로 발송하였습니다.");
 			$("#frmpwd").submit();
 		});
  
	});
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/companylogincss.css"/>
	<div class="container">
    <h1 class="welcome text-center">환영합니다</h1>
        <div class="card card-container">
        <h2 class='login_title text-center'>Login</h2>
        <hr>
            <form class="form-signin" name="frmlogin" method="post" action='<c:url value="/login_company/com_login.do" />'>
                <span id="reauth-email" class="reauth-email"></span>
                <p class="input_title" >사용자 아이디</p>
                <input name="comId" type="text" id="comId" class="login_box" value="${cookie.ck_comId.value}" placeholder="아이디 입력" required autofocus>
                <p class="input_title">비밀번호</p>
                <input name="comPwd" type="password" id="inputPassword" class="login_box" placeholder="******" required>
                
				<label style="color: silver; padding: 2px;">
                    <input type="checkbox" name="chkSaveId" id="chkSaveId"
                    <c:if test="${!empty cookie.ck_comId.value}">checked="checked"</c:if>>&nbsp;아이디 저장
                </label>
                
                <div id="remember" class="checkbox">
                    <a class="input_title" data-toggle="modal" href="#myModal1">아이디찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="input_title" data-toggle="modal" href="#myModal2">비밀번호 찾기</a>
                </div>
                <button class="btnlogin btn-lg btn-primary" type="submit">로그인</button>
            </form><!-- /form -->
        </div><!-- /card-container -->
    </div><!-- /container -->
        
        <!-- 아이디찾기 -->
<div class="container">
	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
		<div class="modal fade" id="myModal1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">아이디 찾기</h4>
					</div>
					<div class="modal-body">
						<form method="post" name="login_form" id="frmid">
							<div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">업체이름 <span class="required">*</span>
					            </label>
					            <div class="col-md-5">
					              <input id="comName" name="comName" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) 홍길동" required="required" type="comName">
					            </div>
					        </div><br>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">이메일 <span class="required">*</span>
					            </label>
					            <div class="col-md-5">
					              <input id="comEmail" name="comEmail" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) hong@naver.com" required="required" type="text" value="${companyVo.getComEmail}">
					            </div>
					        </div><br>
					        <!-- <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;" disabled>찾으신 아이디
					            </label>
					            <div class="col-md-5">
					              <input id="userEmail" name="userEmail" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) hong@naver.com" required="required" type="text" value="hong123" disabled>
					            </div>
					        </div><br> -->
						</form>
					</div>
					<!-- <form name="frmid" method="post" action="<c:url value="/user/userseachid.do"/>"> -->
						<div class="modal-footer">
			           		 <button type="button" class="btn btn-primary" id="idSearch" data-dismiss="modal">확인</button>
						</div>
					<!-- </form> -->
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</div>
</div>
<!-- /.modal -->

<!-- 비밀번호 찾기 -->
<div class="container">
	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
		<div class="modal fade" id="myModal2">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">비밀번호 찾기</h4>
					</div>
					<div class="modal-body">
						<form method="post" name="login_form" id="frmpwd" action="<c:url value="/login_company/companyseachpwd.do"/>">
							<div class="row">
					            <label class="control-label col-md-3" for="userId" style="text-align: right;">아이디 <span class="required">*</span>
					            </label>
					            <div class="col-md-5">
					              <input id="comIdSeach" name="comIdSeach" class="form-control" data-validate-length-range="6" data-validate-words="2" placeholder="ex) hong123" required="required" type="userId">
					            </div>
					        </div><br>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">이메일 <span class="required">*</span>
					            </label>
					            <div class="col-md-5">
					              <input id="comEmailSeach" name="comEmailSeach" class="form-control" data-validate-length-range="6" data-validate-words="2" placeholder="ex) hong@naver.com" required="required" type="text">
					            </div>
					        </div><br>
					        
					        <div class="modal-footer">
			           		 <button type="submit" class="btn btn-primary" id="pwdSearch" data-dismiss="modal">이메일발송</button>
						</div>
						</form>
					</div>
					<!-- <form name="frmid" method="post" action="<c:url value="/user/userseachid.do"/>"> -->
						
					<!-- </form> -->
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</div>
</div>
<!-- /.modal -->












<%@ include file="../inc_company/company_bottom.jsp" %>