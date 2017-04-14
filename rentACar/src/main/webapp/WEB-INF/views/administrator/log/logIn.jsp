<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/admin_logIn.css" rel="stylesheet">

<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#Admin_Id").focus();
		
		$("#frmLogin").submit(function(){
			if($("#Admin_Id").val()==''){
				alert('아이디를 입력하세요');
				$("#Admin_Id").focus();
				return false;
			}else if($("#pwd").val()==''){
				alert('비밀번호를 입력하세요');
				$("#pwd").focus();
				return false;
			}
		});
	});
</script>

</head>
<body>
<div class="container">
    <div class="row">
        <div class='col-md-3'></div>
        <div class="col-md-6">
            <div class="login-box well">
            	<form name="frmLogin" id="frmLogin" method="post"
            		action='<c:url value="/administrator/log/logIn.do" />'>
                    <fieldset>
                        <legend>Sign In</legend>
                        <div class="form-group">
                            <label for="Admin_Id">Admin_Id</label>
                            <input type="text" id="Admin_Id" class="form-control"
                            	value="${cookie.ck_admin_Id.value}" placeholder="Admin_Id" />
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password</label>
                            <input type="password" id="pwd" class="form-control" placeholder="Password" />
                        </div>
                        <div class="input-group">
                          <div class="checkbox">
                            <label>
                              <input type="checkbox" id="chkId" name="chkId" value="1"
                              	<c:if test="${!empty cookie.ck_admin_id}">
									checked="checked"
								</c:if>> Remember me
                            </label>
                          </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="Log In" />
                        </div>      
                    </fieldset>
                </form>   
            </div>
        </div>
        <div class='col-md-3'></div>
    </div>
</div>
</body>
</html>