<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_user/top.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#idSearch").click(function(){
			$.ajax({
				url:'<c:url value="/user/userseachid.do"/>',
				type:'post',
				dataType:'json',
				data: $("#frmid").serialize(),
				success:function(res){
					alert("찾으신 아이디는 [ "+res.userId+" ]입니다!");
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


<c:if test='${userId!="" }'>
</c:if>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/logincss.css"/>
	<div class="container">
    <h1 class="welcome text-center">환영합니다<br>3조렌트카</h1>
        <div class="card card-container">
        <h2 class='login_title text-center'>로그인</h2>
        <hr>
            <form class="form-signin" name="frmlogin" method="post" action="<c:url value="/user/login.do"/>">
                <span id="reauth-email" class="reauth-email"></span>
                <p class="input_title" >사용자 아이디</p>
                <input name="userId" type="text" id="inputEmail" class="login_box" value="${cookie.ck_userId.value}" placeholder="아이디 입력" required autofocus>
                <p class="input_title">비밀번호</p>
                <input name="userPwd" type="password" id="inputPassword" class="login_box" placeholder="******" required>
                
				<label style="color: silver; padding: 2px;">
                    <input type="checkbox" name="chkSaveId" id="chkSaveId"
                    <c:if test="${!empty cookie.ck_userId}">checked="checked"</c:if>>&nbsp;아이디 저장
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
						<form method="post" action='' name="login_form" id="frmid">
							<div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">이름 <span class="required">*</span>
					            </label>
					            <div class="col-md-5">
					              <input id="userName" name="userName" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) 홍길동" required="required" type="userName">
					            </div>
					        </div><br>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">이메일 <span class="required">*</span>
					            </label>
					            <div class="col-md-5">
					              <input id="userEmail" name="userEmail" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) hong@naver.com" required="required" type="text">
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
						<form method="post" name="login_form" id="frmpwd" action="<c:url value="/user/userseachpwd.do"/>">
							<div class="row">
					            <label class="control-label col-md-3" for="userId" style="text-align: right;">아이디 <span class="required">*</span>
					            </label>
					            <div class="col-md-5">
					              <input id="userId" name="userId" class="form-control" data-validate-length-range="6" data-validate-words="2" placeholder="ex) hong123" required="required" type="userId">
					            </div>
					        </div><br>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">이메일 <span class="required">*</span>
					            </label>
					            <div class="col-md-5">
					              <input id="userEmail" name="userEmail" class="form-control" data-validate-length-range="6" data-validate-words="2" placeholder="ex) hong@naver.com" required="required" type="text">
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


<%@ include file="../inc_user/bottom.jsp" %>
