<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/logincss.css"/>
	<h1>login.jsp</h1>
	<div class="container">
    <h1 class="welcome text-center">Welcome to <br> RentA Car</h1>
        <div class="card card-container">
        <h2 class='login_title text-center'>Login</h2>
        <hr>

            <form class="form-signin" name="frmlogin" method="post" action="<c:url value="/inc_user/login.do"/>">
                <span id="reauth-email" class="reauth-email"></span>
                <p class="input_title">UserID</p>
                <input name="userId" type="text" id="inputEmail" class="login_box" placeholder="USER ID" required autofocus>
                <p class="input_title">Password</p>
                <input name="userPwd" type="password" id="inputPassword" class="login_box" placeholder="******" required>
                <div id="remember" class="checkbox">
                    <label>
                        
                    </label>
                </div>
                <button class="btn btn-lg btn-primary" type="submit">Login</button>
            </form><!-- /form -->
        </div><!-- /card-container -->
    </div><!-- /container -->

<%@ include file="bottom.jsp" %>
