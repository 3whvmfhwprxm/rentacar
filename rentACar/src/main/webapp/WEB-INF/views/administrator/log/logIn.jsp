<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/top.jsp"%>

<link href="${pageContext.request.contextPath}/css/admin_logIn.css" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function(){

		if($("input:checkbox[name=chkSaveId]").is(":checked")){
			$("#pwd").focus();
		}else{
			$("#Admin_Id").focus();
		}
		
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
                        <legend>3조 렌트카 관리자</legend>
                        <div class="form-group">
                            <label for="Admin_Id">아이디</label>
                            <input type="text" id="Admin_Id" name="Admin_Id" class="form-control"
                            	value="${cookie.ck_admin_Id.value}" placeholder="Admin_Id" />
                        </div>
                        <div class="form-group">
                            <label for="pwd">비밀번호</label>
                            <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password" />
                        </div>
                        <div class="input-group">
                          <div class="checkbox">
                            <label>
                              <input type="checkbox" id="chkId" name="chkSaveId"
                              	<c:if test="${!empty cookie.ck_admin_Id}">
									checked="checked"
								</c:if>> 아이디 저장
                            </label>
                          </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="로그인" />
                        </div>      
                    </fieldset>
                </form>   
            </div>
        </div>
        <div class='col-md-3'></div>
    </div>
</div>
<%@ include file="../include/bottom.jsp"%>